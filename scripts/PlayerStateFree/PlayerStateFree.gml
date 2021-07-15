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
		
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		//Vai criar um rectangulo 8 por 8
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true
		);
		
		//If the first instance we find is either our lifted entity or it has no script: try the next one
		while(_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted) && (_check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
		}
		
		ds_list_destroy(_activateList);
	
		if (activate == noone)
		{
			//Trow something if held, otherwise roll
			if (global.iLifted != noone)
			{
				PlayerThrow();
			}
		}
		else
		{
			//Activate the entity-
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
	
	if (keyItem) && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE) //Trocar de itens e tal
	{
		switch (global.playerEquipped)
		{
			case ITEM.BOMB: UseItemBomb(); break;
			case ITEM.BOW: UseItemBow(); break;
			case ITEM.HOOK: UseItemHook(); break;
			default: break;
		}
	}
	
	//Clycle Items
	if (global.playerHasAnyItems)
	{
		var _cycleDirection = keyItemSelectUpDown;
		if (_cycleDirection != 0)
		{
			do
			{
				global.playerEquipped += _cycleDirection;
				if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT - 1;
				if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
		}
	}
}