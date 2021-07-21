/// @description Progress Transition
// You can write your code in this editor

with (oPlayer)
{
	if (state != PlayerStateTransition) state = PlayerStateTransition;
}

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED); //Fazer com q chegue a 1
	if (percent >= 1) //if screen fully obscured
	{
		
		show_message(target);
		room_goto(target);
		leading = IN;
	}
	
}else//IN
{
	percent = max(0, percent - TRANSITION_SPEED); //fazer com q chegue a 0
	if (percent <= 0) //if screen fullt revealed
	{
		with (oPlayer) state = PlayerStateFree;
		instance_destroy();
	}
}

//show_debug_message(leading);
//show_debug_message(percent);
