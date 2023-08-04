function bot_movement_handler(_p1, _p2){
	switch(current_player_focus) {
		case 1: {
			var _horizontal_direction_to_p1 = sign(x - _p1.x);
			var _vertical_direction_to_p1 = sign(y - _p1.y);
					
			_horizontal_direction_to_p1 = _horizontal_direction_to_p1 != 0 ? _horizontal_direction_to_p1 : 1;
			_vertical_direction_to_p1 = _vertical_direction_to_p1 != 0 ? _vertical_direction_to_p1 : 1;
				
			last_horizontal_direction = _horizontal_direction_to_p1 != noone ? -_horizontal_direction_to_p1 : 1;
				
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
			var _horizontal_direction_to_p2 = sign(x - _p2.x);
			var _vertical_direction_to_p2 = sign(y - _p2.y);
				
			_horizontal_direction_to_p2 = _horizontal_direction_to_p2 != 0 ? _horizontal_direction_to_p2 : 1;
			_vertical_direction_to_p2 = _vertical_direction_to_p2 != 0 ? _vertical_direction_to_p2 : 1;
				
			last_horizontal_direction = _horizontal_direction_to_p2 ? -_horizontal_direction_to_p2 : 1;
				
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
}