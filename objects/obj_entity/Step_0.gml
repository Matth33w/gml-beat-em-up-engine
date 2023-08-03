if(!global.pause && !dead) {
	if(player_controlled) {
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
						entity_sprite.image_index = 0
					}
					
					if(!jumping && global.p1_punch && !attacking && attack_id == 0) {
						attack_id = 1;
						can_move = false;
						attacking = true;
						entity_sprite.image_index = 0;
						audio_play_sound(snd_woosh, 1, false);
					}
					
					if(!jumping && global.p1_kick && !attacking && attack_id == 0) {
						attack_id = 4;
						can_move = false;
						attacking = true;
						entity_sprite.image_index = 0;
						audio_play_sound(snd_woosh, 1, false);
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
					}
					
					if(!jumping && global.p2_punch && !attacking && attack_id == 0) {
						attack_id = 1;
						can_move = false;
						attacking = true;
						entity_sprite.image_index = 0;
						audio_play_sound(snd_woosh, 1, false);
					}
					
					if(!jumping && global.p2_kick && !attacking && attack_id == 0) {
						attack_id = 4;
						can_move = false;
						attacking = true;
						entity_sprite.image_index = 0;
						audio_play_sound(snd_woosh, 1, false);
					}
				}
				
				break;
			}
		}
		
		current_x = current_x * entity_speed;
		current_y = current_y * entity_speed / 1.35;
	} else {
		current_focus_timeout += delta_time / 1000000;
		
		var _p1 = global.p1_id;
		var _p2 = global.p2_id;
		
		var _distance_from_p1 = -1;
		var _distance_from_p2 = -1;
		
		if(_p1)
			_distance_from_p1 = abs(x - _p1.x);
			
		if(_p2)
			_distance_from_p2 = abs(x - _p2.x);
			
		if(_distance_from_p1 > -1 && _distance_from_p2 > 1) {
			if(_distance_from_p1 < _distance_from_p2) {
				current_player_focus = 1;
			} else if (_distance_from_p2 < _distance_from_p1) {
				current_player_focus = 2;
			}
		} else {
			if(_distance_from_p1 > -1)
				current_player_focus = 1;
				
			if(_distance_from_p2 > -1)
				current_player_focus = 2;
		}
		
		switch(current_player_focus) {
			case 1: {
				var _horizontal_direction_to_p1 = _horizontal_direction_to_p1;
				var _vertical_direction_to_p1 = _vertical_direction_to_p1;
				
				if(!damaged) {
					_horizontal_direction_to_p1 = sign(x - _p1.x);
					_vertical_direction_to_p1 = sign(y - _p1.y);
					
					_horizontal_direction_to_p1 = _horizontal_direction_to_p1 != 0 ? _horizontal_direction_to_p1 : 1;
					_vertical_direction_to_p1 = _vertical_direction_to_p1 != 0 ? _vertical_direction_to_p1 : 1;
				}
				
				last_horizontal_direction = -_horizontal_direction_to_p1;
				
				if(_horizontal_direction_to_p1 == -1 && x < _p1.x - 52)
					current_x = 1;
				else if(_horizontal_direction_to_p1 == 1 && x > _p1.x + 52)
					current_x = -1;
				else
					current_x = 0;
					
				if(_vertical_direction_to_p1 == -1 && y < _p1.y - 6)
					current_y = 1;
				else if(_vertical_direction_to_p1 == 1 && y > _p1.y + 6)
					current_y = -1;
				else
					current_y = 0;
				
				break;
			}
			
			case 2: {
				var _horizontal_direction_to_p2 = _horizontal_direction_to_p2;
				var _vertical_direction_to_p2 = _vertical_direction_to_p2;
				
				if(!damaged) {
					_horizontal_direction_to_p2 = sign(x - _p2.x);
					_vertical_direction_to_p2 = sign(y - _p2.y);
				
					_horizontal_direction_to_p2 = _horizontal_direction_to_p2 != 0 ? _horizontal_direction_to_p2 : 1;
					_vertical_direction_to_p2 = _vertical_direction_to_p2 != 0 ? _vertical_direction_to_p2 : 1;
				}
				
				last_horizontal_direction = -_horizontal_direction_to_p2;
				
				if(_horizontal_direction_to_p2 == -1 && x < _p2.x - 52)
					current_x = 1;
				else if(_horizontal_direction_to_p2 == 1 && x > _p2.x + 52)
					current_x = -1;
				else
					current_x = 0;
					
				if(_vertical_direction_to_p2 == -1 && y < _p2.y - 6)
					current_y = 1;
				else if(_vertical_direction_to_p2 == 1 && y > _p2.y + 6)
					current_y = -1;
				else
					current_y = 0;
					
				break;
			}
		}
		
		current_x = current_x * entity_speed;
		current_y = current_y * entity_speed / 1.35;
		
		if(!moving) {
			if(attack_id == 0 && !damaged && !attacking)
				bot_attack_timeout += 1;
			
			if(bot_attack_timeout > 15 && attack_id == 0 && !attacking && !damaged) {
				bot_attack_timeout = 0;
				bot_will_continue_combo = irandom_range(0, 1);
				attacking = true;
				entity_sprite.image_index = 0;
				can_move = false;
				attack_id = 1;
				audio_play_sound(snd_woosh, 1, false);
			}
		} else {
			bot_attack_timeout = 0;
		}
		
		switch(char_id) {
			case 0: {
				switch(attack_id) {
					case 1: {						
						if(attacking && bot_will_continue_combo && entity_sprite.image_index > entity_sprite.image_number - 2) {
							entity_sprite.image_index = 0;
							attack_id = 2;
							bot_attack_timeout = 0;
						
							audio_play_sound(snd_woosh, 1, false);
							bot_will_continue_combo = irandom_range(0, 1);
						}
						break;
					}
				}
					
				break;
			}
		}
	}
	
	entity_sprite.image_xscale = last_horizontal_direction != 0 ? last_horizontal_direction : entity_sprite.image_xscale;
	
	if(can_move) {
		if(!place_meeting(x + round(current_x), y, ground_group)) {
			x += current_x;
		} else {
			while(!place_meeting(x + sign(current_x), y, ground_group)) {
				x += sign(current_x);
			}
		
			current_x = 0;
		}
	
		if(!place_meeting(x, y + round(current_y), ground_group)) {
			y += current_y;
		} else {
			while(!place_meeting(x, y + round(current_y), ground_group)) {
				y += sign(current_y);
			}
		
			current_y = 0;
		}
	}
	
	if(attacking && entity_sprite.image_index >= entity_sprite.image_number - 1) {
		attacking = false;
		can_move = true;
		attack_id = 0;
		entity_sprite.image_index = 0;
	}
	
	if(attacking) {
		var _entity = instance_place(x, y, obj_entity);
		
		if(_entity && entity_sprite.image_index < entity_sprite.image_number - 2) {
			if((!_entity.damaged || _entity.last_damaged != attack_id) && _entity.x > x && last_horizontal_direction == 1 || (!_entity.damaged || _entity.last_damaged != attack_id) && _entity.x < x && last_horizontal_direction == -1) {
				_entity.damaged = true;
				_entity.entity_sprite.image_index = 0;
				_entity.entity_sprite.image_speed = 1;
				_entity.can_move = false;
				_entity.damaged_timeout = entity_damage_timeout;
				_entity.entity_health -= entity_damage;
				_entity.last_damaged = attack_id;
				_entity.last_horizontal_direction = (x > _entity.x) ? 1 : -1;
				_entity.bot_attack_timeout = 0;
				audio_play_sound(snd_hit, 1, false);
			}
		}
	}
	
	if(!jumping) {
		if(x != last_x || y != last_y) {
			moving = true;
		} else {
			moving = false;
		}
	} else {
		y_height -= y_speed;
		y_speed += 0.3;
		
		if(y_height <= 0 && jumping) {
			jumping = false;
			y_speed = 0;
			y_height = 0;
			entity_sprite.image_index = 0;
			entity_sprite.image_speed = 1;
		}
	}
	
	if(damaged) {
		if(entity_sprite.image_index > entity_sprite.image_number - 1) {
			entity_sprite.image_speed = 0;
		}
		
		damaged_timeout -= 1;
		
		if(damaged_timeout <= 0) {
			damaged = false;
			can_move = true;
			damaged_timeout = 0;
			last_damaged = 0;
			entity_sprite.image_speed = 1;
			entity_sprite.image_index = 0;
		}
	}
}