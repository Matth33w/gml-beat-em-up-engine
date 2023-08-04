function character_attack_attributes_handler(_char_id, _attack_id){
	switch(_char_id) {
		case 0: {
			switch(_attack_id) {
				case 1: {
					entity_damage = 4;
					entity_damage_timeout = 20;
					attack_altitude = "LOW";
					break;
				}
				
				case 2: {
					entity_damage = 4;
					entity_damage_timeout = 25;
					attack_altitude = "LOW";
					break;
				}
				
				case 3: {
					entity_damage = 17;
					entity_damage_timeout = 35;
					attack_altitude = "HIGH";
					break;
				}
				
				case 4: {
					entity_damage = 25;
					entity_damage_timeout = 30;
					attack_altitude = "HIGH";
					break;
				}
			}
			break;
		}
		
		case 1: {
			switch(_attack_id) {
				case 1: {
					entity_damage = 8;
					entity_damage_timeout = 14;
					attack_altitude = "HIGH";
					break;
				}
				
				case 2: {
					entity_damage = 17;
					entity_damage_timeout = 18;
					attack_altitude = "HIGH";
					break;
				}
			}
			break;
		}
	}
}