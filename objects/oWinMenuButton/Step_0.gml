x = oWinMenu.x;
y = oWinMenu.y;

var _inst;
_inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if _inst != false {
	sprite_index = sWinMenuButtonHover;
	if mouse_check_button_pressed(mb_left) {
		oWinMenu.win = false;
		room_goto(MenuRoom);
	}
} else {
	sprite_index = sWinMenuButton;
}

i = get_gamepad();
if gamepad_button_check_pressed(i, gp_face1) && oWinMenu.win == true{
	oWinMenu.win = false;
	room_goto(MenuRoom);
}