/// @description
#region Input - accept from all controllers
var _start = false, _button = false, _save = false;
for(var i = 0; i < number_of_devices; i++)
	{
	if (gamepad_button_check_pressed(i, menu_ready_button)) _start = true;
	if (gamepad_button_check_pressed(i, menu_confirm_button)) _button = true;
	if (gamepad_button_check_pressed(i, menu_option_button)) _save = true;
	}
if (keyboard_check_pressed(menu_ready_key)) _start = true;
if (keyboard_check_pressed(menu_confirm_key)) _button = true;
if (keyboard_check_pressed(vk_backspace)) _save = true;
#endregion	

if (_start || _button)
	{
	room_goto(rm_CSS);
	}

//Offset
offset = lerp(offset, 0, 0.1);
if (offset <= 0.1)
	{
	offset = 0;
	}

//Save replay
if (!setting().replay_mode && setting().replay_record && can_save_replay)
	{
	if (_save)
		{	
		can_save_replay = false;
		var _time = get_replay_data()[? "TIME"];
		Replay_Save(version + "/" + "Replay " + _time + ".pfe");
		}
	}