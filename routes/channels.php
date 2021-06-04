<?php


/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/
use CSLP\Http\Controllers\TeacherController;

Broadcast::channel('CSLP.User.{id}', function ($user, $id) {
	return (int) $user->id === (int) $id;
});
Broadcast::channel('chat-team.{teamworkid}', function ($user) {
	return $user;
});
Broadcast::channel('status.{problemid}', function ($user, $problemid) {	
	$data['user'] = $user;
	$data['data'] = TeacherController::getState($user,$problemid);
	return $data;
});
Broadcast::channel('workspace.{activitiID}', function ($user) {
	return $user;
});