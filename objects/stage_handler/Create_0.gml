// Data must be flushed every screen
global.p1_id = instance_create_depth(room_width / 2 - 32, room_height / 2 + 32, 0, obj_entity);
global.p1_id.player_controlled = true;
global.p1_id.player_controller_id = 1;
global.p1_id.entity_speed = 2;
global.p1_id.char_id = 0;

global.p2_id = noone;
/*global.p2_id = instance_create_depth(room_width / 2 + 32, room_height / 2 + 32, 0, obj_entity);
global.p2_id.player_controlled = true;
global.p2_id.player_controller_id = 2;
global.p2_id.entity_speed = 2;
global.p2_id.char_id = 1;*/

spawn_enemy_timeout = 0;