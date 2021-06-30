/// @description Insert description here

lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

//Cycle through responses
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
responseSelected += (keyDown - keyUp);
var _max = array_length_1d(responses) - 1;
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;
/*
show_debug_message(_max); //1 
show_debug_message(_min); //0 
show_debug_message(responseSelected);//1st - 0 //2st - 1
show_debug_message(responses[0]);
*/
if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(message);
	if (textProgress >= _messageLength) //Chegou ao fim e clicou no space
	{
		instance_destroy();
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticked--;
		}
		else
		{
			with(oPlayer) state = lastState;
		}
	}else
	{
		if (textProgress > 2) //Se espamos a AIJWDOIAW do texto e estamos a clicar no espaço, ele vai "saltar" a animação e mostar logo o texto todo
		{
			textProgress = _messageLength;
		}
	}
}