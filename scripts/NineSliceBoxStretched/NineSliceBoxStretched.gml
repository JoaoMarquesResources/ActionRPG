// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NineSliceBoxStretched(sprite, x1, y1, x2, y2, index){
	var _size = sprite_get_width(sprite) / 3;
	var _w = x2 - x1;
	var _h = y2 - y1

	//MIDDLE
	draw_sprite_part_ext(sprite, index, _size, _size, 1, 1, x1 + _size,y1 + _size, _w - (_size * 2), _h - (_size * 2), c_white, draw_get_alpha());

	//CORNERS
	//TOP LEFT
	draw_sprite_part(sprite, index, 0, 0, _size, _size, x1, y1);
	//TOP RIGHT
	draw_sprite_part(sprite, index, _size * 2, 0, _size, _size, x1 + _w - _size, y1);
	//BOTTOM LEFT
	draw_sprite_part(sprite, index, 0, _size * 2, _size, _size, x1, y1 + _h - _size);
	//BOTTOM RIGHT
	draw_sprite_part(sprite, index, _size * 2, _size * 2, _size, _size, x1 + _w - _size, y1 + _h - _size);

	//EDGES
	//LEFT
	draw_sprite_part_ext(sprite, index, 0, _size, _size, 1, x1, y1 + _size, 1, _h - (_size * 2), c_white, draw_get_alpha());
	//RIGHT
	draw_sprite_part_ext(sprite, index, _size * 2, _size, _size, 1, x1 + _w - _size, y1 + _size, 1, _h - (_size * 2), c_white, draw_get_alpha());
	//TOP
	draw_sprite_part_ext(sprite, index, _size, 0, 1, _size, x1 + _size, y1, _w - (_size * 2), 1, c_white, draw_get_alpha());
	//BOTTOM
	draw_sprite_part_ext(sprite, index, _size, _size * 2, 1, _size, x1 + _size, y1 + _h - (_size), _w - (_size * 2), 1, c_white, draw_get_alpha());
}