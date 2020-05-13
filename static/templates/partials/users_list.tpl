{{{each users}}}
	<tr class="registered-user" data-uid="{users.uid}">
		<td><a href="{config.relative_path}/user/{users.userslug}">{buildAvatar(users, "20", true)}</a></td>
		<td><i component="user/status" class="fa fa-circle status {users.status}" title="[[global:{users.status}]]"></i>
			<a href="{config.relative_path}/user/{users.userslug}">{users.username}</a></td>
		<td><a href="mailto:{users.email}">{users.email}</a></td>

		<!-- IF section_joindate -->
		<td title="joindate" class="joindate">
			<span class="timeago" title="{users.joindateISO}"></span>
		</td>
		<!-- ENDIF section_joindate -->

		<!-- IF section_sort-reputation -->
		<td title="reputation" class="reputation">
			<i class="fa fa-star"></i>
			<span class="formatted-number">{users.reputation}</span>
		</td>
		<!-- ENDIF section_sort-reputation -->

		<!-- IF section_sort-posts -->
		<td title="post count" class="post-count">
			<i class="fa fa-pencil"></i>
			<span class="formatted-number">{users.postcount}</span>
		</td>
		<!-- ENDIF section_sort-posts -->

		<!-- IF section_flagged -->
		<td title="flag count" class="flag-count">
			<i class="fa fa-flag"></i>
			<span><a class="formatted-number" href="{config.relative_path}/flags?targetUid={users.uid}">{users.flags}</a></span>
		</td>
		<!-- ENDIF section_flagged -->
	</tr>
{{{end}}}