/// @description Draw game UI
// You can write your code in this editor

#region DrawHealth
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
#endregion

//Coins
var _xx, _yy;

//Coin Icon
_xx = 28;
_yy = 31;
draw_sprite(sCoinUI, 0, _xx, _yy);

//Coin Text
draw_set_color(c_black);
draw_set_font(fText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
_xx += sprite_get_width(sCoinUI) + 4;
_yy = 27;
var _str = string(global.playerMoney);
draw_text(_xx + 1, _yy, _str);
draw_text(_xx - 1, _yy, _str);
draw_text(_xx, _yy + 1, _str);
draw_text(_xx, _yy - 1, _str);
draw_set_color(c_white);
draw_text(_xx, _yy, _str);

//Draw item box
_xx = 8;
_yy = 24;

draw_sprite(sitemUIBox, 0, _xx, _yy);
if (global.playerHasAnyItems)
{
	draw_sprite(sItemUI, global.playerEquipped, _xx, _yy);
	if (global.playerAmmo[global.playerEquipped] != -1) //este item usa ammo
	{
		draw_set_font(fAmmo);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		draw_text
		(
			_xx + sprite_get_width(sitemUIBox) + 1,
			_yy + sprite_get_height(sitemUIBox) + 1,
			string(global.playerAmmo[global.playerEquipped])
		);
	}
}

//Pause Screen
if (global.gamePaused)
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "...Game Paused...");
	for (var i = 0; i < array_length(pauseOption); i++)
	{
		var _print = "";
		if (i == pauseOptionSelected)
		{
			_print += "> " + pauseOption[i] + " <";
		}
		else
		{
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 18 + (i * 12), _print);
		draw_set_alpha(1.0);
	}
}