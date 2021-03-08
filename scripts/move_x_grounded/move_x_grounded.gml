///@func move_x_grounded(edge_buffer)
///@param edge_buffer
///@desc Moving function that will stop at edges
function move_x_grounded() {
	//This variable controls how close to the edge the player can get
	//If the player is already closer to the ledge, they will NOT be moved back
	var _edge_buffer = argument[0];
	
	//Initial future check
	var _store_x = x, _store_y = y;
	var _future_x = x, _future_y = y;
	
	move_x(_edge_buffer * sign(hsp));
	
	if (!on_ground())
		{
		x = _store_x;
		y = _store_y;
		return;
		}
	else
		{
		//Store the position we already checked up to
		_future_x = x;
		_future_y = y;
		x = _store_x;
		y = _store_y;
		}
	
	//Move pixel by pixel
	for(hsp_moved = 0; hsp_moved < abs(hsp); hsp_moved++)
		{
		//If the player moved forward by the edge buffer amount and would be off an edge, stop moving.
		var _pos, _hsp, _hsp_frac, _hsp_moved, _break;
		_pos = [x, y];
		_hsp = hsp;
		_hsp_frac = hsp_frac;
		_hsp_moved = hsp_moved;
		_break = false;
	
		x = _future_x;
		y = _future_y;
		
		move_x(sign(hsp));
		
		_future_x = x;
		_future_y = y;
		
		if (!on_ground()) then _break = true;

		x = _pos[0];
		y = _pos[1];
		hsp = _hsp;
		hsp_frac = _hsp_frac;
		hsp_moved = _hsp_moved;
	
		if (_break)
			{
			//hsp = 0;
			//hsp_frac = 0;
			break;
			}
		
		//If you're not moving into a block
		if (!collision(x + sign(hsp), y, flags_create(FLAG.solid)))
			{
			//Go down slopes
			if (move_with_slope_x(hsp))
				{
				//Successfully move down the slope
				}
			else
				{
				//Move normally
				x += sign(hsp);
				}
			}
		else
			{
			//Go up slopes
			if (move_against_slope_x(hsp))
				{
				//Successfully moved up the slope
				}
			else
				{
				//Hitting a wall
				hsp_frac = 0;
				hsp = 0;
				break;
				}
			}
		}


}
