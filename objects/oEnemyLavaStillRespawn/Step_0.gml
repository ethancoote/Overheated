// movement
if out == true {
	x += spd;
} else if out == false {
	x -= spd;
}

if x >= x_start+x_dist {
	out = false;
} else if x <= x_start {
	out = true;
}

if place_meeting(x, y, oHitbox) && explode_timer == 0 && respawn_timer == 0{
	show_debug_message("here");
	if oPlayer.heat < 6 {
		oPlayer.heat++;
	}
	explode_timer = explode_frames + hitpause_frames;
	oPlayer.hitpause = hitpause_frames;
	//oPlayer.safe_timer = explode_frames + hitpause_frames;
	spd = 0;
	oPlayer.hp += 10;
	if oPlayer.hp > 100 {
		oPlayer.hp = 100;
	}
	
	
}

if explode_timer > 0 {
	explode_timer--;
	if explode_timer == explode_frames {
		sprite_index = sEnemyLavaDeath;
		image_index = 0;
	}
	if explode_timer == 0 {
		respawn_timer = respawn_frames;
	}
}

if respawn_timer > 0 {
	sprite_index = sBlank;
	respawn_timer--;
}

show_debug_message("respawn " + string(respawn_timer));
show_debug_message("explode " + string(explode_timer));
if respawn_timer == 0 && explode_timer == 0 {
	
	sprite_index = sEnemyLava;
}