/// @description Insert description here
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sSlime;

//Enemy Script
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;