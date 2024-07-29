if win == true && win_timer == 0 && oWinMenu.win == false{
	win_timer = win_frames;
	sprite_index = sWinBlink;
	image_index = 0;
	audio_play_sound(win2, 1, false, 0.5);
}

if win_timer > 0 {
	win_timer--;
	if win_timer == 0 {
		if room != room_last {
			room_goto_next();
		} else {
			oWinMenu.win = true;
			//room_goto(0);
		}
		
	}
}