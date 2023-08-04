if(!global.pause && !dead) {
	if(player_controlled) {
		basic_player_control();
		
		current_x = current_x * entity_speed;
		current_y = current_y * entity_speed / 1.35;
	} else {
		current_focus_timeout += delta_time / 1000000;
		
		var _p1 = global.p1_id;
		var _p2 = global.p2_id;
		
		var _distance_from_p1 = -1;
		var _distance_from_p2 = -1;
		
		if(current_focus_timeout > 5 || current_player_focus == 0) {
			current_focus_timeout = 0;
			bot_focus_handler(_p1, _p2, _distance_from_p1, _distance_from_p2, irandom_range(0, 1));
		}
		
		bot_movement_handler(_p1, _p2);
		
		current_x = current_x * entity_speed;
		current_y = current_y * entity_speed / 1.35;
		
		/////////////////////////
		// BOT ATTACK HANDLING //
		/////////////////////////
		
		bot_first_attack_handler();
		bot_combo_handler();
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
			audio_play_sound(snd_step, 1, false);
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
	
	if(entity_health <= 0) {
		dead = true;
		y_speed = -10;
	} 
}

if(dead && !global.pause) {
	if(!dead_on_ground) {
		y_height -= y_speed;
		y_speed += 0.6;
		current_x = 2 * -last_horizontal_direction;
		x += current_x;
	}
		
	if(y_height <= 0 && !dead_on_ground && y_speed > 0) {
		if(death_bounces > 0) {
			death_bounces--;
			y_speed = -6;
			y_height = 0;
			audio_play_sound(snd_impact, 1, false);
			entity_sprite.image_index = 0;
			entity_sprite.image_speed = 1;
		} else {
			dead_on_ground = true;
			y_speed = 0;
			y_height = 0;
			entity_sprite.image_index = 0;
			entity_sprite.image_speed = 1;
			death_bounces = bounces_to_die;
			audio_play_sound(snd_impact, 1, false);
		}
	}
	
	if(dead_on_ground) {
		dead_timeout += delta_time / 1000000;
		if(dead_timeout > 3 && !player_controlled) {
			instance_destroy(entity_sprite);
			instance_destroy();
		} else if(dead_timeout > 3 && player_controlled) {
			x = irandom_range(0, 480);
			y = irandom_range(0, 240);
			dead = false;
			dead_on_ground = false;
			dead_timeout = 0;
			damaged = false;
			can_move = true;
			entity_health = entity_max_health;
			entity_sprite.image_index = 0;
			entity_sprite.image_speed = 1;
		}
	}
}