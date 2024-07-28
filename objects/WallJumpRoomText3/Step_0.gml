dist = abs(oPlayer.x - x);

if dist < 100 {
	if alpha < 1 {
		alpha += .05;
	}
} else if dist > 100 {
	if alpha > 0 {
		alpha -= .05;
	}
}

controller = oPlayer._i;