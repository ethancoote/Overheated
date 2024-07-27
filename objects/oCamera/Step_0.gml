// camera controls
ideal_pos[0] = oPlayer.x - cam_width/2;
ideal_pos[0] += 50;


// follow the player
if cam_x < ideal_pos[0] {
	if abs(cam_x - ideal_pos[0]) < 10 {
		cam_x += cam_spd_close;
	} else {
		cam_x += cam_spd;
	}
	if cam_x > ideal_pos[0] {
		cam_x = ideal_pos[0];
	}
	if abs(cam_x - ideal_pos[0]) > 20{
		cam_x = ideal_pos[0] - 20;
	} 
} else if cam_x > ideal_pos[0] {
	if abs(cam_x - ideal_pos[0]) < 10 {
		cam_x -= cam_spd_close;
	} else {
		cam_x -= cam_spd;
	}
	
	if cam_x < ideal_pos[0] {
		cam_x = ideal_pos[0];
	}
	
	if abs(cam_x - ideal_pos[0]) > 20 {
		cam_x = ideal_pos[0] + 20;
	} 
	
	
}

camera_set_view_pos(view_camera[0], cam_x, cam_y);

// background
back_spd = oPlayer.x_spd *0.7;
back_spd1 = oPlayer.x_spd * -1;
back_spd2 = oPlayer.x_spd * 0.3;
layer_hspeed(lay_id, back_spd);
layer_hspeed(lay_id1, back_spd1);
layer_hspeed(lay_id2, back_spd2);