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
	
	//Attack key logic
	if (keyAttack)
	{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
			
	//Activate key logic
	if (keyPickupItem)
	{
		//Check for an entity to activate
		//If there is nothing, or there is something, but it has no script
			//If we are carrying and it has a script, throw it!
			//Otherwise Roll!
		//Otherwise, there is something and it has a script! Activate!
		//If the thing we activate is an NPC, make it face towards us!
		
		var _activateX = lengthdir_x(10, 360);
		var _activateY = lengthdir_y(10, 360);
		activate = instance_position(x + _activateX, y + _activateY, pEntity);
	
		if (activate == noone || activate.entityActivateScript == -1)
		{
			//Trow something if held, otherwise roll
			if (global.iLifted != noone)
			{
				PlayerThrow();
			}
		}
		else
		{
			//Activate the entity
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			//Make an nps face the player
			if (activate.entityNPC)
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	}
	if (keyActivate)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
}