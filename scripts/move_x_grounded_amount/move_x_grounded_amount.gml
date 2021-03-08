///@func move_x_grounded_amount(edge_buffer,hsp)
///@param edge_buffer
///@param hsp
///@desc Moving function that will stop at edges
function move_x_grounded_amount() {
	//This variable controls how close to the edge the player can get
	//If the player is already closer to the ledge, they will NOT be moved back
	var _edge_buffer = argument[0];
	var _hsp = argument[1];
	for(hsp_moved = 0; hsp_moved < abs(_hsp); hsp_moved++)
		{
		//If the player moved forward by the edge buffer amount and would be off an edge, stop moving.
		var _pos, _break, _hsp_moved;
		_pos = [x, y];
		_break = false;
		_hsp_moved = hsp_moved;
	
		move_x(_edge_buffer * sign(_hsp));
	
		if (!on_ground()) then _break = true;

		x = _pos[0];
		y = _pos[1];
		hsp_moved = _hsp_moved;
	
		if (_break)
			{
			break;
			}
		
		//If you're not moving into a block
		if (!collision(x + sign(_hsp), y, flags_create(FLAG.solid)))
			{
			//Go down slopes
			if (move_with_slope_x(_hsp))
				{
				//Successfully move down the slope
				}
			else
				{
				//Move normally
				x += sign(_hsp);
				}
			}
		else
			{
			//Go up slopes
			if (move_against_slope_x(_hsp))
				{
				//Successfully moved up the slope
				}
			else
				{
				//Hitting a wall
				break;
				}
			}
		}


}
