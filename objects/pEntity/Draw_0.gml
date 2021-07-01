/// @description Insert description here
if (entityShadow) draw_sprite(sShadow, 0, floor(x), floor(y));

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y - z), //nao é preciso o z mas ya
	image_xscale, 
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)