///@func apply_sakurai_angle
///@param angle_flipper
///@param knockback
///@desc Applies special properties of the sakurai angle to the calling player.
function apply_sakurai_angle() {
	var _flipper = argument[0];
	var _knockback = argument[1];

	if (_flipper == FLIPPER.sakurai || _flipper == FLIPPER.sakurai_reverse)
		{
		if (_knockback < s_angle_knockback_threshold)
			{
			if (on_ground())
				{
				di_angle = 0;
				asdi_multiplier = 0;
				can_tech = false;
				}
			}
		}
}