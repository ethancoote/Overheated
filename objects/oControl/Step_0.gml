if room != MenuRoom && oWinMenu.win == false{
	timer += (1/60);
	if timer == 60 {
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
	} else if last_time_mins == best_time_mins {
		if last_time_sec < best_time_sec {
			best_time_mins = last_time_mins;
			best_time_sec = last_time_sec;
		}
	}
}

