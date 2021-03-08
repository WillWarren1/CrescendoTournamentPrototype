///@func background_clear_activate(length,color,[fade_speed])
///@param length
///@param color
///@param [fade_speed]
///@desc Sets the background fade effect and the player fade effect.
function background_clear_activate() {
	with(obj_stage_manager)
		{
		background_clear_frame = argument[0];
		background_clear_color = argument[1];
		background_clear_fade_speed = argument_count > 2 ? argument[2] : 1.0;
		background_clear_amount = max(background_clear_amount, 0);
		}
	
	with(obj_player)
		{
		fade_value = 0;
		}
}