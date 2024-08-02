//window_set_fullscreen(true);

lose = false;
win = false;

// delta time
target_delta = 1/60;
actual_delta = delta_time/1000000;
delta_mult = actual_delta/target_delta;

// timer
timer = 0.0;
mins = 0;
timer_zero = "";
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




