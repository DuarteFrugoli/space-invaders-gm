instance_destroy(other)
instance_destroy(self)

switch(other.sprite_index) {
	case spr_octopus:
		obj_game_manager.score_p2 += 10
		break;
	case spr_crab:
		obj_game_manager.score_p2 += 20
		break;
	case spr_squid:
		obj_game_manager.score_p2 += 30
		break;
	case spr_cuttlefish:
		obj_game_manager.score_p2 += 30
		break;
	case spr_ufo:
		switch(int34(random_range(1,5))) {
			case 1:
				obj_game_manager.score_p2 += 50
				break;
			case 2:
				obj_game_manager.score_p2 += 100
				break;
			case 3:
				obj_game_manager.score_p2 += 150
				break;
			case 4:
				obj_game_manager.score_p2 += 200
				break;
			case 5:
				obj_game_manager.score_p2 += 300
				break;
			
		}
		break;
	case spr_ufo2:
		obj_game_manager.score_p2 += 500
		break;
}