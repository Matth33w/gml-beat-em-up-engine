// Data must be flushed every screen
global.p1_id = instance_create_depth(room_width / 2, room_height / 2, 0, obj_entity);
global.p1_id.player_controlled = true;
global.p1_id.player_controller_id = 1;
global.p1_id.entity_speed = 2;

global.p2_id = noone;

for(var i = 0; i < 1; i++) {
	var thing = instance_create_depth(irandom_range(0, room_width), irandom_range(0, room_height), 0, obj_entity);
	thing.player_controlled = false;
	thing.player_controller_id = 0;
	thing.entity_speed = 1;
	thing.char_id = 1;
}

spawn_enemy_timeout = 0;