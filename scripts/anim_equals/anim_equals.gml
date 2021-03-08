///@func anim_equals(anim1)
///@param anim
///@desc Returns true if the player's current animation or sprite is equal to the given animation or sprite
function anim_equals(argument0) {
	var _a = argument0;
	//Animation check
	if (is_array(anim_current) && is_array(_a) && array_equals(anim_current, _a))
		{
		return true;
		}
	//Sprite check
	if (anim_sprite == _a)
		{
		return true;
		}
	return false;


}
