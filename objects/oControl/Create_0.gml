//window_set_fullscreen(true);

lose = false;
win = false;

// timer
timer = 0.0;
mins = 0;
last_time_mins = 0;
last_time_sec = 0;
best_time_sec = get_best_time_sec();
best_time_mins = get_best_time_mins();
if best_time_sec == "" {
	best_time_sec = 0;
} else {
	best_time_sec = real(best_time_sec);
}

if best_time_mins == "" {
	best_time_mins = 999;
} else {
	best_time_mins = real(best_time_mins);
}

audio_play_sound(menuSong2, 99, true);

set_best = false;


