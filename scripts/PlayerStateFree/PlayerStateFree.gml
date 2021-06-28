// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0) //Sempre q estivermos a mover
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle; //Se esta parado = idle
	if (_oldSprite != sprite_index) localFrame = 0; //Se mudou de tipo "animação", ex: (mudou de idle para run), Reseta o localFrame;

	//Update Image Index
	PlayerAnimateSprite();
	
	//Change state
	if (keyActivate)
	{
		
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
}