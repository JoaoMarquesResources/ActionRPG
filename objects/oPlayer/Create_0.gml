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
distanceRoll = 52; //Distancia do Roll

distanceBonk = 40;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;
