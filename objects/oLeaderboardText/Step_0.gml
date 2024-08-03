var _inst;
_inst = position_meeting(mouse_x, mouse_y, id);

if _inst {
	sprite_index = sLeaderboardsHover;
	if device_mouse_check_button(0, mb_left) {
		room_goto(LeaderboardRoom);
	}
} else {
	sprite_index = sLeaderboards;
}

i = get_gamepad();
if gamepad_button_check_pressed(i, gp_face1) {
	room_goto(LeaderboardRoom);
}
