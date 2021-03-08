///@func hitbox_set_overlay_sprite(hitbox,sprite,frame,speed,scale,angle,color,alpha,facing)
///@param hitbox
///@param sprite
///@param frame
///@param speed
///@param scale
///@param angle
///@param color
///@param alpha
///@param facing
///@desc Sets the overlay sprite properties for a hitbox
function hitbox_set_overlay_sprite() {
	with(argument[0])
		{
		overlay_sprite = argument[1];
		overlay_frame  = argument[2];
		overlay_speed  = argument[3];
		overlay_scale  = argument[4];
		overlay_angle  = argument[5];
		overlay_color  = argument[6];
		overlay_alpha  = argument[7];
		overlay_facing = argument[8];
		}


}
