

if surface_exists(surface) {
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	var _cx = camera_get_view_x(view_camera[0]);
	var _cy = camera_get_view_y(view_camera[0]);

	surface_set_target(surface);
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(0,0, _cw, _ch, 0);
	gpu_set_blendmode(bm_subtract);
	
	
	with (oPlayer) {
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(sLightSource, image_index, x - _cx, y - _cy, 1.5 + random(0.1), 1.5 + random(0.1), 0, c_white, 1);
		
	}
	
	with (oWin) {
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(sLightSource, image_index, x - _cx + 3, y - _cy - 8, 0.7 + random(0.1), 0.7 + random(0.1), 0, c_white, 1);
		gpu_set_blendmode(bm_normal);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sLightSource, image_index, x - _cx + 3, y - _cy - 8, 0.7 + random(0.1), 0.7 + random(0.1), 0, c_yellow, 0.5);
		
	}
	
	
	with (oEnemyLava) {
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(sLightSource, image_index, x - _cx, y - _cy - 12, 0.7 + random(0.1), 0.7 + random(0.1), 0, c_white, 1);
		gpu_set_blendmode(bm_normal);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sLightSource, image_index, x - _cx, y - _cy - 12, 0.7 + random(0.1), 0.7 + random(0.1), 0, c_orange, 0.5);
	}
	
	with (oPlayer) {
		if hitpause > 0 {
			gpu_set_blendmode(bm_normal);
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(sLightSource, image_index, x - _cx, y - _cy, 1.5 + random(0.1), 1.5 + random(0.1), 0, c_red, .4);
		} 
	}
	
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	
	surface_reset_target();
	draw_surface(surface, _cx, _cy);
	

} else {
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	surface = surface_create(_cw, _ch);
	surface_set_target(surface);
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0,0, _cw, _ch, 0);
	
	surface_reset_target();
}
