///@func anim_define(sprite,[finish_anim])
///@param sprite
///@param [finish_anim]
///@desc The finish animation CANNOT be an animation with its own finish animation.
function anim_define() {
	var _new = [];
	_new[ANIMATION._FLAG_] =	undefined;
	_new[ANIMATION.sprite] =	argument[0];
	_new[ANIMATION.frame] =		anim_frame_normal;
	_new[ANIMATION.speed] =		anim_speed_normal;
	_new[ANIMATION.scale] =		anim_scale_normal;
	_new[ANIMATION.angle] =		anim_angle_normal;
	_new[ANIMATION.color] =		anim_color_normal;
	_new[ANIMATION.alpha] =		anim_alpha_normal;
	_new[ANIMATION.offsetx] =	anim_offset_normal;
	_new[ANIMATION.offsety] =	anim_offset_normal;
	_new[ANIMATION.loop] =		argument_count > 1 ? false : true;
	_new[ANIMATION.finish] =	argument_count > 1 ? argument[1] : anim_finish_normal;
	return _new;


}
