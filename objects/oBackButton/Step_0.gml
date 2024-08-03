var _inst;
_inst = position_meeting(mouse_x, mouse_y, id);

if _inst {
	sprite_index = sBackHover;
	if device_mouse_check_button(0, mb_left) {
		audio_play_sound(click, 1, false);
		room_goto(MenuRoom);
	}
} else {
	sprite_index = sBack;
}

i = get_gamepad();
if gamepad_button_check_pressed(i, gp_face1) {
	audio_play_sound(click, 1, false);
	room_goto(MenuRoom);
	
}
