function ui_button_step() {
	if (ui_click_hold)
		{
		image_blend = color_clicked;
		}
	else if (ui_hovered)
		{
		image_blend = color_hover;
		}
	else
		{
		image_blend = color_normal;
		}
}