var _inst;
_inst = position_meeting(mouse_x, mouse_y, id);

if _inst != false {
	sprite_index = sLevelsHover;
	if mouse_check_button_pressed(mb_left) {
		//room_goto_next();
	}
} else {
	sprite_index = sLevels;
}

i = get_gamepad();
if gamepad_button_check_pressed(i, gp_face1) {

	//room_goto_next();
}