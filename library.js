'use strict';

const controllers = require('./lib/controllers');

const plugin = {};

plugin.init = function (params, callback) {
	const router = params.router;
	const hostMiddleware = params.middleware;
	// const hostControllers = params.controllers;

	// We create two routes for every view. One API call, and the actual route itself.
	// Just add the buildHeader middleware to your route and NodeBB will take care of everything for you.

	router.get('/admin/plugins/userlist', hostMiddleware.admin.buildHeader, controllers.renderAdminPage);
	router.get('/api/admin/plugins/userlist', controllers.renderAdminPage);

	callback();
};

plugin.addAdminNavigation = function (header, callback) {
	header.plugins.push({
		route: '/plugins/userlist',
		icon: 'fa-tint',
		name: 'UserList',
	});

	callback(null, header);
};

plugin.addEmails = function (params, callback) {
	var User = require.main.require('./src/user/index');
	let uids = [];
	for(const user in params.templateData.users) {
		uids.push(params.templateData.users[user].uid);
	}
	User.getUsersWithFields(uids, [
		'uid', 'username', 'userslug', 'picture', 'status',
		'postcount', 'reputation', 'email', 'lastonline',
		'flags', 'banned', 'banned:expire', 'joindate',
	], params.req.user.uid).then(
		users => {
			params.templateData.users = users;
			callback(null, params);
		},
		() => {
			callback(null, params);
		}
		);


}

module.exports = plugin;
