///@func css_ui_create_player(number,button_index,cpu,group,size_number)
///@param number
///@param button_index
///@param cpu
///@param group
///@param size_number
function css_ui_create_player(argument0, argument1, argument2, argument3, argument4) {

	var _num = argument0;
	var _index = argument1;
	var _cpu = argument2;
	var _group = argument3;
	var _size = argument4;
	var _layer = "UI_Players_Layer";
	var _color = css_ui_color_get(_num, _cpu);
	var _h = color_get_hue(_color), _s = color_get_saturation(_color), _v = color_get_value(_color);
	var _color_hover = make_color_hsv(_h, _s, _v + 20);
	var _color_clicked = make_color_hsv(_h, _s - 20, _v + 30);

	if (_size == 0)
		{
		var _x = 48 + (_num * 224);
		var _y = 336;

		//Group
		with(instance_create_layer(_x, _y, _layer, obj_ui_group))
			{
			ui_set_group(id, _group);
			}
		//Top Buttons
		if (!_cpu)
			{
			with(instance_create_layer(_x + 32, _y + 12, _layer, obj_ui_image))
				{
				sprite_index = spr_icon_character;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x, _y, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_character_button_step;
				image_xscale = 2;
				image_yscale = 0.75;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				}
			with(instance_create_layer(_x + 88, _y + 12, _layer, obj_ui_image))
				{
				sprite_index = spr_icon_controls;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x + 64, _y, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_controls_button_step;
				image_xscale = 1.5;
				image_yscale = 0.75;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				}
			with(instance_create_layer(_x + 136, _y + 12, _layer, obj_ui_image))
				{
				sprite_index = spr_icon_playtest;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x + 112, _y, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_playtest_button_step;
				image_xscale = 1.5;
				image_yscale = 0.75;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				}
			}
		with(instance_create_layer(_x + 184, _y + 12, _layer, obj_ui_image))
			{
			sprite_index = spr_icon_close;
			ui_set_group(id, _group);
			}
		with(instance_create_layer(_x + 160, _y, _layer, obj_ui_button))
			{
			ui_script_step = css_ui_player_delete_button_step;
			image_xscale = 1.5;
			image_yscale = 0.75;
			ui_set_group(id, _group);
			index = _index;
			anyone_can_interact = _cpu;
			}
		//Set Colors
		ui_button_set_colors(noone, _color, _color_hover, _color_clicked, _group);
		if (!_cpu)
			{
			//Player Name
			with(instance_create_layer(_x + 4, _y + 160, _layer, obj_ui_label))
				{
				ui_script_step = css_ui_player_name_label_step;
				text = "Player " + string(_num + 1);
				halign = -1;
				index = _index;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x, _y + 160, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_name_button_step;
				image_xscale = 6.5;
				image_yscale = 1;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				ui_button_set_colors(id, _color, _color_hover, _color_clicked);
				}
			}
		//Portrait
		with(instance_create_layer(_x + 104, _y + 96, _layer, obj_css_player_window))
			{
			sprite_index = spr_css_random;
			ui_set_group(id, _group);
			//Pass the player index to it specifically
			index = _index;
			//Get the custom controls map
			custom_controls_map = Profile_Get(css_player_get(index, CSS_PLAYER.profile), PROFILE.custom_controls);
			//log(custom_controls_map, " map");
			half_width = 104;
			half_height = 72;
			}
		with(instance_create_layer(_x, _y, _layer, obj_ui_section))
			{
			image_xscale = 6.5;
			image_yscale = 6;
			image_blend = css_ui_color_get(_num, _cpu);
			ui_set_group(id, _group);
			}
		}
	else if (_size == 1)
		{
		var _x = 48 + (_num * 112);
		var _y = 336;
		//Group
		with(instance_create_layer(_x, _y, _layer, obj_ui_group))
			{
			ui_set_group(id, _group);
			}
		//Top Buttons
		if (!_cpu)
			{
			with(instance_create_layer(_x + 12, _y + 12, _layer, obj_ui_image))
				{
				sprite_index = spr_icon_character;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x, _y, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_character_button_step;
				image_xscale = 0.75;
				image_yscale = 0.75;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				}
			with(instance_create_layer(_x + 36, _y + 12, _layer, obj_ui_image))
				{
				sprite_index = spr_icon_controls;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x + 24, _y, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_controls_button_step;
				image_xscale = 0.75;
				image_yscale = 0.75;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				}
			with(instance_create_layer(_x + 60, _y + 12, _layer, obj_ui_image))
				{
				sprite_index = spr_icon_playtest;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x + 48, _y, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_playtest_button_step;
				image_xscale = 0.75;
				image_yscale = 0.75;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				}
			}
		with(instance_create_layer(_x + 84, _y + 12, _layer, obj_ui_image))
			{
			sprite_index = spr_icon_close;
			ui_set_group(id, _group);
			}
		with(instance_create_layer(_x + 72, _y, _layer, obj_ui_button))
			{
			ui_script_step = css_ui_player_delete_button_step;
			image_xscale = 0.75;
			image_yscale = 0.75;
			ui_set_group(id, _group);
			index = _index;
			anyone_can_interact = _cpu;
			}
		//Set Colors
		ui_button_set_colors(noone, _color, _color_hover, _color_clicked, _group);
		if (!_cpu)
			{
			//Player Name
			with(instance_create_layer(_x + 4, _y + 160, _layer, obj_ui_label))
				{
				ui_script_step = css_ui_player_name_label_step;
				text = "Player " + string(_num + 1);
				halign = -1;
				index = _index;
				ui_set_group(id, _group);
				}
			with(instance_create_layer(_x, _y + 160, _layer, obj_ui_button))
				{
				ui_script_step = css_ui_player_name_button_step;
				image_xscale = 3;
				image_yscale = 1;
				ui_set_group(id, _group);
				index = _index;
				anyone_can_interact = _cpu;
				ui_button_set_colors(id, _color, _color_hover, _color_clicked);
				}
			}
		//Portrait
		with(instance_create_layer(_x + 48, _y + 96, _layer, obj_css_player_window))
			{
			sprite_index = spr_css0;
			ui_set_group(id, _group);
			//Pass the player index to it specifically
			index = _index;
			//Get the custom controls map
			custom_controls_map = Profile_Get(css_player_get(index, CSS_PLAYER.profile), PROFILE.custom_controls);
			log(custom_controls_map, " map");
			half_width = 48;
			half_height = 72;
			}
		with(instance_create_layer(_x, _y, _layer, obj_ui_section))
			{
			image_xscale = 3;
			image_yscale = 6;
			image_blend = css_ui_color_get(_num, _cpu);
			ui_set_group(id, _group);
			}
		}
	else
		{
		crash("css_ui_create_player size_number must be either 0 or 1");
		}
}