// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateAct(){
	//Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
		if (animationEndScript != -1)
		{
			ScriptExecuteArray(animationEndScript, animationEndScriptArgs);
			animationEndScript = -1;
		}
	}
}