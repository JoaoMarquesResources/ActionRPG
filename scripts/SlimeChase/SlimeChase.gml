// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeChase(){
	sprite_index = sprMove;
	
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			//show_debug_message("1")
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}else
		{
			//show_debug_message("2")
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		//Collide & Move
		EnemyTileCollision();
	}
	//show_debug_message(enemySpeed);
	//show_debug_message(_distanceToGo);
	
	//Check if close enought to launch an attack
	if (instance_exists(target)) && (point_distance(x, y, target.x, target.y) <= enemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		//target 8 pixel past the player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	}
}