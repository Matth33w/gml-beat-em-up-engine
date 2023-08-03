// Data must be flushed every screen
global.p1_id = instance_create_depth(50, 50, 0, obj_entity);
global.p1_id.player_controlled = true;
global.p1_id.player_controller_id = 1;
global.p1_id.entity_speed = 2;

global.p2_id = noone;

var thing = instance_create_depth(50, 50, 0, obj_entity);
thing.player_controlled = false;
thing.player_controller_id = 0;
thing.entity_speed = 1;