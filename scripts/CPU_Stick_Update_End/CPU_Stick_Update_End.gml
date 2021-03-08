///@func CPU_Stick_Update_End(sxl,syl,sxr,syr)
///@param sxl
///@param syl
///@param sxr
///@param syr
///Run in CPU_Input.
function CPU_Stick_Update_End(argument0, argument1, argument2, argument3) {

	Stick_Cache_Values(Lstick, argument0, argument1, false);

	var _dist = stick_get_distance(Lstick);
	if (_dist > stick_flick_amount &&
		stick_get_speed(Lstick) > stick_flick_speed &&
		control_flicked_l > stick_flick_cooldown)
		{
		control_flicked_l = 0;
		}
	if (_dist > stick_tilt_amount)
		{
		control_tilted_l = 0;
		}
	
	Stick_Cache_Values(Rstick, argument2, argument3, false);

	var _dist = stick_get_distance(Rstick);
	if (_dist > rstick_flick_amount &&
		stick_get_speed(Rstick) > rstick_flick_speed &&
		control_flicked_r > stick_flick_cooldown)
		{
		control_flicked_r = 0;
		}
	if (_dist > rstick_tilt_amount)
		{
		control_tilted_r = 0;
		}


}
