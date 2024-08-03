draw_set_font(fnName);
draw_set_color(c_white);
draw_text_ext_color(x, y, "L E A D E R B O A R D S", 20, 500, c_white, c_white, c_gray, c_gray, 1);
draw_set_font(fnTimer_1);

for(count=0;count<i;count++) {
	var _spaces = 16 - string_length(names[count]) 
	var _space = "";
	var _j = 0;
	for (_j=0;_j<_spaces;_j++) {
		_space = _space + " ";
	}

	draw_text_ext_color(x -52, y + 64 + (52*count), string(count+1) + ".  " + names[count] + _space + times[count], 20, 1000, c_white, c_white, c_gray, c_gray, 1);
}


