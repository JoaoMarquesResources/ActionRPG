/// @description Cause a room transition
// You can write your code in this editor

if (instance_exists(oPlayer)) && (position_meeting(oPlayer.x, oPlayer.y, id))
{
	if (!instance_exists(oTransition)) && (oPlayer.state != PlayerStateDead)
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = oPlayer.direction;
		with (oPlayer) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		instance_destroy();
		
		if (stopRunning)
		{
			oPlayer.vSpeed = 0;
			oPlayer.hSpeed = 0;
		}
	}
}