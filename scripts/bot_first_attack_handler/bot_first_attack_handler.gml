function bot_first_attack_handler(){
	if(!moving) {
		if(attack_id == 0 && !damaged && !attacking)
			bot_attack_timeout += 1;
			
		if(bot_attack_timeout > 10 && attack_id == 0 && !attacking && !damaged) {
			bot_attack_timeout = 0;
			first_blow_handler(char_id, choose("PUNCH", "KICK"));
				
			character_attack_attributes_handler(char_id, attack_id);
		}
	} else {
		bot_attack_timeout = 0;
	}
}