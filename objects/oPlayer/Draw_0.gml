// changing player sprite
if x_spd != 0 && attack_timer == 0 && spawn_timer == 0{
	sprite_index = sPlayerRun;
} 

if attack_timer > 0 && spawn_timer == 0{
	sprite_index = sPlayerSlash;
} else if x_spd == 0 && spawn_timer == 0{
	sprite_index = sPlayer;
}

if y_spd < -0.5 && attack_timer == 0 && spawn_timer == 0{
	sprite_index = sPlayerJump;
} else if y_spd > 0.5 && attack_timer == 0 && spawn_timer == 0{
	sprite_index = sPlayerFall;
}

if spawn_timer > 0 {
	sprite_index = sPlayerSpawn;
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*face, image_yscale, 0, draw_color, 1);


