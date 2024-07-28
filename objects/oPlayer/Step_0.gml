// player controls
_i = get_gamepad();
get_controls(_i);

// setting heat
if x_spd == spd || x_spd == -spd {
	if heat_timer < heat_frames {
		heat_timer++;
	} else if heat_timer == heat_frames {
		heat_timer = 0;
		if heat < 6 {
			heat += 1;
		}
	}
} else if heat_timer > 0 {
	heat_timer--;
	if heat_timer == 0 {
		heat_timer = heat_frames-1;
		if heat > 0 {
			heat--;
		}
	}
}

if heat == 5 {
	heat_extra = 0.5;
} else if heat == 6 {
	heat_extra = 1;
} else {
	heat_extra = 0;
}

// speed
spd = 3 + (heat/4) + heat_extra;
air_spd = spd;

// saving poisition for point direction
last_y = y;
last_x = x;

// grounded
if y_spd >= 0 && place_meeting(x, y+1, walls) {
	grounded = true;
} else { 
	grounded = false;
}

// face
if x_spd > 0 {
	face = 1;
} else if x_spd < 0 {
	face = -1;
}

// movement
move_dir = right_key - left_key;
if grounded {
	jump_count = jumps;
	ideal_spd = move_dir * spd;
	coyote_timer = coyote_frames;
} else {
	ideal_spd = move_dir * air_spd;
	if jump_count == jumps && coyote_timer > 0{
		coyote_timer--;
	} else if jump_count == jumps && coyote_timer == 0 {
		jump_count = jumps - 1;
	} 
	
	if on_wall_left || on_wall_right {
		jump_count = jumps;
		coyote_timer = coyote_frames + 3;
	}
}

// accel and momentum
if x_spd < ideal_spd {
	x_spd += accel;
	if x_spd > ideal_spd {
		x_spd = ideal_spd;
	}
} else if x_spd > ideal_spd {
	x_spd -= accel;
	if x_spd < ideal_spd {
		x_spd = ideal_spd;
	}
}

// jump
if jump_key && jump_count > 0 {
	jump_buff_timer = jump_buffer;
	jump_count -= 1;
}

if jump_buff_timer > 0 {
	jump_buff_timer = 0;
	jump_timer = jump_frames;
	jump_hold_timer = jump_hold_frames;
} else if jump_buff_timer > 0 && grounded == false {
	jump_buff_timer--;
}

if jump_timer > 0 {
	y_spd = -jump_power;
	jump_timer--;
	if jump_hold_timer > 0 && jump_hold_key {
		jump_hold_timer--;
		jump_timer++;
	} else {
		jump_hold_timer = 0;
	}
	
	if on_wall_left == true && jump_key && !grounded{
		x_scale = spd / 1.5;
	} else if on_wall_right == true && jump_key && !grounded{
		x_scale = -spd / 1.5;
	}
	x_spd = x_scale;
} else {
	x_scale = x_spd;
}

// gravity
y_spd += grav;
if y_spd > term_vel {
	y_spd = term_vel;
}

// attack
if attack_key && attack_timer == 0 && hurt_timer == 0 && spawn_timer == 0{
	attack_timer = attack_frames;
	image_index = 0;
}

if attack_timer > 0 {
	attack_timer--;
	if attack_timer == 16 {
		if face == 1 {
			hitbox = instance_create_depth(x + 10 + x_spd, y, 0, oHitbox);
		} else if face == -1 {
			hitbox = instance_create_depth(x -30 + x_spd, y, 0, oHitbox);
		}
	}
	if attack_timer == 8 {
		instance_destroy(hitbox);
		hitbox = noone;
	}
}

// got hit
if place_meeting(x, y, oLose) && hurt_timer == 0 {
	hurt_timer = hurt_frames;
	hp -= 50;
}

if ((instance_place(x, y, oEnemyLava)) != noone) && hurt_timer == 0 && (attack_timer < 6 || attack_timer > 17) {
	enemy_hurt = instance_place(x, y, oEnemyLava);
	if enemy_hurt.explode_timer == 0 {
		hurt_timer = hurt_frames;
		hp -= 35;
	}
}

if ((instance_place(x, y, oEnemyLavaStill)) != noone) && hurt_timer == 0 && (attack_timer < 6 || attack_timer > 17) {
	enemy_hurt = instance_place(x, y, oEnemyLavaStill);
	if enemy_hurt.explode_timer == 0 {
		hurt_timer = hurt_frames;
		hp -= 35;
	}
	
}

if ((instance_place(x, y, oEnemyLavaVert)) != noone) && hurt_timer == 0 && (attack_timer < 6 || attack_timer > 17) {
	enemy_hurt = instance_place(x, y, oEnemyLavaVert);
	if enemy_hurt.explode_timer == 0 {
		hurt_timer = hurt_frames;
		hp -= 35;
	}
}

if hurt_timer > 0 {
	heat = 0;
	heat_timer = heat_frames;
	draw_color = c_red;
	hurt_timer--;
	if hp > 0 {
		x_spd = -3;
		y_spd = -1;
	} else {
		x_spd = 0;
		y_spd = 0;
	}
} else {
	draw_color = c_white;
}

// heat damage
if heat == 6 {
	hp -= 0.20;
}

if spawn_timer > 0 {
	if spawn_timer == spawn_frames {
		image_index = 0;
	}
	x_spd = 0;
	y_spd = 0;
	spawn_timer--;
	
}

// win
if place_meeting(x, y, oWin) {
	oControl.win = true;
	x_spd = 0;
	y_spd = 0;
	oWin.win = true;
	//room_goto(0);
}

if hitpause > 0 {
	hitpause--;
	x_spd = 0;
	y_spd = 0;
	image_speed = 0;
	attack_timer += 1;
	if hitpause == 0 {
		image_speed = 1;
		x_spd = ideal_spd;
		attack_timer = 0;
		if !grounded {
			y_spd = -6;
		}
		
	}
}

if safe_timer > 0 {
	safe_timer--;
}

// y collision
var _sub_pixel = 0.5;
if place_meeting(x, y + y_spd, walls) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, walls) {
		y += _pixel_check;
	}
	y_spd = 0;
}

y += y_spd;

// x collision
if place_meeting(x + x_spd, y, walls) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	while !place_meeting(x + _pixel_check, y, walls) {
		x += _pixel_check;
	}
	if x_spd > 0 {
		on_wall_right = true;
	} else if x_spd < 0 {
		on_wall_left = true;
	}
	x_spd = 0;
	if y_spd > 0 {
		y_spd = wall_slide_spd;
	}
	jump_count = jumps;
	
} else {
	on_wall_left = false;
	on_wall_right = false;
}

x += x_spd;

// death
if hp <= 0 && hurt_timer == 0{
	oControl.lose = true;
	room_restart();
}


