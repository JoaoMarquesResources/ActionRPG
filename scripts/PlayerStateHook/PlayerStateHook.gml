// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateHook()
{
	//https://www.youtube.com/watch?v=tsFWohCOla0&list=PLPRT_JORnIuosvhfax2TQTEmN7OYTcSvK&index=41
	
	hSpeed = 0;
	vSpeed = 0;
	
	//If just arriving in this state
	if (sprite_index != sPlayerHook)
	{
		hook = 0 //How far along the hook is going to be
		hookX = 0; //Exact posititon
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENDING;
		hookedEntity = noone;
		
		//Update sprite
		sprite_index = sPlayerHook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	//Extend/Retract hook:
	var _speedHookTemp = speedHook;
	if (hookStatus != HOOKSTATUS.EXTENDING) _speedHookTemp *= -1;
	hook += _speedHookTemp;
	switch (image_index)
	{
		case 0: hookX = hook; break; //Se estamos a olhar para a direrita
		case 1: hookY = -hook; break; //para cima
		case 2: hookX = -hook; break; //para esq
		case 3: hookY = hook; break; //para dir
	}
	//Hookshot state machine
	switch (hookStatus)
	{
		case HOOKSTATUS.EXTENDING:
		{
			//Create: distanceHook = 80;
			if (hook >= distanceHook)  hookStatus = HOOKSTATUS.MISSED;
			
			//Check for a hit
			var _hookHit = collision_circle(x + hookX, y + hookY, 4, pEntity, false, true);
			if (_hookHit != noone) && (global.iLifted != _hookHit) // if ... && Se ele não esta a colidir com o que estamos a pegar
			{
				//Act depending on what is hit 
				switch(_hookHit.entityHookable)
				{
					default: //Not hookable entity
					{
						//... else potentially harm enemy
						if (object_is_ancestor(_hookHit.object_index, pEnemy)) //Se é um enemy
						{
							HurtEnemy(_hookHit, 1, id, 5);
							hookStatus = HOOKSTATUS.MISSED;
						}
						else
						{
							if (_hookHit.entityHitScript != -1)
							{
								with (_hookHit) script_execute(entityHitScript);
								hookStatus = HOOKSTATUS.MISSED;
							}
						}
					}break;
					case 1:
					{
						hookStatus = HOOKSTATUS.PULLTOPLAYER;
						hookedEntity = _hookHit;
					}break;
					case 2:
					{
						hookStatus = HOOKSTATUS.PULLTOENTITY;
						hookedEntity = _hookHit;
					}break;
				}
			}
		}break;
		
		//Pull the entity towards the hooked player
		case HOOKSTATUS.PULLTOPLAYER:
		{
			with (hookedEntity)
			{
				x = other.x + other.hookX;
				y = other.y + other.hookY;
			}
		}break;
		
		//Pull the player towards the hooked entity
		case HOOKSTATUS.PULLTOENTITY:
		{
			switch (image_index)
			{
				case 0: x += speedHook; break; //Se estamos a olhar para a direrita
				case 1: y -= speedHook; break; //para cima
				case 2: x -= speedHook; break; //para esq
				case 3: y += speedHook; break; //para dir
			}
		}break;
	}
	
	//Finish retract and end state
	if (hook <= 0)
	{
		hookedEntity = noone;
		state = PlayerStateFree;
	}
}