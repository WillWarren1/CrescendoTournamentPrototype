function ui_button_draw() {
	draw_sprite_ext(spr_pixel, 0, x, y, sprite_width, sprite_height, 0, image_blend, 1);

	if (text != "")
		{
		if (font != -1) then draw_set_font(font);
		draw_text(x + (sprite_width / 2), y + (sprite_height / 2), text);
		draw_set_font(fnt_consolas);
		}


}
