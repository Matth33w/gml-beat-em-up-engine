function default_moveset_animations(_entity_sprite, _idle_sprite, _walk_sprite, _jump_sprite, _hurt_sprite){
	if(!moving && !damaged && !jumping)
		_entity_sprite.sprite_index = _idle_sprite;
			
	if(moving && !damaged && !jumping)
		_entity_sprite.sprite_index = _walk_sprite;
			
	if(jumping && !damaged)
		_entity_sprite.sprite_index = _jump_sprite;
		
	if(damaged)
		_entity_sprite.sprite_index = _hurt_sprite;
}