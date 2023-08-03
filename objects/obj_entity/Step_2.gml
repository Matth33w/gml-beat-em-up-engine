entity_sprite.x = x;
entity_sprite.y = y - y_height;

if(!global.pause && !dead) {
	var _entity = ds_list_create();
	var _entity_number = instance_place_list(x, y, obj_entity, _entity, false);

	if(_entity_number > 0) {
		for(var i = 0; i < _entity_number; i++) {
			var _entity_index = ds_list_find_value(_entity, i);
			if(_entity_index && _entity_index.entity_sprite.image_index < _entity_index.entity_sprite.image_number - 2 && _entity_index.attacking && !damaged) {
				if(_entity_index.x < x && _entity_index.last_horizontal_direction == 1 || _entity_index.x > x && _entity_index.last_horizontal_direction == -1) {
					damaged = true;
					if(attacking) {
						attacking = false;
						attack_id = 0;
					}
					entity_sprite.image_index = 0;
					entity_sprite.image_speed = 1;
					can_move = false;
					damage_altitude = _entity_index.attack_altitude;
					damaged_timeout = _entity_index.entity_damage_timeout;
					entity_health -= _entity_index.entity_damage;
					last_damaged = _entity_index.attack_id;
					last_horizontal_direction = (x < _entity_index.x) ? 1 : -1;
					bot_attack_timeout = 0;
					audio_play_sound(snd_hit, 1, false);
				}
			}
		}
	}

	ds_list_clear(_entity);
}

entity_health = clamp(entity_health, 0, entity_max_health);