/// @description Insert description here
// You can write your code in this editor
flash = max(0, flash - 0.05);
fric = 0.05;
if (z == 0) fric = 0.10;
 
//Magnetise (ser atraido pelo player)
if (instance_exists(oPlayer))
{
	var _px = oPlayer.x;
	var _py = oPlayer.y;
	var _dist = point_distance(x, y, _px, _py);
	if (_dist < 16) //magnet radius
	{
		spd += 0.25;
		direction = point_direction(x, y, _px, _py);
		spd = min(spd, 3);
		fric = 0;
		if (_dist < 5)//Collect radius
		{
			show_message(collectScriptArg)
			if (collectScriptArg != -1)
			{
				show_message("AOIWDJDOIAJW");
				script_execute(collectScript, collectScriptArg);
			}else
			{
				show_message(collectScriptArg);
				show_message(collectScript);
				if (collectScript != -1) script_execute(collectScript);
			}
			instance_destroy();
		}
	}
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
spd = max(spd - fric, 0);
depth = -bbox_bottom;