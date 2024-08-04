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
	best_time = (best_time_mins * 60) + best_time_sec;
	LootLockerSubmitScoreMetadata("24006", string(best_time*100), string(best_time_mins) + ":" + string(best_time_sec) );
}

audio_play_sound(menuSong2, 99, true);

set_best = false;

LootLockerInitialize("dev_06b3c273ed3b46f2bd803114f294414d", "0.0.0.1", true, 24006);
global.LLdevelopmentMode = true;

set_ll_name = false;
ll_name = "";


