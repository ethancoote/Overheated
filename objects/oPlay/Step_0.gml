var _inst;
_inst = position_meeting(mouse_x, mouse_y, id);

if _inst != noone {
	sprite_index = sPlayHover;
	if mouse_check_button_pressed(mb_left) {
		oControl.timer = 0;
		oControl.mins = 0;
		room_goto_next();
	}
} else {
	sprite_index = sPlay;
}

i = get_gamepad();
if gamepad_button_check_pressed(i, gp_face1) || keyboard_check_pressed(vk_enter){
	oControl.timer = 0;
	oControl.mins = 0;
	room_goto_next();
}