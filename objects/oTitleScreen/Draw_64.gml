/// @description Insert description here
// You can write your code in this editor

//https://www.youtube.com/watch?v=8KD4_2CHLR0&list=PLPRT_JORnIuosvhfax2TQTEmN7OYTcSvK&index=51
if (titleVisible > 0)
{
	draw_sprite(sTitle, 0, 0, -RESOLUTION_H + titleVisible * RESOLUTION_H);
	
	draw_set_alpha(titleVisible * abs(sin(get_timer() * 0.000001 * pi)));
	draw_sprite(sTitle, 1, 0, 0);
	draw_set_alpha(1.0);
}