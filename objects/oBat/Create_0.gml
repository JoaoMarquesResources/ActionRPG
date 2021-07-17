/// @description Insert description here
event_inherited();
state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sBat;
sprAttack = sBat;
sprDie = sBatDie;
sprHurt = sBatHurt;

//Enemy Script
enemyScript[ENEMYSTATE.WANDER] = BatWander;
enemyScript[ENEMYSTATE.CHASE] = BatChase;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;

entityDropList = choose
(
	[oCoin],
	[oCoin, oCoin],
	[oBombDrop],
	[oArrowDrop],
	-1,
	-1,
	-1
)