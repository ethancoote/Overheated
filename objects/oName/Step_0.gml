if global.name != "" && keyboard_check_pressed(vk_enter){
	LootLockerSetPlayerName(global.name);
	audio_play_sound(click, 1, false);
	room_goto_next();
}

rand = random_range(0.6, 1);
