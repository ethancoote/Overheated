cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);


cam_x = oPlayer.x - cam_width/2;
cam_y = oPlayer.y - cam_height/2 - 40;
ideal_pos = [cam_x, cam_y];

cam_spd = 2;
cam_spd_close = 1;

// background
lay_id = layer_get_id("Background");
lay_id1 = layer_get_id("Backgrounds_1");
lay_id2 = layer_get_id("Backgrounds_2");
lay_id3 = layer_get_id("Backgrounds_3");
back_spd = 0;
back_spd1 = 0;
back_spd2 = 0;
back_spd3 = 0;