draw_set_font(fnName);
draw_text(x - 32, y- 64, "Enter Name:")
if string_length(keyboard_string) > 15 {
	keyboard_string = string_copy(keyboard_string, 1, 15);
}

global.name = keyboard_string;

if keyboard_string != last_string {
	audio_play_sound(click, 1, false, 0.8, 0, rand);
}
last_string = keyboard_string;
draw_text(x - 32, y, keyboard_string);