function freeze_animation_on_end(_entity_sprite){
	if(_entity_sprite.image_index >= _entity_sprite.image_number - 1) {
		_entity_sprite.image_speed = 0;
		_entity_sprite.image_index = _entity_sprite.image_number - 1;	
	}
}