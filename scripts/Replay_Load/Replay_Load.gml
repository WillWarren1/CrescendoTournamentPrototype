///@func Replay_Load(filename)
///@param filename
function Replay_Load() {
	var _name = version + "/" + argument[0];
	
	//Get the buffer data from the file
	var _compress = buffer_load(_name);
	if (buffer_exists(_compress))
		{
		var _load = buffer_decompress(_compress);

		//Get the metadata
		//show_message("REPLAY SIZE (bytes): " + string(buffer_get_size(_load)));
		buffer_seek(_load, buffer_seek_start, 0);
		var _time = buffer_read(_load, buffer_string);
		buffer_read(_load, buffer_u8);
		var _seed = buffer_read(_load, buffer_f64);
		random_set_seed(_seed);
	
		setting().match_stage = buffer_read(_load, buffer_u32);
		setting().match_stock = buffer_read(_load, buffer_s16);
		setting().match_time = buffer_read(_load, buffer_s16);
		setting().match_stamina = buffer_read(_load, buffer_s16);
	
		//Player metadata
		Replay_Load_Players(_load);

		//Get the individual player buffers
		for(var i = 0; i < max_players; i++)
			{
			//Clear the buffer and copy the new contents into it
			var _buffer = get_game_replay_list()[| i];
			buffer_reset(_buffer);
	
			//Find the end of that player's contents
			Replay_Buffer_Load_Chunk(_load, _buffer);
			}
	
		//Destroy buffers
		buffer_delete(_compress);
		}
	else
		{
		crash("Replay has failed to load because the file does not exist");
		}
	buffer_delete(_load);
}