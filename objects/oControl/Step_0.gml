// update delta_time
actual_delta = delta_time/1000000;
global.delta_mult = actual_delta/target_delta;

if room != MenuRoom && room != NameRoom && room != LeaderboardRoom && oWinMenu.win == false{
	timer += (1/60) * global.delta_mult;
	if timer >= 60 {
		timer -= 60;
		mins += 1;
	}
}

// updating best time


if oWinMenu.win == true {
	last_time_mins = mins;
	last_time_sec = timer;
	
	if last_time_mins < best_time_mins {
		best_time_mins = last_time_mins;
		best_time_sec = last_time_sec;
		set_best = true;
	} else if last_time_mins == best_time_mins {
		if last_time_sec < best_time_sec {
			best_time_mins = last_time_mins;
			best_time_sec = last_time_sec;
			set_best = true;
		}
	}
}

if set_best == true {
	set_best_time(string(best_time_mins), string(best_time_sec));
	//LootLockerSubmitScoreMetadata()
	set_best = false;
}
