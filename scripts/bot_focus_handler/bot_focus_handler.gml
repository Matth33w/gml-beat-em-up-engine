function bot_focus_handler(_p1, _p2, _distance_from_p1, _distance_from_p2, _pattern) {
	if(_p1) {
		_distance_from_p1 = (_pattern == 0) ? abs(x - _p1.x) : abs(y - _p1.y);
		current_player_focus = 1;
	}
			
	if(_p2) {
		_distance_from_p2 = (_pattern == 0) ? abs(x - _p2.x) : abs(y - _p2.y);
		current_player_focus = 2;
	}
			
	if(_distance_from_p1 > -1 && !_p1.dead && _distance_from_p2 > 1 && !_p2.dead) {
		if(_distance_from_p1 < _distance_from_p2) {
			current_player_focus = 1;
		} else if (_distance_from_p2 < _distance_from_p1) {
			current_player_focus = 2;
		}
	} else {
		if(_distance_from_p1 > -1 && !_p1.dead)
			current_player_focus = 1;
				
		if(_distance_from_p2 > -1 && !_p2.dead)
			current_player_focus = 2;
	}
}