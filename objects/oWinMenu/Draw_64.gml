draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_set_font(fnTimer);

draw_text_transformed_color(x-96, y+96, "T I M E ~ " + string(oControl.last_time_mins) + ":" + string(oControl.last_time_sec), .6, .6, 0, c_white, c_white, c_gray, c_gray, 1);
draw_text_transformed_color(x-96, y+140, "B E S T ~ " + string(oControl.best_time_mins) + ":" + string(oControl.best_time_sec), .6, .6, 0, c_white, c_white, c_gray, c_gray, 1);
