// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){
	//Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * (_totalFrames)), _totalFrames - 1);//Usamos este "min" para asegurar q a animação vai do frame 0 até ao 5 (q são 6 frames), não pode ser do frame 0 ao 6, pq assim iria apanhar um frame da animação seguinte por isso fica vai retornar o minimo entre: min(FrameAtual, 5);
	/*image_index = 0 * 6 + ((1 - (26 / 52)) * 6) = 3;
	
	  O exemplo a cima é Roll para dir:
	  CARDINAL_DIR = 0; //pq estou a fazer roll para dir
	  _totalFrames = 6; //Numero q dura a animação do roll
	  moveDistanceRemaining = depende da distancia q falta para acabar o roll, imagina q vamos a meio = 26 (52 / 2);
	  distanceRoll = 52;
	  
	  Basicamente na conta a cima estamos a meio do roll e vamos no image = 3;
	*/
	
	//Change State
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;
	}
	
	if (_collided)
	{
		state = PlayerStateBonk;
		moveDistanceRemaining = distanceBonk;
		ScreenShake(5, 25);
	}
}