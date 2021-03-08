/// @description
var _gx = 0;
var _gy = 0;
var _confirm_press = false;
var _confirm = false;
var _cancel = false;
var _ready = false;

for(var i = 0; i < engine().number_of_players; i++)
	{
	var _is_cpu = Player_Data_Get(i, PLAYER_DATA.is_cpu);
	if (_is_cpu) then continue;
	
	var _device = Player_Data_Get(i, PLAYER_DATA.device);
	var _device_type = Player_Data_Get(i, PLAYER_DATA.device_type);
	
	//Controllers
	if (_device_type == DEVICE.controller)
		{
		if (point_distance(0, 0, gamepad_axis_value(_device, gp_axislh), gamepad_axis_value(_device, gp_axislv)) > stick_tilt_amount)
			{
			_gx += gamepad_axis_value(_device, gp_axislh) * CSS_cursor_speed;
			_gy += gamepad_axis_value(_device, gp_axislv) * CSS_cursor_speed;
			}
		if (gamepad_button_check_pressed(_device, menu_confirm_button)) then _confirm_press = true;
		if (gamepad_button_check(_device, menu_confirm_button)) then _confirm = true;
		if (gamepad_button_check(_device, menu_cancel_button)) then _cancel = true;
		if (gamepad_button_check_pressed(_device, menu_ready_button)) then _ready = true;
		}
	//Keyboards
	else if (_device_type == DEVICE.keyboard)
		{
		_gx += (keyboard_check(menu_right_key) - keyboard_check(menu_left_key)) * CSS_cursor_speed;
		_gy += (keyboard_check(menu_down_key) - keyboard_check(menu_up_key)) * CSS_cursor_speed;
		if (keyboard_check_pressed(menu_confirm_key)) then _confirm_press = true;
		if (keyboard_check(menu_confirm_key)) then _confirm = true;
		if (keyboard_check(menu_cancel_key)) then _cancel = true;
		if (keyboard_check_pressed(menu_ready_key)) then _ready = true;
		}
	}
	
var _x = UI_Cursor_X(0);
var _y = UI_Cursor_Y(0);

//Update Cursor
UI_Cursor_Update
	(
	0,
	modulo(_x + _gx, room_width),
	modulo(_y + _gy, room_height),
	false,
	_confirm,
	);
	
//Update stage name label
var _inst = instance_position(UI_Cursor_X(0), UI_Cursor_Y(0), obj_sss_zone);
if (_inst != noone)
	{
	switch(_inst.stage)
		{
		case rm_Peak: stage_name_label.text = "Peak"; break;
		case rm_Battlefield: stage_name_label.text = "Battlefield"; break;
		case rm_Pillar: stage_name_label.text = "Pillar"; break;
		case rm_Large_Campground: stage_name_label.text = "Big Campground"; break;
		case rm_Centerpiece: stage_name_label.text = "Centerpiece"; break;
		case rm_Sloped_Edges: stage_name_label.text = "Sloped Edges"; break;
		case rm_Moving: stage_name_label.text = "Moving"; break;
		case rm_Campground: stage_name_label.text = "Small Campground"; break;
		case rm_Single: stage_name_label.text = "Single Platform"; break;
		case rm_Driller: stage_name_label.text = "Driller"; break;
		default: stage_name_label.text = "Stage Select";
		}
	//Selecting a stage
	if (_confirm_press)
		{
		setting().match_stage = _inst.stage;
		Match_Begin();
		}
	}