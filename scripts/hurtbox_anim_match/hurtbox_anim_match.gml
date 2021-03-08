///@func hurtbox_anim_match([hurtbox_sprite])
///@param [hurtbox_sprite]
///@desc Changes the hurtbox sprite to match the current animation. Useful for attacks.
function hurtbox_anim_match() {
	var _sprite = argument_count > 0 ? argument[0] : anim_sprite;
	if (sprite_exists(_sprite))
		{
		hurtbox.sprite_index = _sprite;
		hurtbox.image_index = anim_frame;
		hurtbox.image_xscale = sprite_scale * facing;
		hurtbox.image_yscale = sprite_scale;
		hurtbox.image_angle = anim_angle;
		}


}
