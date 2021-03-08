///@func Replay_Load_Players(buffer)
///@param buffer
///@desc Loads players and sets up the match to use them
function Replay_Load_Players() {
	var _b = argument[0];

	//For each player
	var _players = buffer_read(_b, buffer_u8);
	engine().players = [];
	engine().number_of_players = _players;
	//log(engine().number_of_players);

	for(var i = 0; i < _players; i++)
		{
		//Grab data from the buffer and create a new player entry
		var _chr = buffer_read(_b, buffer_u8);
		var _col = buffer_read(_b, buffer_u8);
		var _dev = buffer_read(_b, buffer_u8);
		var _typ = buffer_read(_b, buffer_u8);
		var _cpu = buffer_read(_b, buffer_bool);
		var _cty = buffer_read(_b, buffer_u8);
		var _scs = buffer_read(_b, buffer_u16);
		var _name = buffer_read(_b, buffer_string);
		var _prof = Profile_Create(_name, 0, 0, custom_controls_create(true), [], 0, true);
		var _map = Profile_Get(_prof, PROFILE.custom_controls);
		_map[? "SCS"] = _scs;
	
		engine().players[@ i] = Player_Data_Create(_chr, _col, _dev, _typ, _prof, false, _cpu, _cty);
		}
	
	Profile_Save_All();
	//show_message("READ: " + string(buffer_tell(_b)));


}
