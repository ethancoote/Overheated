var _pitch = random_range(0.9, 1.1);
var _pitch_low = random_range(0.3, 0.5);

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

if place_meeting(x, y, oHitbox) && explode_timer == 0 {
	
	if oPlayer.heat < 6 {
		oPlayer.heat++;
	}
	explode_timer = explode_frames + hitpause_frames;
	oPlayer.hitpause = hitpause_frames;
	//oPlayer.safe_timer = explode_frames + hitpause_frames;
	audio_play_sound(hit1, 1, false, 0.7, 0, _pitch);
	spd = 0;
	oPlayer.hp += 10;
	if oPlayer.hp > 100 {
		oPlayer.hp = 100;
	}
	
	
}

if explode_timer > 0 {
	explode_timer--;
	if explode_timer == explode_frames {
		audio_play_sound(enemyDeath2, 1, false, 0.5, 0, _pitch_low);
		sprite_index = sEnemyLavaDeath;
		image_index = 0;
	}
	if explode_timer == 0 {
		instance_destroy();
	}
}