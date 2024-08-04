//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_set_font(fnWin);
draw_set_halign(fa_center);
if room == WinRoom {
	draw_text_transformed_color(x, y - 128, "Y O U    W I N ! ", 1, 1, 0, c_white, c_white, c_gray, c_gray, alpha);
	draw_text_transformed_color(x, y, "T I M E - " + string(oControl.last_time_mins) + ":" + string(oControl.last_time_sec), .6, .6, 0, c_white, c_white, c_gray, c_gray, alpha1);
	draw_text_transformed_color(x, y + 96, "B E S T - " + string(oControl.best_time_mins) + ":" + string(oControl.best_time_sec), .6, .6, 0, c_white, c_white, c_gray, c_gray, alpha2);
}

