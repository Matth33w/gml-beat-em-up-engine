function basic_player_control(){
	switch(player_controller_id) {
		case 1: {
			if(can_move && !dead) {
				current_x = global.p1_horizontal;
				current_y = global.p1_vertical;
				
				if(!damaged) {
					last_horizontal_direction = global.p1_horizontal != 0 ? global.p1_horizontal : last_horizontal_direction;
					last_vertical_direction = global.p1_vertical != 0 ? global.p1_vertical : last_vertical_direction;
				}
					
				if(!jumping && !attacking && global.p1_jump) {
					jumping = true;
					y_speed = -7;
					entity_sprite.image_index = 0;
					audio_play_sound(snd_big_woosh, 1, false);
				}
					
				if(!jumping && global.p1_punch && !attacking && attack_id == 0) {
					first_blow_handler(char_id, "PUNCH");
				}
					
				if(!jumping && global.p1_kick && !attacking && attack_id == 0) {
					first_blow_handler(char_id, "KICK");
				}
			}
				
			break;
		}
			
		case 2: {
			if(can_move && !dead) {
				current_x = global.p2_horizontal;
				current_y = global.p2_vertical;
				
				if(!damaged) {
					last_horizontal_direction = global.p2_horizontal != 0 ? global.p2_horizontal : last_horizontal_direction;
					last_vertical_direction = global.p2_vertical != 0 ? global.p2_vertical : last_vertical_direction;
				}
					
				if(!jumping && global.p2_jump) {
					jumping = true;
					y_speed = -7;
					entity_sprite.image_index = 0;
					audio_play_sound(snd_big_woosh, 1, false);
				}
					
				if(!jumping && global.p2_punch && !attacking && attack_id == 0) {
					attack_id = 1;
					can_move = false;
					attacking = true;
					entity_sprite.image_index = 0;
					audio_play_sound(snd_woosh, 1, false);
					character_attack_attributes_handler(char_id, attack_id);
					first_blow_handler(char_id, "PUNCH");
				}
					
				if(!jumping && global.p2_kick && !attacking && attack_id == 0) {
					attack_id = 4;
					can_move = false;
					attacking = true;
					entity_sprite.image_index = 0;
					audio_play_sound(snd_woosh, 1, false);
					character_attack_attributes_handler(char_id, attack_id);
					first_blow_handler(char_id, "KICK");
				}
			}
				
			break;
		}
	}
}