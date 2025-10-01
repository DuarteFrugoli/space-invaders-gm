if(global.pause) {exit;}

instance_create_layer(x, y, "Projectiles", obj_enemy_projectile);

alarm_set(0, irandom_range(60,780));