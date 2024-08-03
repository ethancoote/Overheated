draw_set_font(fnName);
draw_text(x - 32, y- 64, "Enter Name:")
if string_length(keyboard_string) > 15 {
	keyboard_string = string_copy(keyboard_string, 1, 15);
}

global.name = keyboard_string;

draw_text(x - 32, y, keyboard_string);