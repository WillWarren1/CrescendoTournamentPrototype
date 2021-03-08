///@func jostle_players([strength],[type])
///@param [strength]
///@param [type]
function jostle_players() {
	var _s = argument_count > 1 ? argument[1] : jostle_strength;
	var _t = argument_count > 0 ? argument[0] : jostle_default_type;

	//Push away other players
	with(obj_player)
		{
		if (id == other.id) then continue;
	
		//Make sure the player is in a state that can be jostled
		if (!array_contains(jostle_states, state)) then continue;
	
		//Check that the players are overlapping
		if (!place_meeting(x, y, other.id)) then continue;
		
		if (_t == JOSTLE_TYPE.gradual)
			{
			var _diff = sign(x - other.x);
			//Default push direction
			if (_diff == 0) then _diff = other.facing;
			//Push the opponent
			move_x_grounded_amount(sprite_get_width(mask_index), _s * _diff);
			}
		else if (_t == JOSTLE_TYPE.instant)
			{
			var _diff = sign(x - other.x);
			//Default push direction
			if (_diff == 0) then _diff = other.facing;
			//Push the opponent
			var _spd = (abs(other.hsp) != 0 ? abs(other.hsp) : 1) * _s * _diff;
			move_x_grounded_amount(sprite_get_width(mask_index), _spd);
			//Move until you no longer overlap the opponent
			with(other)
				{
				if (hsp != 0)
					{
					for(var i = 0; i < abs(hsp); i++)
						{
						if (place_meeting(x, y, other.id))
							{
							move_x_grounded_amount(sprite_get_width(mask_index), -_diff)
							}
						else break;
						}
					}
				}
			}
		}
}