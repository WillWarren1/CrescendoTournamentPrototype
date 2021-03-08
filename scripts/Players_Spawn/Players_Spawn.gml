///@func Players_Spawn()
function Players_Spawn() {
	//Loop through each player in the match and spawn
	//If there are not enough player spawners in the room, then not all of the players will spawn
	var _n = instance_number(obj_player_spawner);
	for(var i = 0; i < min(engine().number_of_players, _n); i++)
		{
		var _s = instance_find(obj_player_spawner, i);
		with(instance_create_layer(_s.x, _s.y, _s.layer, obj_player))
			{
			//Pass in character script
			var _data = engine().players[@ i];
			var _character_number = _data[PLAYER_DATA.character];
			var _char = character_data_get_all()[_character_number];
			character = _data[PLAYER_DATA.character];
			character_script = _char[CHARACTER_DATA.script];
		
			//Move up out of blocks
			for(var m = 0; 
				(collision(x, y, flags_create(FLAG.solid)) || 
				(collision(x, y, flags_create(FLAG.plat)) && !on_ground())) &&
				m < 9999; 
				m++)
				{
				y--;
				}
			
			//Assign Controllers
			device = _data[PLAYER_DATA.device];
			device_type = _data[PLAYER_DATA.device_type];
			player_number = i;
			player_color = _data[PLAYER_DATA.color]; //Offset for palettes
			player_profile = _data[PLAYER_DATA.profile];
			is_cpu = _data[PLAYER_DATA.is_cpu];
			cpu_type = _data[PLAYER_DATA.cpu_type];
		
			//Custom controls
			var _map = Profile_Get(_data[PLAYER_DATA.profile], PROFILE.custom_controls);
			if (is_cpu)
				{
				custom_controls = [];
				}
			else
				{
				custom_controls = custom_controls_unpack(_map, device_type);
				}
			
			//Special Control Settings
			var _scs = scs_convert_from_int(custom_controls_get_scs(_map));
			scs_short_hop_aerial = _scs[0];
			scs_tap_jump = _scs[1];
			scs_AB_smash = _scs[2];
			scs_smash_stick = _scs[3];
			scs_switch_sticks = _scs[4];
			scs_auto_walk = _scs[5];
			scs_right_stick_input = _scs[6];
			}
		}


}
