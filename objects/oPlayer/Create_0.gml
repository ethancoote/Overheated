// stats
spd = 3;
air_spd = 3;
grav = 0.5;
term_vel = 6;
accel = 0.5;
jump_buffer = 7;
jumps = 1;
jump_frames = 4;
jump_hold_frames = 8;
jump_power = 4;
coyote_frames = 3;
walls = layer_tilemap_get_id("Terrain");
wall_slide_spd = 0.8;
heat_scale = 1;
heat_frames = 40;
hp = 100;
hurt_frames = 20;
attack_frames = 24;
spawn_frames = 54;
heat_damage = 0.4;
_i = 0;

// vars
x_spd = 0;
y_spd = 0;
move_dir = 0;
ideal_spd = 0;
jump_timer = 0;
jump_hold_timer = 0;
jump_buff_timer = 0;
jump_count = jumps;
coyote_timer = 0;
grounded = true;
on_wall_left = false;
on_wall_right = false;
in_wall_jump = false;
x_scale = 0;
face = 1;
last_x = 0;
last_y = 0;
heat = 0;
heat_timer = 0;
heat_extra = 0;
hurt_timer = 0;
draw_color = c_white;
attack_timer = 0;
hitbox = noone;
hitpause = 0;
safe_timer = 0;
spawn_timer = spawn_frames;
depth = -1;
enemy_hurt = noone;
ground_jump = false;
grass_timer = 0;
grass_frames = 13;
last_y_spd = 0;
fire_hurt_timer = 0;
last_frame_heat = 0;

reset_frames = 60;
reset_timer = reset_frames;

// spawn location
spawn = [oSpawn.x, oSpawn.y];
x = spawn[0];
y = spawn[1];

audio_play_sound(respawn1, 1, false, 0.7, 0, 0.8);

