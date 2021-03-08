function ui_button_image_create() {
	image_blend = color_normal;

	ui_clicked = false;
	ui_hovered = false;
	ui_click_hold = false;
	ui_cursor_index = -1;

	if (sprite != noone)
		{
		sprite_index = sprite;
		image_speed = 0;
		image_index = frame;
		}


}
