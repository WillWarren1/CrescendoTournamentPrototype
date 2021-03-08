///@func anim_define_ext(sprite,[frame],[speed],[scale],[angle],[color],[alpha],[offsetx],[offsety],[loop],[finish_anim])
///@param sprite
///@param [frame]
///@param [speed]
///@param [scale]
///@param [angle]
///@param [color]
///@param [alpha]
///@param [offsetx]
///@param [offsety]
///@param [loop]
///@param [finish_anim]
///@desc Defines a new animation with the given properties. The finish animation CANNOT be an animation with its own finish animation.
function anim_define_ext() {
	var _new = [];
	_new[ANIMATION._FLAG_] =	undefined;
	_new[ANIMATION.sprite] =	argument[0];
	_new[ANIMATION.frame] =		argument_count > 1 ? argument[1] : anim_frame_normal;
	_new[ANIMATION.speed] =		argument_count > 2 ? argument[2] : anim_speed_normal;
	_new[ANIMATION.scale] =		argument_count > 3 ? argument[3] : anim_scale_normal;
	_new[ANIMATION.angle] =		argument_count > 4 ? argument[4] : anim_angle_normal;
	_new[ANIMATION.color] =		argument_count > 5 ? argument[5] : anim_color_normal;
	_new[ANIMATION.alpha] =		argument_count > 6 ? argument[6] : anim_alpha_normal;
	_new[ANIMATION.offsetx] =	argument_count > 7 ? argument[7] : anim_offset_normal;
	_new[ANIMATION.offsety] =	argument_count > 8 ? argument[8] : anim_offset_normal;
	_new[ANIMATION.loop] =		argument_count > 9 ? argument[9] : anim_loop_normal;
	_new[ANIMATION.finish] =	argument_count > 10 ? argument[10] : anim_finish_normal;
	return _new;


}
