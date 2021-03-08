///@func hitbox_set_sprite_angle(hitbox,angle)
///@param hitbox
///@param angle
function hitbox_set_sprite_angle() {
	with(argument[0])
		{
		image_angle = owner.facing == 1 ? argument[1] : -argument[1];
		}
}