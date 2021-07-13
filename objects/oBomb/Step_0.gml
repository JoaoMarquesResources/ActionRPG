/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (!global.gamePaused)
{
	bombTick--;
	if (bombTick == 0)
	{
		flash = 0.75;
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	
	if (bombTick < 0) //bombtick = -1 (ultimo valor do array)
	{
		y -= z;
		if (lifted)
		{
			with (oPlayer)
			{
				PlayerDropItem();
			}
		}
		instance_destroy();
	}
}

show_debug_message(bombTick);
show_debug_message(y);