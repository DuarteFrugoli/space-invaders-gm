if(global.pause) {exit;}

#region CONTROLES
key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_shoot = keyboard_check_pressed(vk_space)
#endregion

#region MOVIMENTAÇÃO
x = x+hspd
move = key_right-key_left
hspd = move*spd
#endregion

#region COLISÃO
if place_meeting(x+hspd,y,obj_collider){
	if(!place_meeting(x+sign(hspd),y,obj_collider)){
		x = x + sign(hspd)
	}
	hspd = 0
}
#endregion

#region TIRO
if(key_shoot){
	instance_create_layer(x, y-17, "Projectiles", obj_player1_projectile)
}
#endregion