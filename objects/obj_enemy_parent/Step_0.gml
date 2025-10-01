if(global.pause) {
	image_speed = 0;
	alarm_set(0, alarm_get(0) + 1)
	exit;
}
else {
	image_speed = 1;
}

// spd = 1 + (96 - obj_game_manager.enemy_number) * 0.02;
if(obj_game_manager.enemy_number != 0) {
	spd = (1 + 10 / obj_game_manager.enemy_number) * spd_direction;
}

if(obj_game_manager.left_collision and spd_direction == -1) {
	y += 32;
	spd_direction = 1;
}

if(obj_game_manager.right_collision and spd_direction == 1) {
	y += 32;
	spd_direction = -1;
}

x += spd;