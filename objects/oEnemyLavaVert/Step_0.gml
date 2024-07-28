// movement
if out == true {
	y -= spd;
} else if out == false {
	y += spd;
}

if y < y_start-x_dist {
	out = false;
} else if y > y_start {
	out = true;
}

if place_meeting(x, y, oHitbox) && explode_timer == 0 {
	
	if oPlayer.heat < 6 {
		oPlayer.heat++;
	}
	explode_timer = explode_frames + hitpause_frames;
	oPlayer.hitpause = hitpause_frames;
	oPlayer.safe_timer = explode_frames + hitpause_frames;
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
		instance_destroy();
	}
}