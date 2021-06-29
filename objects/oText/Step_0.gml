/// @description Insert description here

lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

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

show_debug_message(textProgress);