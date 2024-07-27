draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*face, image_yscale, 0, c_white, 1);

if x_spd != 0 {
	sprite_index = sPlayerRun;
} else {
	sprite_index = sPlayer;
}

if y_spd < 0 {
	sprite_index = sPlayerJump;
} else if y_spd > 0 {
	sprite_index = sPlayerFall;
}

if x_spd > 6 {
	image_speed = 1.5;
} else {
	image_speed = 1;
}