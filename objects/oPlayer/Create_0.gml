/// @description Insert description here
state = PlayerStateFree; //N se poe () pq n é para executalo mas sim so guarda lo numa var
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
speedBonk = 1.5;
speedHook = 3.0;

distanceRoll = 52; //Distancia do Roll
distanceBonk = 40;
distanceBonkHeight = 12;
distanceHook = 88;


z = 0;
invulnerable = 0; //number of frames
flash = 0;
flashShader = shWhiteFlash;
animationEndScript = -1;
spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(sHookChain);

if (global.targetX != -1) //Nao é nd
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

if (global.iLifted != noone) //estamos a carregar algo
{
	spriteIdle = sPlayerCarrying;
	spriteRun = sPlayerRunCarrying;
	sprite_index = spriteIdle;
}