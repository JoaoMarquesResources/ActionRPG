/// @description Draw Text Box
// You can write your code in this editor
NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _print = string_copy(message, 1, textProgress);

if (responses[0] != -1) && (textProgress >= string_length(message)) //Se foi exibido todo o texto
{
	for (var i = 0; i < array_length_1d(responses); i++)
	{
	    _print += "\n";
		if (i == responseSelected) _print += "> ";
		_print += responses[i];
		if (i == responseSelected) _print += " <"; //esta a seguir á response para criar a seta á frente

	}
}

draw_text((x1 + x2) / 2, y1 + 8, _print);
draw_set_color(c_white);
draw_text((x1 + x2) / 2, y1 + 7, _print);