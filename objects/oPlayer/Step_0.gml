/// @description Insert description here
//Get Player Input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keyitem = keyboard_check_pressed(vk_control);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp); //Retorna os graus (dir = 0; esq = 180; up = 90; down = 270 etc);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0); //Retorna sempre 1 se estiverer em movimento
//show_debug_message(inputDirection);
//show_debug_message(inputMagnitude);
//show_debug_message(vSpeed);
//show_debug_message(hSpeed);

script_execute(state);