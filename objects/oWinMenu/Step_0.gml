/*if win == false {
	if y > - 400 {
		y = -400;
	}
}

if win == true {
	if y < 104 {
		y += 10;
	}
}*/

if room != WinRoom {
	alpha = 0
	alpha1 = 0;
	alpha2 = 0;
}

if room == WinRoom && alpha <1 {
	alpha += 0.02;
}

if alpha >= 0.7 && alpha1 <1 {
	alpha1 += 0.02;
}

if alpha1 >= 0.7 && alpha2 <1 {
	alpha2 += 0.02;
}