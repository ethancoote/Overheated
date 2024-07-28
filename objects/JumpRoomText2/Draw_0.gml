draw_set_font(fnText);
draw_text_color(x, y, "J U M P ", c_white, c_white, c_gray, c_gray, alpha);
draw_text_transformed_color(x, y+30, "K e y b o a r d :    S p a c e",0.5,0.5, 0, c_white, c_white, c_gray, c_gray, alpha);
if controller < 4 {
	draw_text_transformed_color(x, y+18, "C o n t r o l l e r :    A",0.5, 0.5,0, c_white, c_white, c_gray, c_gray, alpha);
	
} else {
	draw_text_transformed_color(x, y+18, "C o n t r o l l e r :    X",0.5, 0.5,0, c_white, c_white, c_gray, c_gray, alpha);
}

