function default_moveset_animations(_entity_sprite, _idle_sprite, _walk_sprite, _jump_sprite, _high_hurt_sprite, _low_hurt_sprite, _dead_falling_sprite, _dead_rising_sprite, _dead_sprite){
	if(!dead) {
		if(!moving && !damaged && !jumping)
			_entity_sprite.sprite_index = _idle_sprite;
			
		if(moving && !damaged && !jumping)
			_entity_sprite.sprite_index = _walk_sprite;
			
		if(jumping && !damaged)
			_entity_sprite.sprite_index = _jump_sprite;
		
		if(damaged && damage_altitude == "HIGH")
			_entity_sprite.sprite_index = _high_hurt_sprite;
		else if(damaged)
			_entity_sprite.sprite_index = _low_hurt_sprite;
			
	} else {
		if(!dead_on_ground) {
			if(y_speed < 0)
				_entity_sprite.sprite_index = _dead_rising_sprite;
			else
				_entity_sprite.sprite_index = _dead_falling_sprite;
				
			freeze_animation_on_end(_entity_sprite);
		} else {
			_entity_sprite.sprite_index = _dead_sprite;
			freeze_animation_on_end(_entity_sprite);
		}
	}
}