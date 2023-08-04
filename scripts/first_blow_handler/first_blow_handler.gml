function first_blow_handler(_char_id, _button_type){
	switch(_char_id) {
		case 0: {
			switch(_button_type) {
				case "PUNCH": {
					execute_attack_handler(_char_id, 1);
					break;
				}
				
				case "KICK": {
					execute_attack_handler(_char_id, 4);
					break;
				}	
			}
			break;
		}
		
		case 1: {
			switch(_button_type) {
				case "PUNCH": {
					execute_attack_handler(_char_id, 1);
					break;
				}
				
				case "KICK": {
					attack_id = 0;
					attacking = false;
					can_move = true;
					break;
				}
			}
			break;
		}
	}
	
	character_attack_attributes_handler(_char_id, attack_id);
}