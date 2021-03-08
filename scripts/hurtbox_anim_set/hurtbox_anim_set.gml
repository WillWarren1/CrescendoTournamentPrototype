///@func hurtbox_anim_set(sprite,frame,xscale,yscale,angle)
///@param sprite
///@param frame
///@param xscale
///@param yscale
///@param angle
///@desc Changes the hurtbox sprite to match the current animation. Useful for attacks.
function hurtbox_anim_set() {
	if (sprite_exists(argument[0]))
		{
		hurtbox.sprite_index = argument[0];
		hurtbox.image_index = argument[1];
		hurtbox.image_xscale = argument[2];
		hurtbox.image_yscale = argument[3];
		hurtbox.image_angle = argument[4];
		}


}
