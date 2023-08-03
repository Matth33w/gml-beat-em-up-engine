global.pause = false;

global.p1_horizontal = (keyboard_check(vk_right)) - (keyboard_check(vk_left));
global.p1_vertical = (keyboard_check(vk_down)) - (keyboard_check(vk_up));
global.p1_jump = keyboard_check_pressed(vk_numpad1);
global.p1_punch = keyboard_check_pressed(vk_numpad2);
global.p1_kick = keyboard_check_pressed(vk_numpad3);

global.p2_horizontal = (keyboard_check(ord("D"))) - (keyboard_check(ord("A")));
global.p2_vertical = (keyboard_check(ord("S"))) - (keyboard_check(ord("W")));
global.p2_jump = keyboard_check_pressed(ord("J"));
global.p2_punch = keyboard_check_pressed(ord("K"));
global.p2_kick = keyboard_check_pressed(ord("L"));