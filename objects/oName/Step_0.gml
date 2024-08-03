if global.name != "" && keyboard_check_pressed(vk_enter){
	LootLockerSetPlayerName(global.name);
	room_goto_next();
}
