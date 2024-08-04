var _inst;
_inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if _inst {
	sprite_index = sWinMenuButtonHover;
	if device_mouse_check_button(0, mb_left) {
		oWinMenu.win = false;
		var _time = oControl.timer + (oControl.mins*60);
		audio_play_sound(click, 1, false);
		LootLockerSubmitScoreMetadata("24006", string(_time*100), string(oControl.mins) + ":" + string(oControl.timer));
		room_goto(MenuRoom);
	}
} else {
	sprite_index = sWinMenuButton;
}

i = get_gamepad();
if gamepad_button_check_pressed(i, gp_face1) && oWinMenu.win == true{
	oWinMenu.win = false;
	var _time = oControl.timer + (oControl.mins*60);
	audio_play_sound(click, 1, false);
	LootLockerSubmitScoreMetadata("24006", string(_time*100), string(oControl.mins) + ":" + string(oControl.timer));
	room_goto(MenuRoom);
}


if oWinMenu.alpha2 >= 0.7 && alpha < 1{
	alpha += 0.02;
}

if room != WinRoom {
	alpha = 0;
}
