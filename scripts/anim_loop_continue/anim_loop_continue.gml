///@func anim_loop_continue(sprite/defined_animation)
///@param sprite/defined_animation
function anim_loop_continue() {
	if (is_array(argument[0]))
		{
		var _a = argument[0];
		if (anim_equals(_a)) then return false;
	
		anim_current =	_a;
		anim_sprite =	_a[ANIMATION.sprite];
		anim_frame =	_a[ANIMATION.frame];
		anim_speed =	_a[ANIMATION.speed];
		anim_scale =	_a[ANIMATION.scale];
		anim_angle =	_a[ANIMATION.angle];
		anim_color =	_a[ANIMATION.color];
		anim_alpha =	_a[ANIMATION.alpha];
		anim_offsetx =	_a[ANIMATION.offsetx];
		anim_offsety =	_a[ANIMATION.offsety];
		anim_loop =		_a[ANIMATION.loop];
		anim_finish =	_a[ANIMATION.finish];
		return true;
		}
	else if (sprite_exists(argument[0]))
		{
		anim_current = -1;
		anim_sprite = argument[0];
		return true;
		}


}
