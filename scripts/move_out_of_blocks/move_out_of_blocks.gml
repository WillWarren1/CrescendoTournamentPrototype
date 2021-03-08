///@func move_out_of_blocks(direction, [dist], [flags])
///@param direction
///@param [dist]
///@param [flags]
///@desc Tries to move the player out of blocks. 
function move_out_of_blocks() {
	//Use the direction 361 or -1 to check 8 possible directions
	var _d = argument[0];
	var _l = argument_count > 1 ? argument[1] : 500;
	var _f = argument_count > 2 ? argument[2] : flags_create(FLAG.solid);

	if (!collision(x, y, _f)) then return false;

	if (_d != 361 && _d != -1)
		{
		for(var i = 0; i < _l; i++)
			{
			if (!collision(x + round(lengthdir_x(i, _d)), y + round(lengthdir_y(i, _d)), _f))
				{
				x += round(lengthdir_x(i, _d));
				y += round(lengthdir_y(i, _d));
				return true;
				}
			}
		}
	else
		{
		for(var i = 0; i < _l; i++)
			{
			for(var m = 0; m < 8; m++)
				{
				if (!collision(x + round(lengthdir_x(i, m * 45)), y + round(lengthdir_y(i, m * 45)), _f))
					{
					x += round(lengthdir_x(i, m * 45));
					y += round(lengthdir_y(i, m * 45));
					return true;
					}
				}
			}
		}
	return false;
}