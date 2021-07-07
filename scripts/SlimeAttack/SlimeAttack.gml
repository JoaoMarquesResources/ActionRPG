// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeAttack(){
	var _spd = enemySpeed;
	
	//Dont move while still getting ready to jump
	if (image_index < 2) _spd = 0;
	
	//Freeze animation while in mid-air and also after landing finishes
	if (floor(image_index) == 3 || floor(image_index) == 5) image_speed = 0;
	
	//How far we have to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//begin landing end fo the animation once we're nearly done
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	
	//Move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Commit to move and stop moving if ew hit a wall
		if (EnemyTileCollision() == true) //Se colidiu com a tile, como o script retorna _collision, podemos checar se o script é true
		{
			xTo = x;
			yTo = y;
		}
	}else
	{
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}