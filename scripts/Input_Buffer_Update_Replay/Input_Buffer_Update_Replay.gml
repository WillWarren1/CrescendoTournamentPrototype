///@func Input_Buffer_Update_Replay(buffer_index,count)
///@param buffer_index
///@param count
///Can only be called by players
function Input_Buffer_Update_Replay() {
	var _buffer, _cc, _count;
	_buffer = argument[0];
	_cc = custom_controls;
	_count = argument[1];
	
	//Update input buffer
	#region Input Buffer Count
	if (_count)
		{
		//Counts for each input
		for(var i = 0; i < (INPUT.length * 2); i++)
			{
			_buffer[| i] = min(++_buffer[| i], max_buffer_length);
			}
		}
	#endregion
	#region Check the replay data
	//Get the buffer
	var _load = get_game_replay_list()[| player_number];
	#endregion
	#region Update
	//Loop through the inputs
	var _flag = buffer_read(_load, buffer_u32);
	for(var i = 0; i < (INPUT.length * 2); i++)
		{
		if (bitflag_read(_flag, i))
			{
			_buffer[| i] = 0;
			}
		}

	//Control stick data
	var _lx = real(buffer_read(_load, buffer_f64)),
		_ly = real(buffer_read(_load, buffer_f64)),
		_rx = real(buffer_read(_load, buffer_f64)),
		_ry = real(buffer_read(_load, buffer_f64));
	
	Stick_Cache_Values(Rstick, _rx, _ry, _count);
	Stick_Cache_Values(Lstick, _lx, _ly, _count);

	//Stick frames
	control_flicked_l = buffer_read(_load, buffer_s8);
	control_tilted_l = buffer_read(_load, buffer_s8);
	control_flicked_r = buffer_read(_load, buffer_s8);
	control_tilted_r = buffer_read(_load, buffer_s8);
	#endregion

	//*/DEBUG
	if (replay_sync_mode)
		{
		var _x = buffer_read(_load, buffer_s16);
		var _y = buffer_read(_load, buffer_s16);
		var _s = buffer_read(_load, buffer_u8);
		var _h = buffer_read(_load, buffer_f64);
		var _v = buffer_read(_load, buffer_f64);
		var _d = buffer_read(_load, buffer_f64);
		//var _h = buffer_read(_load, buffer_f64);
		if (x != _x || y != _y || state != _s || hsp != _h || vsp != _v || stick_get_direction(Lstick) != _d)
			{
			crash(to_string
				(
				"A desync has occured. Frame: ", obj_game.current_frame, 
				". State: ", Player_State_Name_Get(state), ", should be ", Player_State_Name_Get(_s), 
				". Player number: ", player_number, 
				". X: ", x, " Y: ", y, ", should be ", _x, ", ", _y,
				". H: ", hsp, " V: ", vsp, ", should be ", _h, ", ", _v,
				". Dir: ", _d, ", should be ", stick_get_direction(Lstick),
				));
			}
		}
	//*/
}