///@func css_player_add(index,cpu,[device],[device_type],[profile])
///@param index
///@param cpu
///@param [device]
///@param [device_type]
///@param [profile]
///@desc Adds a player to the character select. Returns the index
function css_player_add() {

	var _num = css_number_of_players();
	var _index = argument[0];
	var _cpu = argument[1];
	var _device = argument_count > 2 ? argument[2] : -1;
	var _device_type = argument_count > 3 ? argument[3] : DEVICE.controller;
	var _profile = argument_count > 4 ? argument[4] : Profile_Create("Player " + string(_num + 1), 0, 0, custom_controls_create(), [], 0, true);
	var _character = character_count() - 1;
	var _color = css_get_next_character_color(_index, _character, 0, 1);

	//CPU defaults
	if (_cpu)
		{
		_device = -1;
		_device_type = DEVICE.none;
		}

	with(obj_css_data)
		{
		var _size = ds_list_size(players);
		if (_size < max_players)
			{
			//Player data defaults
			var _new = [];
			_new[CSS_PLAYER.index] = _index;
			_new[CSS_PLAYER.device] = _device;
			_new[CSS_PLAYER.device_type] = _device_type;
			_new[CSS_PLAYER.character] = _character;
			_new[CSS_PLAYER.color] = _color;
			_new[CSS_PLAYER.profile] = _profile;
			_new[CSS_PLAYER.is_cpu] = _cpu;
			_new[CSS_PLAYER.cpu_type] = CPU_TYPE.attack;
			_new[CSS_PLAYER.ready] = (_cpu ? true : false);
			ds_list_add(players, _new);
		
			//Return the index
			return (ds_list_size(players) - 1);
			}
		else
			{
			return noone;
			}
		}


}
