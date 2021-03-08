///@func hitbox_move_attached(hitbox_id,x,y,[absolute])
///@param hitbox_id
///@param x
///@param y
///@param [absolute]
function hitbox_move_attached() {
	//Moves the attached hitbox with the given ID relative or absolute to it's position
	//It also moves the hitbox's "my_xstart" and "my_ystart" so the hitbox doesn't snap back to the player
	var _abs = argument_count > 3 ? argument[3] : false;
	if (instance_exists(argument[0]))
		{
		//Target the hitbox
		with(argument[0])
			{
			if (!_abs) 
				{
				x += argument[1];
				y += argument[2];
				owner_xstart -= argument[1];
				owner_ystart -= argument[2];
				}
			else
				{
				x = argument[1];
				y = argument[2];
				xstart = argument[1];
				ystart = argument[2];
				owner_xstart = owner.x;
				owner_ystart = owner.y;
				}
			}
		}


}
