depth = -y;
entity_sprite.depth = depth - 1;

if(attacking) {
	switch(char_id) {
		case 0: {
			switch(attack_id) {
				case 1: {
					entity_sprite.sprite_index = spr_mai_light_punch;
					
					switch(player_controller_id) {
						case 1: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p1_punch) {
								entity_sprite.image_index = 0;
								attack_id = 2;
								last_horizontal_direction = (global.p1_horizontal != 0) ? global.p1_horizontal : last_horizontal_direction;
								character_attack_attributes_handler(char_id, attack_id);
								audio_play_sound(snd_woosh, 1, false);
							}
							break;
						}
						
						case 2: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p2_punch) {
								entity_sprite.image_index = 0;
								attack_id = 2;
								last_horizontal_direction = (global.p2_horizontal != 0) ? global.p2_horizontal : last_horizontal_direction;
								character_attack_attributes_handler(char_id, attack_id);
								audio_play_sound(snd_woosh, 1, false);
							}
							break;
						}
					}
					
					break;
				}
				
				case 2: {
					entity_sprite.sprite_index = spr_mai_medium_punch;
					
					switch(player_controller_id) {
						case 1: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 6 && global.p1_punch) {
								entity_sprite.image_index = 0;
								attack_id = 3;
								last_horizontal_direction = (global.p1_horizontal != 0) ? global.p1_horizontal : last_horizontal_direction;
								character_attack_attributes_handler(char_id, attack_id);
								audio_play_sound(snd_big_woosh, 1, false);
							}
							break;
						}
						
						case 2: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 6 && global.p2_punch) {
								entity_sprite.image_index = 0;
								attack_id = 3;
								last_horizontal_direction = (global.p2_horizontal != 0) ? global.p2_horizontal : last_horizontal_direction;
								character_attack_attributes_handler(char_id, attack_id);
								audio_play_sound(snd_big_woosh, 1, false);
							}
							break;
						}
					}
					
					break;
				}
				
				case 3: {
					entity_sprite.sprite_index = spr_mai_strong_punch;
					character_attack_attributes_handler(char_id, attack_id);
				}
			}
			break;
		}
		
		case 1: {
			switch(attack_id) {
				case 1: {
					entity_sprite.sprite_index = spr_el_gado_light_punch;
					
					switch(player_controller_id) {
						case 1: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p1_punch) {
								entity_sprite.image_index = 0;
								attack_id = 2;
								last_horizontal_direction = (global.p1_horizontal != 0) ? global.p1_horizontal : last_horizontal_direction;
								character_attack_attributes_handler(char_id, attack_id);
								audio_play_sound(snd_woosh, 1, false);
							}
							break;
						}
						
						case 2: {
							if(entity_sprite.image_index >= entity_sprite.image_number - 3 && global.p2_punch) {
								entity_sprite.image_index = 0;
								attack_id = 2;
								last_horizontal_direction = (global.p2_horizontal != 0) ? global.p2_horizontal : last_horizontal_direction;
								character_attack_attributes_handler(char_id, attack_id);
								audio_play_sound(snd_woosh, 1, false);
							}
							break;
						}
					}
					
					break;
				}
				
				case 2: {
					entity_sprite.sprite_index = spr_el_gado_medium_punch;
					character_attack_attributes_handler(char_id, attack_id);
					break;
				}
			}
			break;
		}
	}
} else {
	switch(char_id) {
		case 0: {
			default_moveset_animations(entity_sprite, spr_mai_idle, spr_mai_walk, spr_mai_jump, spr_mai_hurt_high, spr_mai_hurt_low, spr_mai_dead_falling, spr_mai_dead_rising, spr_mai_dead);
			freeze_jump_animation_on_end(entity_sprite);
				
			break;
		}
		
		case 1: {
			default_moveset_animations(entity_sprite, spr_el_gado_idle, spr_el_gado_walk, spr_el_gado_jump, spr_el_gado_hurt_high, spr_el_gado_hurt_low, spr_el_gado_dead_falling, spr_el_gado_dead_rising, spr_el_gado_dead);
			freeze_jump_animation_on_end(entity_sprite);
				
			break;
		}
	}
	
	last_x = x;
	last_y = y;
}