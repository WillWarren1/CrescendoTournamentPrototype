///Standard_Hitlag
function Standard_Hitlag() {
	//Contains the standard actions for the hitlag state.
	/* NOTE: This state is the small pause whenever a character is hit, so not much happens */
	var run = true;
#region Restore Airdodge
	if (airdodge_restore_in_hitlag)
		{
		airdodges = airdodges_max;
		}
#endregion
#region End Hitlag
	if (run && state_frame == 0)
		{
		var final_direction;
		//Transition to stored state
		state_set(stored_state);
		switch(stored_state)
			{
			case PLAYER_STATE.in_hitstun:
				//Set the hitstun timer
				state_frame = stored_hitstun;
			
				//Reset teching
				if (!tech_buffer_before_hitstun)
					{
					tech_buffer = tech_lockout_time;
					}
			
				//ASDI - Moves the player a few pixels based on input after hitlag
				if (stick_tilted(Lstick, DIR.horizontal))
					{
					var _move_x = round(stick_get_value(Lstick, DIR.horizontal) * ASDI * asdi_multiplier);
					if (!collision(x + _move_x, y, flags_create(FLAG.solid)))
						{
						x += _move_x;
						}
					}
				if (stick_tilted(Lstick, DIR.vertical))
					{
					var _move_y = round(stick_get_value(Lstick, DIR.vertical) * ASDI * asdi_multiplier);
					if (!collision(x, y + _move_y, flags_create(FLAG.solid)))
						{
						y += _move_y;
						}
					}
				
				//DI - Player trajectory is altered slightly based on input after hitlag
				final_direction = di_direction(knockback_dir, stick_get_direction(Lstick), di_angle);
			
				//Final Knockback
				speed_set(lengthdir_x(knockback_spd, final_direction), lengthdir_y(knockback_spd, final_direction), false, false);
			
				//Don't reset knockback values - used for creating VFX
			
				//Hit FX
				/*
				var _current_speed = point_distance(x, y, x + hsp, y + vsp);
				if (_current_speed > 15)
					{
					var _scale = max((_current_speed + (state_frame / 50)) / 10,2);
					var _ang = point_direction(0, 0, hsp, vsp);
					var _fx = fx_create(spr_hit_launch, 1, 0, state_frame div 2, x, y, _scale, _ang, "FX_Layer_Below");
					_fx.follow = id;
					_fx.shrink = 0.9;
					_fx.fx_blend = palette_color_get(palette, 0);
					}
				*/
				break;
			case PLAYER_STATE.in_flinch:
				//Set the timer for flinching
				state_frame = stored_hitstun;
				break;
			case PLAYER_STATE.in_balloon:
				//Set the hitstun timer
				state_frame = stored_hitstun;
			
				//Reset teching
				if (!tech_buffer_before_hitstun)
					{
					tech_buffer = tech_lockout_time;
					}
			
				//ASDI - Moves the player a few pixels based on input after hitlag
				if (stick_tilted(Lstick, DIR.horizontal))
					{
					var _move_x = round(stick_get_value(Lstick, DIR.horizontal) * ASDI * asdi_multiplier);
					if (!collision(x + _move_x, y, flags_create(FLAG.solid)))
						{
						x += _move_x;
						}
					}
				if (stick_tilted(Lstick, DIR.vertical))
					{
					var _move_y = round(stick_get_value(Lstick, DIR.vertical) * ASDI * asdi_multiplier);
					if (!collision(x, y + _move_y, flags_create(FLAG.solid)))
						{
						y += _move_y;
						}
					}
				
				//DI - Player trajectory is altered slightly based on input after hitlag
				final_direction = di_direction(knockback_dir, stick_get_direction(Lstick), di_angle);
			
				//Final Knockback
				speed_set(lengthdir_x(knockback_spd, final_direction), lengthdir_y(knockback_spd, final_direction), false, false);
			
				//Don't reset knockback values - used for creating VFX
			
				//Hit FX
				/*
				var _current_speed = point_distance(x, y, x + hsp, y + vsp) * 1.5;
				if (_current_speed > 15)
					{
					var _scale = max((_current_speed + (state_frame / 50)) / 10,2);
					var _ang = point_direction(0, 0, hsp, vsp);
					var _fx = fx_create(spr_hit_launch, 1, 0, state_frame div 2, x, y, _scale, _ang, "FX_Layer_Below");
					_fx.follow = id;
					_fx.shrink = 0.9;
					_fx.fx_blend = palette_color_get(palette, 0);
					}
				*/
				break;
			}
		run = false;
		}
#endregion
	//No movement


}
