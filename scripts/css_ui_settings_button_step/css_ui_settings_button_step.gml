function css_ui_settings_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		with(obj_css_ui)
			{
			cpu_type = modulo(cpu_type + 1, 9);
			with(obj_ui_toast)
				{
				instance_destroy();
				}
			var _t = "";
			var _toast = instance_create_layer(other.x - 16, other.y + (other.sprite_height / 2), "UI_Above_Layer", obj_ui_toast);
			switch(cpu_type)
				{
				case CPU_TYPE.airdodge:			_t = "CPU TYPE: AIRDODGE";		break;
				case CPU_TYPE.attack:			_t = "CPU TYPE: ATTACK";		break;
				case CPU_TYPE.di_in:			_t = "CPU TYPE: DI IN";			break;
				case CPU_TYPE.di_out:			_t = "CPU TYPE: DI OUT";		break;
				case CPU_TYPE.di_random:		_t = "CPU TYPE: DI RANDOM";		break;
				case CPU_TYPE.idle:				_t = "CPU TYPE: IDLE";			break;
				case CPU_TYPE.parry_ult:		_t = "CPU TYPE: PARRY ULTIMATE";break;
				case CPU_TYPE.shield_attack:	_t = "CPU TYPE: SHIELD ATTACK"; break;
				case CPU_TYPE.shield_grab:		_t = "CPU TYPE: SHIELD GRAB";	break;
				}
			_toast.text = _t;
			_toast.lifetime = 45;
			_toast.halign = 1;
			_toast.box_color = $444444;
			}
		}


}
