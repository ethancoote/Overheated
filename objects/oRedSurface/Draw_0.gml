if surface_exists(surface) {
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	var _cx = camera_get_view_x(view_camera[0]);
	var _cy = camera_get_view_y(view_camera[0]);
	
	if room != MenuRoom {
		if oPlayer.heat == 6 {
			surface_set_target(surface);
			draw_set_color(c_red);
			draw_set_alpha(0.07);
			draw_rectangle(0,0, _cw, _ch, 0);
			gpu_set_blendmode(bm_normal);
	
			draw_set_alpha(1);
			surface_reset_target();
			draw_surface(surface, _cx, _cy);
		}
	}
	

} else {
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	surface = surface_create(_cw, _ch);
	surface_set_target(surface);
	draw_set_color(c_red);
	draw_set_alpha(0.07);
	draw_rectangle(0,0, _cw, _ch, 0);
	
	surface_reset_target();
}
