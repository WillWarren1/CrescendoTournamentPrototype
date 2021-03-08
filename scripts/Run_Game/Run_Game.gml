///@fun Run_Game()
///@desc To be called by obj_game
function Run_Game() {

	/*----------------------------------------------------------------*/
	#region Normal
	if (state == GAME_STATE.normal || state == GAME_STATE.startup || (state == GAME_STATE.paused && go_to_next_frame))
		{
		/*TIMERS*/
		current_frame++;
		game_time += (state != GAME_STATE.startup ? 1 : 0);
		frames_advanced++;
		draw = true;
	
		/*UPDATE ALL MOVING PLATFORMS*/
		with(obj_block_moving)
			{
			event_user(Game_Event_Step);
			}
	
		/*UPDATE ALL PLAYERS*/
		with(obj_player)
			{
			event_user(Game_Event_Step);
			}
		
		/*UPDATE ALL ENTITIES*/
		with(obj_entity)
			{
			event_user(Game_Event_Step);
			}
		
		/*UPDATE ALL HURTBOXES*/
		with(obj_hurtbox)
			{
			event_user(Game_Event_Step);
			}
		
		/*CALCULATE HITBOX ORDER*/
		//Add all of the hitboxes to the priority queue to sort
		with(obj_hitbox)
			{
			ds_priority_add(other.hitbox_priority_queue, id, priority);
			}
		
		//Based on the priority queue
		while(!ds_priority_empty(hitbox_priority_queue))
			{
			with(ds_priority_delete_min(hitbox_priority_queue))
				{
				event_user(Game_Event_Step);
				}
			}
		
		/*UPDATE ALL EFFECTS*/
		with(obj_fx)
			{
			event_user(Game_Event_Step);
			}
			
		part_system_update(Particle_System());
	
		/*CAMERA*/
		Camera_Average();
	
		/*BACKGROUND FADE*/
		with(obj_stage_manager)
			{
			event_user(Game_Event_Step);
			}
		
		/*KNOCKOUTS*/
		//Getting KO'ed
		with(obj_player)
			{
			if (!is_dead())
				{
				if (check_blastzones(0, 0, room_width, room_height))
					{
					die();
					}
				}
			}
	
		//Stop frame advance
		if (go_to_next_frame && frame_advance_active)
			{
			go_to_next_frame = false;
			}
		}
	else
		{
		//No new drawing
		draw = false;
	
		/*UPDATE ALL INPUT BUFFERS*/
		//Update Input Buffer when on frame advance; Inputs are taken on the frame it is unpaused.
		if (state == GAME_STATE.paused && frame_advance_active)
			{
			with(obj_player)
				{
				event_user(Game_Event_Paused);
				}
			}
		}
	#endregion
	/*----------------------------------------------------------------*/
	#region Pause
	if (state == GAME_STATE.normal && !pause_menu_canceled && !setting().replay_mode && setting().allow_pausing)
		{
		with(obj_player)
			{
			if (button(INPUT.pause, 0))
				{
				with(other)
					{
					state = GAME_STATE.paused;
					frames_advanced = 0;
					pause_menu_current = 0;
					pause_menu_owner = other.id;
					pause_menu_frame = 0;
					}
				break;
				}
			}
		}
	else if (pause_menu_canceled)
		{
		//If the pause menu has just been canceled, players will not be able to open it up on the next frame
		pause_menu_canceled = false;
		with(obj_player)
			{
			button_reset(INPUT.pause);
			}
		}
	#endregion
	/*----------------------------------------------------------------*/
	#region Pause Menu
	if (state == GAME_STATE.paused)
		{
		if (!frame_advance_active)
			{
			//Input
			var _c = pause_menu_owner.device;
			var _type = pause_menu_owner.device_type;
			var _ud = 0;
			if ((_type == DEVICE.controller && abs(gamepad_axis_value(_c, gp_axislv)) > stick_flick_amount) ||
				(_type == DEVICE.keyboard && sign(keyboard_check(menu_down_key) + keyboard_check(menu_up_key)) != 0))
				{
				pause_menu_stick_frame++;
				if (pause_menu_stick_frame == 1 ||
					(pause_menu_stick_frame > VB_inital_time && 
					pause_menu_stick_frame % VB_loop_time == 0))
					{
					if (_type == DEVICE.controller)
						{
						_ud = sign(gamepad_axis_value(_c, gp_axislv));
						}
					else if (_type == DEVICE.keyboard)
						{
						_ud = keyboard_check(menu_down_key) - keyboard_check(menu_up_key);
						}
					}
				}
			else
				{
				pause_menu_stick_frame = 0;
				}
			if (_type == DEVICE.controller)
				{
				_s = gamepad_button_check_pressed(_c, menu_confirm_button);
				}
			else if (_type == DEVICE.keyboard)
				{
				_s = keyboard_check_pressed(menu_confirm_key);
				}
			//Selecting menu choices - You must wait a frame after opening the menu before you can select choices
			pause_menu_current = modulo(pause_menu_current + _ud, array_length(pause_menu_choices));
			if (_s && pause_menu_frame > 0)
				{
				switch(pause_menu_current)
					{
					case 0:
						state = GAME_STATE.normal;
						pause_menu_owner = noone;
						pause_menu_canceled = true;
						break;
					case 1:
						frame_advance_active = true;
						break;
					case 2:
						Match_End(rm_CSS);
						exit;
					default: crash("Pause menu choice is not valid (", pause_menu_current, ")"); break;
					}
				}
			}
		else
			{
			//Frame advance
			var _c = pause_menu_owner.device;
			var _type = pause_menu_owner.device_type;
			var _a = 0, _s = 0;
			if (_type == DEVICE.controller)
				{
				_a = gamepad_button_check_pressed(_c, menu_frame_advance_cancel_button);
				_s = gamepad_button_check_pressed(_c, menu_frame_advance_step_button);
				}
			else if (_type == DEVICE.keyboard)
				{
				_a = keyboard_check_pressed(menu_frame_advance_cancel_key);
				_s = keyboard_check_pressed(menu_frame_advance_step_key);
				}
			if (_a)
				{
				frame_advance_active = false;
				}
			else
				{
				go_to_next_frame = _s;
				}
			}
		pause_menu_frame++;
		}
	#endregion	
	/*----------------------------------------------------------------*/
	#region Startup countdown
	countdown = max(--countdown, 0);
	if (state == GAME_STATE.startup)
		{
		//Timer until the start
		if (countdown <= count_time)
			{
			state = GAME_STATE.normal;
			with(obj_player)
				{
				state_set(PLAYER_STATE.idle);
				}
			}
		}
	#endregion
	/*----------------------------------------------------------------*/
	#region Ending countdown
	if (state == GAME_STATE.ending)
		{
		//Counter
		endcount = max(--endcount, 0);
		
		//Play out all FX at half speed
		if (endcount % 2 == 0)
			{
			with(obj_fx)
				{
				event_user(Game_Event_Step);
				}
			part_system_update(Particle_System());
			}
			
		//Apply Camera Shake and make sure the camera doesn't go out of the boundary
		cam_x += choose(-cam_shake_h, cam_shake_h);
		cam_y += choose(-cam_shake_v, cam_shake_v);

		if (cam_x > room_width - cam_w - camera_boundary) then cam_x -= cam_shake_h * 2;
		if (cam_x < camera_boundary) then cam_x += cam_shake_h * 2;
		if (cam_y > room_height - cam_h - camera_boundary) then cam_y -= cam_shake_v * 2;
		if (cam_y < camera_boundary) then cam_y += cam_shake_v * 2;

		//Gradually lower the camera shake amount
		cam_shake_h = approach(cam_shake_h, 0, 1);
		cam_shake_v = approach(cam_shake_v, 0, 1);

		//Set the camera position
		camera_set_view_pos(cam, cam_x, cam_y);
		
		//Timer under the end
		if (endcount <= count_time)
			{
			//Save the replay
			if (!setting().replay_mode && setting().replay_record)
				{
				get_replay_data()[? "TIME"] = timestamp_create();
				}
			
			//To Win Screen
			Match_End();
			exit;
			}
		}
	#endregion
	/*----------------------------------------------------------------*/
	#region Daynight Cycle Values
	if (setting().daynight_cycle_enable)
		{
		//Calculate the RGB values for Day / Night
		daynight_time = (current_frame / 40) % 100;
		var _time = daynight_time;

		//Normal
		if (_time < 30)
			{
			daynight_r = 0;
			daynight_g = 0;
			daynight_b = 0;
			}
		//Dusk
		else if (_time < 50)
			{
			var _amt = (_time - 30) / 20;
			daynight_r = lerp(0, 0.25, _amt);
			daynight_g = lerp(0, -0.1, _amt);
			daynight_b = lerp(0, 0.1, _amt);
			}
		//Night
		else if (_time < 80)
			{
			var _amt = (_time - 50) / 30;
			daynight_r = lerp(0.25, -0.4, _amt);
			daynight_g = lerp(-0.1,-0.3,_amt);
			daynight_b = lerp(0.1, -0.1, _amt);
			}
		//Dawn
		else if (_time < 100)
			{
			var _amt = (_time - 80) / 20;
			daynight_r = lerp(-0.4, 0, _amt);
			daynight_g = lerp(-0.3, 0, _amt);
			daynight_b = lerp(-0.1, 0, _amt);
			}
		
		//Outlines
		if (setting().daynight_cycle_outline_change)
			{
			if (_time > 70 && _time < 90)
				{
				daynight_outline = lerp(daynight_outline, 255, 0.05);
				}
			else
				{
				daynight_outline = lerp(daynight_outline, 0, 0.05);
				}
			//Background clear
			if (background_is_cleared())
				{
				daynight_outline = 0;
				}
			var _color = make_color_hsv(0, 0, daynight_outline);
			obj_player.player_outline_color = _color;
			}
		}
	#endregion
	/*----------------------------------------------------------------*/
	#region Ending the game
	if (state == GAME_STATE.normal)
		{
		//Stock Match
		if (match_has_stock_set())
			{
			var _win_count = 0;
			var _winners = [];

			//Loop through all players
			with(obj_player)
				{
				//If they haven't lost (yet), they are counted
				if (state != PLAYER_STATE.lost)
					{
					_win_count += 1;
					_winners[array_length(_winners)] = player_number;
					}
				}
	
			//If there is only one winner, the game ends
			//Will eventually need to be updated for team battles
			if (_win_count == 1)
				{
				var _w = _winners[0];
		
				//Pass in player number
				engine().win_screen_player = _w;
		
				state = GAME_STATE.ending;
				endcount = end_time;
				}
			else if (_win_count < 1)
				{
				//Random player
				var _w = irandom(instance_number(obj_player) - 1);
			
				//Pass in player number
				engine().win_screen_player = _w;
		
				state = GAME_STATE.ending;
				endcount = end_time;
				}
			}
	
		//Time Match
		if (match_has_time_set())
			{
			//Check if the time has run out
			if (game_time >= setting().match_time * game_get_speed(gamespeed_fps) * 60)
				{
				//Sort players by stock & damage
				//Formula for "player score"
				//score = (stock * (max_damage + 1)) - (max_damage - damage);
				var _q = ds_priority_create();
				with(obj_player)
					{
					if (state != PLAYER_STATE.lost)
						{
						var _score;
						var _health;
						if (match_has_stamina_set())
							{
							_health = 999 - stamina;
							}
						else
							{
							_health = damage;
							}
						if (match_has_stock_set())
							{
							_score = (stock * (max_damage + 1)) - (max_damage - _health);
							}
						else
							{
							_score = (points * (max_damage + 1)) - (max_damage - _health);
							}
						ds_priority_add(_q, player_number, _score);
						}
					}
				//The player with the highest score wins
				engine().win_screen_player = ds_priority_find_max(_q);
			
				state = GAME_STATE.ending;
				endcount = end_time;
				}
			}
		}
	#endregion
}