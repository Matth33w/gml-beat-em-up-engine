function combo_input_handler(){
	switch(char_id) {
		case 0: {
			switch(attack_id) {
				case 1: {
					switch(player_controller_id) {
						case 1: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p1_punch) {
								execute_attack_handler(char_id, 2);
								last_horizontal_direction = (global.p1_horizontal != 0) ? global.p1_horizontal : last_horizontal_direction;
							}
							break;
						}
						
						case 2: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p2_punch) {
								execute_attack_handler(char_id, 2);
								last_horizontal_direction = (global.p2_horizontal != 0) ? global.p2_horizontal : last_horizontal_direction;
							}
							break;
						}
					}
					
					break;
				}
				
				case 2: {
					switch(player_controller_id) {
						case 1: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 6 && global.p1_punch) {
								execute_attack_handler(char_id, 3);
								last_horizontal_direction = (global.p1_horizontal != 0) ? global.p1_horizontal : last_horizontal_direction;
							}
							break;
						}
						
						case 2: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 6 && global.p2_punch) {
								execute_attack_handler(char_id, 3);
								last_horizontal_direction = (global.p2_horizontal != 0) ? global.p2_horizontal : last_horizontal_direction;
							}
							break;
						}
					}
					
					break;
				}
				
				case 3: {				
					break;
				}
				
				case 4: {
					break;
				}
			}
			break;
		}
		
		case 1: {
			switch(attack_id) {
				case 1: {
					switch(player_controller_id) {
						case 1: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p1_punch) {
								last_horizontal_direction = (global.p1_horizontal != 0) ? global.p1_horizontal : last_horizontal_direction;
								execute_attack_handler(char_id, 2);
							}
							break;
						}
						
						case 2: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p2_punch) {
								last_horizontal_direction = (global.p2_horizontal != 0) ? global.p2_horizontal : last_horizontal_direction;
								execute_attack_handler(char_id, 2);
							}
							break;
						}
					}
					
					break;
				}
				
				case 2: {			
					break;
				}
			}
			break;
		}
	}
}