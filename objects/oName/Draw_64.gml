draw_set_font(fnName);
draw_text_color(x, y- 64, "Enter Name:", c_white, c_white, c_gray, c_gray, 1);
if string_length(keyboard_string) > 15 {
	keyboard_string = string_copy(keyboard_string, 1, 15);
}

global.name = keyboard_string;

if keyboard_string != last_string {
	audio_play_sound(click, 1, false, 0.8, 0, rand);
}
last_string = keyboard_string;
draw_set_halign(fa_center);
draw_text_color(x, y, keyboard_string, c_white, c_white, c_gray, c_gray, 1);