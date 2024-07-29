draw_set_font(fnTimer);


if oControl.best_time_mins == 999 {
	draw_text_ext_transformed_color(x-38, y+424, "B E S T    T I M E :    ? ? ?", 1, 700, 0.8, 0.8, 0, c_white, c_white, c_grey, c_grey, 1);
} else {
	draw_text_ext_transformed_color(x-38, y+424, "B E S T    T I M E :    " + string(oControl.best_time_mins) + " : " + string(oControl.best_time_sec), 1, 700, 0.8, 0.8, 0, c_white, c_white, c_grey, c_grey, 1);
}
