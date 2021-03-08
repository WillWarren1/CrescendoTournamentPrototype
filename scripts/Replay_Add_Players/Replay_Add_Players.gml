///@func Replay_Add_Players(buffer)
///@param buffer
///@desc Adds all of the players and their settings
function Replay_Add_Players() {
	var _b = argument[0];

	//Save number of players
	buffer_write(_b, buffer_u8, engine().number_of_players);
	//log(engine().number_of_players);

	//For each player
	for(var i = 0; i < engine().number_of_players; i++)
		{
		var _p = Player_Data_Get(i, PLAYER_DATA.profile);
		var _map = Profile_Get(_p, PROFILE.custom_controls);
		var _scs = _map[? "SCS"];
		var _n = Profile_Get(_p, PROFILE.name);
	
		//Save their data to the buffer
		buffer_write(_b, buffer_u8, Player_Data_Get(i, PLAYER_DATA.character));
		buffer_write(_b, buffer_u8, Player_Data_Get(i, PLAYER_DATA.color));
		buffer_write(_b, buffer_u8, Player_Data_Get(i, PLAYER_DATA.device));
		buffer_write(_b, buffer_u8, Player_Data_Get(i, PLAYER_DATA.device_type));
		buffer_write(_b, buffer_bool, Player_Data_Get(i, PLAYER_DATA.is_cpu));
		buffer_write(_b, buffer_u8, Player_Data_Get(i, PLAYER_DATA.cpu_type));
		buffer_write(_b, buffer_u16, _scs);
		buffer_write(_b, buffer_string, _n);
		}
	//log("WRITE: " + string(buffer_tell(_b)));


}
