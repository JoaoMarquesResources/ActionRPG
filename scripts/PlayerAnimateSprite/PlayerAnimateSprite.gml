// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimateSprite(){
	var _cardinalDirection = round(direction/90); //Converting our degrees(0 - 360) into a number (0 até 3);
	var _totalFrames = sprite_get_number(sprite_index) / 4; //8
	image_index = localFrame + (_cardinalDirection * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE; //Vai adicionar (15 / 60 = 0.25) a cada step
	
	//If animation would loop on next game step
	if (localFrame >= _totalFrames) //Se 8 localFrame >= 8, chegou ao fim da anim
	{
		animationEnd = true; //No momento pus isto, n serve para nd mas no futuro deve servir
		localFrame -= _totalFrames; //Se chegou ao fim da animação, por ex: chegou ao fim da animação de andar para a dir, -= 8 frames para fazer loop
	}else animationEnd = false;
}

//Ao converteres degrees into a number (0 - 3); A direita vai ser 0, up = 1, esq = 2, down = 3;
//localFrame = 0;
//_cardinalDirection = dir = 0; up = 1; esq = 2; down = 3;
//_totalFrame = 8;
//Ex: Andar para cima -> image_index = 0 + (1 * 8); image_index = 8 = QUANDO COMÇEÇA A ANIMAÇÃO PARA CIMA;
//Só funciona pq as animações do player estao divididas de 8 em 8 frames;