if global.name != "" && keyboard_check_pressed(vk_enter){
	oControl.ll_name = global.name;
	oControl.set_ll_name = true;
	audio_play_sound(click, 1, false);
	room_goto_next();
}

rand = random_range(0.6, 1);
