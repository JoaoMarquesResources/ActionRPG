/// @description Insert description here
//Draw the shadow
draw_sprite(sShadow, 0, floor(x), floor(y));

//https://www.youtube.com/watch?v=WaWdZ6DW9M4&list=PLPRT_JORnIuosvhfax2TQTEmN7OYTcSvK&index=30
if (invulnerable != 0) && ((invulnerable mod 5 < 2) == 0) && (flash == 0)
{
	//skip draw
}
else
{
	if (flash != 0)
	{
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash, flash);
	}
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y - z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
	
	if (shader_current() != -1) shader_reset();
}

