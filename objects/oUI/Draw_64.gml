/// @description Draw Health
// You can write your code in this editor

//	https://www.youtube.com/watch?v=e-P8TX_wq-A&list=PLPRT_JORnIuosvhfax2TQTEmN7OYTcSvK&index=29

var _playerHealth = global.playerHealth; //Vida atual
var _playerHealthMax = global.playerHealthMax; //Vida maxima
var _playerHealthFrac = frac(_playerHealth);// Fraçoes da vida (0.25, 0.5, 0.75)
_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i++)
{
	var _imageIndex = (i > _playerHealth); //(i > _playerHealth) vai retornar true or false; 1 or 0;
	if (i == _playerHealth + 1)
	{
		_imageIndex += (_playerHealthFrac > 0); //0 or 1;
		_imageIndex += (_playerHealthFrac > 0.25); //0 or 1;
		_imageIndex += (_playerHealthFrac > 0.5); //0 or 1;
	}
	draw_sprite(sHealth, _imageIndex, 8 + ((i - 1) * 16), 8);
}
