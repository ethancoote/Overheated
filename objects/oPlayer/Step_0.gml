// player controls
_i = get_gamepad();
get_controls(_i);

// random pitch
var _pitch = random_range(0.9, 1.1);
var _pitch_low = random_range(0.7, 0.9);
var _pitch_v_low = random_range(0.4, 0.6);
var _pitch_high = random_range(1.1, 1.3);

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
	if x_spd == 0 && !on_wall_right && !on_wall_left{
		heat_timer--;
	}
	if heat_timer <= 0 {
		heat_timer = heat_frames-1;
		if heat > 0 {
			heat--;
		}
	}
}


if heat == 6 {
	heat_extra = 0.5;
} else {
	heat_extra = 0;
}

// speed
spd = (3 + (heat/4) + heat_extra);
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

	if jump_count == jumps && coyote_timer > 0 {
		coyote_timer--;
	} else if jump_count == jumps && coyote_timer == 0 {
		jump_count = jumps - 1;
	} 
	
	if on_wall_left || on_wall_right {
		jump_count = jumps;
		
		coyote_timer = coyote_frames;
	} 
	
	if on_wall_left {
		wall_jump_timer_l = coyote_frames;
	} else if wall_jump_timer_l > 0 {
		wall_jump_timer_l--;
	}
	
	if on_wall_right {
		wall_jump_timer_r = coyote_frames;
	} else if wall_jump_timer_r > 0 {
		wall_jump_timer_r--;
	}
	
}

accel = accel_start;
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
if jump_key {
	jump_buff_timer = jump_buffer;
	
}

if jump_buff_timer > 0 && jump_count > 0 {
	audio_play_sound(footstep2, 1, false, 0.3, 0, _pitch_high);
	jump_count -= 1;
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

	if wall_jump_timer_l > 0 && !grounded && ground_jump == false  {
		x_scale = spd / 1.2;
	} else if wall_jump_timer_r > 0 && !grounded && ground_jump == false {
		x_scale = -spd / 1.2;
	} else {
		ground_jump = true;
	}
	x_spd = x_scale;
} else {
	x_scale = x_spd;
	ground_jump = false;
}

// gravity
y_spd += grav;
if y_spd > term_vel {
	y_spd = term_vel;
}

// attack
if attack_key && attack_timer == 0 && hurt_timer == 0 && spawn_timer == 0{
	attack_timer = attack_frames;
	audio_play_sound(swoosh1, 1, false, 1, 0, _pitch);
	image_index = 0;
}

if attack_timer > 0 {
	attack_timer--;
	if attack_timer == 16 {
		if face == 1 {
			hitbox = instance_create_depth(x + 10 + (x_spd*3), y + (y_spd*3), 0, oHitbox);
		} else if face == -1 {
			hitbox = instance_create_depth(x -30 + (x_spd*3), y + (y_spd*3), 0, oHitbox);
		}
	}
	
}

if attack_timer < 8 && hitbox != noone {
	instance_destroy(hitbox);
	hitbox = noone;
}

// got hit
if place_meeting(x, y, oLose) && hurt_timer == 0 {
	hurt_timer = hurt_frames;
	hp -= 50;
	audio_play_sound(grunt1, 1, false, 1, 0, _pitch);
	audio_play_sound(hit1, 1, false, 0.7, 0, _pitch_low);
}

if ((instance_place(x, y, oEnemyLava)) != noone) && hurt_timer == 0 && (attack_timer < 6 || attack_timer > 22) {
	enemy_hurt = instance_place(x, y, oEnemyLava);
	if enemy_hurt.explode_timer == 0 {
		hurt_timer = hurt_frames;
		hp -= 35;
		audio_play_sound(grunt1, 1, false, 1, 0, _pitch);
		audio_play_sound(hit1, 1, false, 0.7, 0, _pitch_low);
	}
	
}

if ((instance_place(x, y, oEnemyLavaStill)) != noone) && hurt_timer == 0 && (attack_timer < 6 || attack_timer > 22) {
	enemy_hurt = instance_place(x, y, oEnemyLavaStill);
	if enemy_hurt.explode_timer == 0 {
		hurt_timer = hurt_frames;
		hp -= 35;
		audio_play_sound(grunt1, 1, false, 1, 0, _pitch);
		audio_play_sound(hit1, 1, false, 0.7, 0, _pitch_low);
	}
	
}

if ((instance_place(x, y, oEnemyLavaVert)) != noone) && hurt_timer == 0 && (attack_timer < 6 || attack_timer > 22) {
	enemy_hurt = instance_place(x, y, oEnemyLavaVert);
	if enemy_hurt.explode_timer == 0 {
		hurt_timer = hurt_frames;
		hp -= 35;
		audio_play_sound(grunt1, 1, false, 1, 0, _pitch);
		audio_play_sound(hit1, 1, false, 0.7, 0, _pitch_low);
	}
}

if ((instance_place(x, y, oEnemyLavaStillRespawn)) != noone) && hurt_timer == 0 && (attack_timer < 6 || attack_timer > 22) {
	enemy_hurt = instance_place(x, y, oEnemyLavaStillRespawn);
	if enemy_hurt.explode_timer == 0 && enemy_hurt.respawn_timer == 0{
		hurt_timer = hurt_frames;
		hp -= 35;
		audio_play_sound(grunt1, 1, false, 1, 0, _pitch);
		audio_play_sound(hit1, 1, false, 0.7, 0, _pitch_low);
	}
}

if hurt_timer > 0 {
	heat = 0;
	heat_timer = 0;
	draw_color = c_red;
	hurt_timer--;
	if hp > 0 {
		x_spd = -1;
		y_spd = -2;
	} else {
		x_spd = 0;
		y_spd = 0;
	}
} else {
	draw_color = c_white;
}

// heat damage
if heat == 6 {
	hp -= heat_damage;
	if last_frame_heat == 5 {
		audio_play_sound(heat1, 1, false);
	}
	
	if hp == 80 || hp == 60 || hp == 40 || hp == 20 || hp == 0 {
		audio_play_sound(grunt1, 1, false, 1, 0, _pitch);
		fire_hurt_timer = hurt_frames;
	}
	
	if hp == 0 {
		audio_play_sound(hit1, 1, false, 1, 0, _pitch_low);
	}
}

last_frame_heat = heat;

if fire_hurt_timer > 0 {
	if fire_hurt_timer == hurt_frames {
		draw_color = c_red;
	} 
	
	fire_hurt_timer--;
	if fire_hurt_timer == 0 {
		draw_color = c_white;
	}
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
	
	if !grounded && land_sound_timer == 0{
		audio_play_sound(footstep2, 1, false, 0.3, 0, 1.4);	
		land_sound_timer = land_sound_frames;
	}
}

if land_sound_timer > 0 {
	land_sound_timer--;
}
y += y_spd;

// x collision
if place_meeting(x + (x_spd), y, walls) {
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

// walking sound
if grounded && x_spd != 0 {
	if grass_timer == 0 {
		grass_timer = grass_frames;
		audio_stop_sound(footstep2);
		audio_play_sound(footstep2, 1, false, 0.1, 0, _pitch_low);
	} else {
		grass_timer--;
	}
} else if !grounded {
	grass_timer = grass_frames;
}

last_y_spd = y_spd;

if reset_key {
	oControl.timer = 0;
	oControl.mins = 0;
	room_goto(MenuRoom);
}
