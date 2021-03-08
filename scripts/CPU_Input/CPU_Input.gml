///@func CPU_Input(count)
///@param count
function CPU_Input() {
	//Fakes inputs for the CPU to move around and do things	
	if (!is_cpu) return false;

	var _cpu_type = cpu_type;
	var _cpu_up_b_distance = 400;
	var _cpu_no_aerials_distance = 500;
	var _cpu_time = obj_game.current_frame;

	#region Input Buffer Count
	if (argument[0])
		{
		//Counts for each input
		for(var i = 0; i < (INPUT.length * 2); i++)
			{
			input_buffer[| i] = min(++input_buffer[| i], max_buffer_length);
			}
		}
	#endregion
	#region Inputs
	switch(_cpu_type)
		{
		case CPU_TYPE.idle:
			#region IDLE
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			if (state == PLAYER_STATE.in_hitlag)
				{
				_sxl = 0;
				_syl = 0;
				Input_Press(INPUT.shield);
				}
			else if (state == PLAYER_STATE.in_hitstun || state == PLAYER_STATE.in_balloon)
				{
				}
			else if (state == PLAYER_STATE.helpless)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = -1;
				if (collision(x + 1, y, flags_create(FLAG.solid)) || collision(x - 1, y, flags_create(FLAG.solid)))
					{
					Input_Press(INPUT.jump);
					}
				}
			else
				{
				if (!on_ground())
					{
					_sxl = sign(room_width / 2 - x);
					if (double_jumps > 0 && _cpu_time % 150 == 0)
						{
						Input_Press(INPUT.jump);
						}
					else if (y > (room_height - _cpu_up_b_distance))
						{
						//Up B
						Input_Press(INPUT.special);
						_sxl = sign(room_width / 2 - x);
						_syl = -1;
						}
					}
				else
					{
					_sxl = 0;
					_syl = 0;
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.attack:
			#region ATTACK
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			if (state == PLAYER_STATE.in_hitlag)
				{
				if (irandom(200) < 15) then Input_Press(INPUT.shield);
				_sxl = random_range(-1, 1);
				_syl = random_range(-1, 1);
				}
			else if (state == PLAYER_STATE.in_hitstun || state == PLAYER_STATE.in_balloon)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = -1;
				}
			else if (state == PLAYER_STATE.helpless)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = 0;
				Input_Press(INPUT.jump);
				}
			else if (state == PLAYER_STATE.grabbing)
				{
				if (state_frame < 10)
					{
					_sxl = choose(-1, 0, 1);
					_syl = choose(-1, 0, 1);
					}
				else if (state_frame > 30)
					{
					Input_Press(INPUT.attack);
					}
				}
			else
				{
				if (!on_ground())
					{
					var _random = true;
					if (abs(x - room_width / 2) > 200)
						{
						_sxl = sign(room_width / 2 - x);
						if (double_jumps > 0 && _cpu_time % 150 == 0)
							{
							Input_Press(INPUT.jump);
							}
						else if (y > (room_height - _cpu_up_b_distance))
							{
							//Up B
							Input_Press(INPUT.special);
							//_sxl = sign(room_width / 2 - x) * stick_tilt_amount;
							_syl = -1;
							}
						}
					if (_random)
						{
						//Random attacks
						if (y < (room_height - _cpu_no_aerials_distance))
							{
							if (irandom(200) < 10)
								_sxl = random_range(-1, 1);
							if (irandom(200) < 10)
								_syl = random_range(-1, 1);
							if (irandom(200) < 6)
								Input_Press(INPUT.attack);
							else if (irandom(200) < 4)
								Input_Press(INPUT.special);
							else if (irandom(200) < 2)
								Input_Press(INPUT.jump);
							else if (irandom(200) < 1)
								Input_Press(INPUT.shield);
							else if (irandom(200) < 5)
								Input_Press(INPUT.grab);
							}
						}
					}
				else
					{
					_sxl = 0;
					_syl = 0;
				
					var _shield = false;
					var _temp_x = x;
					x = infinity;
					var _nearest = instance_nearest(_temp_x, y, obj_player);
					_sxl = _nearest.x > _temp_x ? 1 : -1;
					switch(shield_type)
						{
						case SHIELD_TYPE.melee:
						case SHIELD_TYPE.ultimate:
							_shield = ds_list_size(_nearest.my_hitboxes) > 0 && shield_hp > 20;
							break;
						case SHIELD_TYPE.rivals:
							_shield = ds_list_size(_nearest.my_hitboxes) > 0;
							break;
						}
					x = _temp_x;
				
					//Jump
					if (abs(x - _nearest.x) < 30)
						{
						if (irandom(5) == 0)
							{
							Input_Press(INPUT.jump);
							}
						}
					//Plat drop
					if (on_plat())
						{
						if (irandom(100) < 8)
							{
							_syl = 1;
							}
						}
					//Shield
					if (_shield)
						{
						Input_Hold(INPUT.shield);
						}
					else
						{
						//Random attacks
						if (irandom(200) < 10)
							_sxl = random_range(-1, 1);
						if (irandom(200) < 10)
							_syl = random_range(-1, 1);
						if (irandom(200) < 3)
							Input_Press(INPUT.attack);
						else if (irandom(200) < 2)
							Input_Press(INPUT.smash);
						else if (irandom(200) < 1)
							Input_Press(INPUT.special);
						else if (irandom(200) < 2)
							Input_Press(INPUT.jump);
						else if (irandom(200) < 1)
							Input_Press(INPUT.grab);
						}
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.shield_grab:
			#region SHIELD_TYPE GRAB
		
			var _shield_multihit_attacks = true;
		
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			var _shield = false;
			var _grab = false;
			var _temp_x = x;
			x = infinity;
			var _nearest = instance_nearest(_temp_x, y, obj_player);
			_shield = ds_list_size(_nearest.my_hitboxes) > 0;
			if (_shield_multihit_attacks)
				{
				_grab = (state == PLAYER_STATE.shielding && ds_list_size(_nearest.my_hitboxes) == 0);
				}
			else
				{
				_grab = (state == PLAYER_STATE.shielding && _shield);
				}
			x = _temp_x;
			if (state == PLAYER_STATE.in_hitlag)
				{
				Input_Press(INPUT.shield);
				}
			if (on_ground())
				{
				//Shielding
				if (_shield)
					{
					Input_Hold(INPUT.shield);
					}
				if (_grab)
					{
					_sxl = (_nearest.x > x ? 0.5 : -0.5); //Tilt, but not flick
					Input_Press(INPUT.grab);
					}
				if (state == PLAYER_STATE.idle && button(INPUT.grab, buff, false))
					{
					_sxl = (_nearest.x > x ? 1 : -1);
					}
				if (state == PLAYER_STATE.grabbing)
					{
					if (state_frame < 10)
						{
						_sxl = choose(-1, 0, 1);
						_syl = choose(-1, 0, 1);
						}
					else if (state_frame > 30)
						{
						Input_Press(INPUT.attack);
						}
					}
				}
			else
				{
				if (abs(x - room_width / 2) > 200)
					{
					_sxl = sign(room_width / 2 - x);
					if (_shield)
						{
						Input_Press(INPUT.shield);
						}
					if (vsp > -1)
						{
						if (double_jumps > 0)
							{
							Input_Press(INPUT.jump);
							_random = false;
							}
						else if (y > room_height - _cpu_up_b_distance)
							{
							//Up B
							Input_Press(INPUT.special);
							_sxl = sign(room_width / 2 - x);
							_syl = -1;
							_random = false;
							}
						}
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.shield_attack:
			#region SHIELD_TYPE ATTACK
		
			var _shield_multihit_attacks = true;
		
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			var _shield = false;
			var _attack = false;
			var _temp_x = x;
			x = infinity;
			var _nearest = instance_nearest(_temp_x, y, obj_player);
			_shield = ds_list_size(_nearest.my_hitboxes) > 0;
			if (_shield_multihit_attacks)
				{
				_attack = (state == PLAYER_STATE.shielding && ds_list_size(_nearest.my_hitboxes) == 0);
				}
			else
				{
				_attack = (state == PLAYER_STATE.shielding && _shield);
				}
			x = _temp_x;
			if (state == PLAYER_STATE.in_hitlag)
				{
				Input_Press(INPUT.shield);
				}
			if (on_ground())
				{
				//Shielding
				if (_shield)
					{
					Input_Hold(INPUT.shield);
					}
				if (_attack)
					{
					Input_Press(INPUT.jump);
					Input_Press(INPUT.special);
					}
				if (state == PLAYER_STATE.jumpsquat)
					{
					_sxl = (_nearest.x > x ? 0.5 : -0.5); //Tilt, but not flick
					_syl = -1;
					}
				if (state == PLAYER_STATE.attacking)
					{
					_sxl = (_nearest.x > x ? 1 : -1);
					}
				if (state == PLAYER_STATE.grabbing)
					{
					if (state_frame < 10)
						{
						_sxl = choose(-1, 0, 1);
						_syl = choose(-1, 0, 1);
						}
					else if (state_frame > 30)
						{
						Input_Press(INPUT.attack);
						}
					}
				}
			else
				{
				if (abs(x - room_width / 2) > 200)
					{
					_sxl = sign(room_width / 2 - x);
					if (_shield)
						{
						Input_Press(INPUT.shield);
						}
					if (vsp > -1)
						{
						if (double_jumps > 0)
							{
							Input_Press(INPUT.jump);
							_random = false;
							}
						else if (y > room_height - _cpu_up_b_distance)
							{
							//Up B
							Input_Press(INPUT.special);
							_sxl = sign(room_width / 2 - x);
							_syl = -1;
							_random = false;
							}
						}
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.di_in:
			#region DI In
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			if (state == PLAYER_STATE.in_hitlag)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = 0;
				Input_Press(INPUT.shield);
				}
			else if (state == PLAYER_STATE.in_hitstun || state == PLAYER_STATE.in_balloon)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = -1;
				}
			else if (state == PLAYER_STATE.helpless)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = -1;
				if (collision(x + 1, y, flags_create(FLAG.solid)) || collision(x - 1, y, flags_create(FLAG.solid)))
					{
					Input_Press(INPUT.jump);
					}
				}
			else
				{
				if (!on_ground())
					{
					_sxl = sign(room_width / 2 - x);
					if (vsp > -1)
						{
						if (double_jumps > 0)
							{
							Input_Press(INPUT.jump);
							}
						else if (y > room_height - _cpu_up_b_distance)
							{
							//Up B
							Input_Press(INPUT.special);
							_sxl = sign(room_width / 2 - x);
							_syl = -1;
							}
						}
					}
				else
					{
					_sxl = 0;
					_syl = 0;
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.di_out:
			#region DI Out
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			if (state == PLAYER_STATE.in_hitlag)
				{
				_sxl = -sign(room_width / 2 - x);
				_syl = 0;
				Input_Press(INPUT.shield);
				}
			else if (state == PLAYER_STATE.in_hitstun || state == PLAYER_STATE.in_balloon)
				{
				_sxl = -sign(room_width / 2 - x);
				_syl = -1;
				}
			else if (state == PLAYER_STATE.helpless)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = -1;
				if (collision(x + 1, y, flags_create(FLAG.solid)) || collision(x - 1, y, flags_create(FLAG.solid)))
					{
					Input_Press(INPUT.jump);
					}
				}
			else
				{
				if (!on_ground())
					{
					_sxl = sign(room_width / 2 - x);
					if (vsp > -1)
						{
						if (double_jumps > 0)
							{
							Input_Press(INPUT.jump);
							}
						else if (y > room_height - _cpu_up_b_distance)
							{
							//Up B
							Input_Press(INPUT.special);
							_sxl = sign(room_width / 2 - x);
							_syl = -1;
							}
						}
					}
				else
					{
					_sxl = 0;
					_syl = 0;
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.di_random:
			#region DI Random
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			if (state == PLAYER_STATE.in_hitlag)
				{
				_sxl = random_range(-1, 1);
				_syl = random_range(-1, 1);
				Input_Press(INPUT.shield);
				}
			else if (state == PLAYER_STATE.in_hitstun || state == PLAYER_STATE.in_balloon)
				{
				_syl = -1;
				}
			else if (state == PLAYER_STATE.helpless)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = -1;
				if (collision(x + 1, y, flags_create(FLAG.solid)) || collision(x - 1, y, flags_create(FLAG.solid)))
					{
					Input_Press(INPUT.jump);
					}
				}
			else
				{
				if (!on_ground())
					{
					_sxl = sign(room_width / 2 - x);
					if (vsp > -1)
						{
						if (double_jumps > 0)
							{
							Input_Press(INPUT.jump);
							}
						else if (y > room_height - _cpu_up_b_distance)
							{
							//Up B
							Input_Press(INPUT.special);
							_sxl = sign(room_width / 2 - x);
							_syl = -1;
							}
						}
					}
				else
					{
					_sxl = 0;
					_syl = 0;
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.parry_ult:
			#region PARRY ULTIMATE
		
			var _parry_multihit_attacks = false;
		
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			var _shield = false;
			var _attacked = false;
			var _temp_x = x;
			x = infinity;
			var _nearest = instance_nearest(_temp_x, y, obj_player);
			_shield = (_nearest.state == PLAYER_STATE.attacking);
			_attacked = ds_list_size(_nearest.my_hitboxes) > 0 && _nearest.self_hitlag_frame == 0;
			x = _temp_x;
		
			if (on_ground())
				{
				//Shield
				if (_shield && !_attacked)
					{
					Input_Hold(INPUT.shield);
					}
				if (state == PLAYER_STATE.shield_release)
					{
					if (_shield && _parry_multihit_attacks)
						{
						Input_Hold(INPUT.shield);
						}
					else
						{
						Input_Press(INPUT.grab);
						}
					}
				
				if (state == PLAYER_STATE.idle && button(INPUT.grab, buff, false))
					{
					_sxl = (_nearest.x > x ? 1 : -1);
					}
				if (state == PLAYER_STATE.grabbing)
					{
					if (state_frame < 10)
						{
						_sxl = choose(-1, 0, 1);
						_syl = choose(-1, 0, 1);
						}
					else if (state_frame > 30)
						{
						Input_Press(INPUT.attack);
						}
					}
				}
			else
				{
				if (abs(x - room_width / 2) > 200)
					{
					_sxl = sign(room_width / 2 - x);
					if (_shield)
						{
						Input_Press(INPUT.shield);
						}
					if (vsp > -1)
						{
						if (double_jumps > 0)
							{
							Input_Press(INPUT.jump);
							_random = false;
							}
						else if (y > room_height - _cpu_up_b_distance)
							{
							//Up B
							Input_Press(INPUT.special);
							_sxl = sign(room_width / 2 - x);
							_syl = -1;
							_random = false;
							}
						}
					}
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		case CPU_TYPE.airdodge:
			#region AIRDODGE_TYPE
			CPU_Stick_Update_Start(argument[0]);
			var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
			if (state == PLAYER_STATE.in_hitlag)
				{
				_sxl = 0;
				_syl = 0;
				Input_Press(INPUT.shield);
				}
			else if (state == PLAYER_STATE.in_hitstun || state == PLAYER_STATE.in_balloon)
				{
				Input_Press(INPUT.shield);
				}
			else if (state == PLAYER_STATE.helpless)
				{
				_sxl = sign(room_width / 2 - x);
				_syl = 0;
				}
			else if (!on_ground())
				{
				_sxl = sign(room_width / 2 - x);
				if (vsp > -1)
					{
					if (double_jumps > 0)
						{
						Input_Press(INPUT.jump);
						}
					else if (y > room_height - _cpu_up_b_distance)
						{
						//Up B
						Input_Press(INPUT.special);
						_sxl = sign(room_width / 2 - x);
						_syl = -1;
						}
					}
				}
			else
				{
				_sxl = 0;
				_syl = 0;
				}
			CPU_Stick_Update_End(_sxl, _syl, _sxr, _syr);
			break;
			#endregion
		default: crash("CPU type is valid (", _cpu_type, ")"); break;
		}
	#endregion
}