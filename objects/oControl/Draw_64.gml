draw_set_font(fnTimer);
if room != MenuRoom {
	if timer < 10 {
		timer_zero = "0";
	} else {
		timer_zero = ""
	}
	draw_text_ext_color(12,500, string(mins) + ":" + timer_zero + string(timer), 5, 200, c_white, c_white, c_gray, c_gray, 1);
}

