function execute_attack_handler(_char_id, _attack_id){
	entity_sprite.image_index = 0;
	entity_sprite.image_speed = 1;
	can_move = false;
	attacking = true;
	bot_will_continue_combo = !player_controlled ? irandom_range(0, 1) : bot_will_continue_combo;
	attack_id = _attack_id;
	character_attack_attributes_handler(char_id, attack_id);
	
	switch(_char_id) {
		case 0: {
			switch(attack_id) {
				case 1: {
					entity_sprite.sprite_index = spr_mai_light_punch;
					audio_play_sound(snd_woosh, 1, false);
					break;
				}
				
				case 2: {
					entity_sprite.sprite_index = spr_mai_medium_punch;
					audio_play_sound(snd_woosh, 1, false);
					break;
				}
				
				case 3: {
					entity_sprite.sprite_index = spr_mai_strong_punch;
					audio_play_sound(snd_big_woosh, 1, false);
					break;
				}
				
				case 4: {
					entity_sprite.sprite_index = spr_mai_ryuenbu;
					audio_play_sound(snd_big_woosh, 1, false);
					break;
				}
			}
			break;
		}
		
		case 1: {
			switch(attack_id) {
				case 1: {
					entity_sprite.sprite_index = spr_el_gado_light_punch;
					audio_play_sound(snd_woosh, 1, false);
					break;
				}
				
				case 2: {
					entity_sprite.sprite_index = spr_el_gado_medium_punch;
					audio_play_sound(snd_woosh, 1, false);
					break;
				}
			}
			break;
		}
	}
}