function bot_combo_handler(){
	if(attacking && bot_will_continue_combo) {
		character_attack_attributes_handler(char_id, attack_id);
		bot_attack_timeout = 0;
	}
	
	switch(char_id) {
			case 0: {
				switch(attack_id) {
					case 1: {						
						if(attacking && bot_will_continue_combo && entity_sprite.image_index > entity_sprite.image_number - 2) {
							execute_attack_handler(char_id, 2);
							bot_will_continue_combo = irandom_range(1, 1);
						}
						break;
					}
					
					case 2: {						
						if(attacking && bot_will_continue_combo && entity_sprite.image_index > entity_sprite.image_number - 2) {
							execute_attack_handler(char_id, 3);
						}
						break;
					}
				}
					
				break;
			}
			
			case 1: {
				switch(attack_id) {
					case 1: {						
						if(attacking && bot_will_continue_combo && entity_sprite.image_index > entity_sprite.image_number - 2) {
							execute_attack_handler(char_id, 2);
						}
						break;
					}
				}
					
				break;
			}
		}
}