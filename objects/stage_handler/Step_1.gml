global.pause = false;

global.p1_horizontal = (keyboard_check(vk_right)) - (keyboard_check(vk_left));
global.p1_vertical = (keyboard_check(vk_down)) - (keyboard_check(vk_up));
global.p1_jump = keyboard_check_pressed(vk_numpad1);
global.p1_punch = keyboard_check_pressed(vk_numpad2);
global.p1_kick = keyboard_check_pressed(vk_numpad3);
global.p1_block = keyboard_check(vk_numpad5);

global.p2_horizontal = (keyboard_check(ord("D"))) - (keyboard_check(ord("A")));
global.p2_vertical = (keyboard_check(ord("S"))) - (keyboard_check(ord("W")));
global.p2_jump = keyboard_check_pressed(ord("J"));
global.p2_punch = keyboard_check_pressed(ord("K"));
global.p2_kick = keyboard_check_pressed(ord("L"));
global.p2_block = keyboard_check(ord("U"));

if(keyboard_check_pressed(vk_f2)) {
	game_restart();
}

spawn_enemy_timeout += delta_time / 1000000;

if(spawn_enemy_timeout > 5) {
	var thing = instance_create_depth(choose(-32, room_width + 32), irandom_range(-32, room_height + 32), 0, obj_entity);
	thing.player_controlled = false;
	thing.player_controller_id = 0;
	thing.entity_speed = 1;
	thing.char_id = irandom_range(0, 1);
	spawn_enemy_timeout = 0;
}