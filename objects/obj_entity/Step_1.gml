depth = -y;
entity_sprite.depth = depth - 1;

if(attacking) {
	combo_input_handler();
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