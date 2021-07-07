/// @description Insert description here
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sSlime;
sprAttack = sSlimeAttack;

//Enemy Script
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;