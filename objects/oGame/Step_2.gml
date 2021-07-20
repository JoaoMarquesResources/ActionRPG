/// @description Pause the Game
if (keyboard_check_pressed(vk_escape)) && (!instance_exists(oTransition))
{
	global.gamePaused = !global.gamePaused; //Invert
	
	if (global.gamePaused)
	{
		with (all) //Todos os objetos do jogo
		{
			gamePausedImageSpeed = image_speed;
			image_speed = 0; //Pausar
		}
	}else
	{
		with (all)
		{
			image_speed = gamePausedImageSpeed;
		}
	}
}
