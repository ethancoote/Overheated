var _inst;
_inst = position_meeting(mouse_x, mouse_y, id);

if _inst {
	sprite_index = sPlayHover;
	if device_mouse_check_button(0, mb_left) {
		oControl.timer = 0;
		oControl.mins = 0;
		audio_play_sound(click, 1, false);
		room_goto(JumpRoom);
	}
} else {
	sprite_index = sPlay;
}

i = get_gamepad();
if gamepad_button_check_pressed(i, gp_face1) || keyboard_check_pressed(vk_enter) {
	oControl.timer = 0;
	oControl.mins = 0;
	audio_play_sound(click, 1, false);
	room_goto(JumpRoom);
}