#region GM_GAME
function gm_game_step() {
	pause = keyboard_check_pressed(vk_escape);

	if(pause) {
		global.pause = !global.pause
	}

	if(global.pause) {
		alarm_set(0, alarm_get(0) + 1);
		show_debug_message(alarm[0])
		exit;
	}

	restart = keyboard_check_pressed(ord("R"));
	info = keyboard_check_pressed(vk_alt);

	if(info){
		show_info = !show_info;
	}

	var _collision_rectangle_left = collision_rectangle(0, 32, 8, 720, obj_enemy_parent, true, 1);
	var _collision_rectangle_right = collision_rectangle(1272, 32, 1280, 720, obj_enemy_parent, true, 1);

	var _collision_rectangle_bottom = collision_rectangle(0, 624, 1280, 666, obj_enemy_parent, true, 1);

	left_collision = false;
	right_collision = false;

	if(_collision_rectangle_left) {
		left_collision = true;
	}

	if(_collision_rectangle_right) {
		right_collision = true;
	}

	if(_collision_rectangle_bottom) {
		instance_destroy(obj_player1);
		instance_destroy(obj_player2);
	}

	if(object_exists(obj_enemy_parent)) {
		enemy_number = instance_number(obj_enemy_parent);
	}
	else {
		enemy_number = 0;
	}

	if(restart) {
		restart = false;
		score_p1 = 0;
		score_p2 = 0;
		minutes = 0;
		seconds = 0;
		minutes_str = "00";
		seconds_str = "00";
		room_restart();
	}
	
	if(enemy_number < 1 or !(instance_exists(obj_player1) or instance_exists(obj_player2)))
		room_goto(rm_menu);
}

function gm_game_alarm_0() {
	if(global.pause) {exit;}

	seconds += 1;

	if(seconds == 60) {
		minutes = 1;
		seconds = 0;
	}

	if(minutes < 10) {
		minutes_str = "0" + string(minutes)
	}
	else {
		minutes_str = string(minutes);
	}

	if(seconds < 10) {
		seconds_str = "0" + string(seconds)
	}
	else {
		seconds_str = string(seconds);
	}

	alarm_set(0, 60);
}

function gm_game_draw() {
	/*
	// _collision_rectangle_left:
	draw_rectangle(0, 32, 8, 720, true);

	// _collision_rectangle_right:
	draw_rectangle(1272, 32, 1280, 720, true);

	// _collision_rectangle_bottom:
	draw_rectangle(0, 624, 1280, 666, true);
	*/
}

function gm_game_draw_gui() {
	draw_text_transformed(24, 24,
	"SCORE-1: " + string(score_p1) + "\n" +
	"SCORE-2: " + string(score_p2),
	1.6, 1.6, 0);

	draw_text_transformed(224, 24,
	"TIME: " + minutes_str + ":" + seconds_str,
	1.6, 1.6, 0);

	if(instance_exists(obj_player1)) {
		player1_str = string(obj_player1.hspd);
	}
	else {
		player1_str = "0";
	}
	
	if(instance_exists(obj_player2)) {
		player2_str = string(obj_player2.hspd);
	}
	else {
		player2_str = "0";
	}

	if(instance_exists(obj_enemy_parent)) {
		enemy_spd = string(obj_enemy_parent.spd)
	}
	else {
		enemy_spd = "0";
	}

	if(show_info) {
		draw_text_transformed(1664, 24,
		"enemys: " + string(enemy_number) + "\n" +
		"enemy_spd: " + enemy_spd + "\n" +
		"player1_spd: " + player1_str + "\n" +
		"player2_spd: " + player2_str + "\n",
		1.6, 1.6, 0);
	}
}
#endregion

#region GM_MENU
function gm_menu_alarm_0() {
	subimg = !subimg;

	alarm_set(0, 30);
}

function gm_menu_draw() {
	draw_sprite_ext(spr_ufo, subimg, 640, 128, 3, 3, 0, c_white, 1);
	draw_sprite_ext(spr_crab, subimg, 512, 224, 3, 3, 30, c_white, 1);
	draw_sprite_ext(spr_squid, subimg, 640, 224, 3, 3, 0, c_white, 1);
	draw_sprite_ext(spr_octopus, subimg, 768, 224, 3, 3, 330, c_white, 1);
}
#endregion