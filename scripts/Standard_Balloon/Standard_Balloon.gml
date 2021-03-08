///Standard_Balloon
function Standard_Balloon() {
	//Contains the standard actions for the balloon state. (Alternate version of the hitstun state)
	var run = true;
	var _current_speed = point_distance(x, y, x + hsp, y + vsp);
	#region Drift DI
	//If stick is past threshold
	if (stick_tilted(Lstick, DIR.horizontal))
		{
		//Drift DI cannot be used to speed up knockback to high speeds
		if (sign(stick_get_value(Lstick, DIR.horizontal)) == sign(hsp))
			{
			if (abs(hsp + drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal))) < drift_DI_max * drift_di_multiplier)
				{
				hsp += drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal));
				}
			}
		else
			{
			hsp += drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal));
			}
		}
	#endregion
	#region End Hitstun - Go to tumble
	if (run && state_frame == 0)
		{
		//Go to tumble state, which can be canceled to return to normal
		speed_set(hsp * balloon_end_speed_multiplier, vsp * balloon_end_speed_multiplier, false, false);
		state_set(PLAYER_STATE.in_tumble);
		run = false;
		}
	#endregion
	#region End Hitstun - Slide
	if (run && on_ground() && vsp == 0 && _current_speed < bounce_minimum_speed)
		{
		var _remaining_hitstun = state_frame;
		state_set(PLAYER_STATE.in_lag);
		//Remaining hitstun * the multiplier
		state_frame = ceil(_remaining_hitstun * knockdown_lag_multiplier);
		run = false;
		}
	#endregion
	#region FX
	//If you are launched hard enough, create ring effects
	if (run && state_frame % 8 == 0 && _current_speed > 10)
		{
		var _fx = fx_create
			(
			spr_hit_ring,
			1,
			0,
			17,
			x,
			y,
			(_current_speed + (state_frame / 50)) / 10,
			point_direction(0, 0, hsp, vsp),
			"FX_Layer_Below"
			);
		_fx.fx_blend = palette_color_get(palette, 0);
		}
	#endregion
	#region Balloon knockback
	//Calculate the number of times the player moves
	var _times;
	if (stored_hitstun - state_frame < balloon_upper_frame)
		_times = 2;
	else if (_current_speed < balloon_speed_threshold || state_frame < balloon_lower_frame)
		_times = 1;
	else
		_times = 2;
	
	//Cloud trail variables
	var _hitstun_start_frame = (state_frame + state_time);
	var _scale = clamp((state_frame / _hitstun_start_frame) * (knockback_spd / 10), 1, 2);
		
	//Move
	state_frame = max(state_frame - (_times - 1), 0);

	repeat(_times)
		{
		//state_frame = max(--state_frame, 0);
		//Cloud trails
		if (run && setting().knockback_cloud_trails_enable && knockback_spd > 9)
			{
			var _cloud = instance_create_layer(x, y, "FX_Layer_Below", obj_dust_cloud);
			with(_cloud)
				{
				fx_sprite = choose(spr_dust_cloud, spr_dust_cloud1);
				fx_speed = 1;
				fx_frame = 0;
				lifetime = 17;
				fx_xscale = _scale;
				fx_yscale = _scale;
				fx_angle = point_direction(0, 0, other.hsp, other.vsp) + random_range(-5, 5);
				total_life = lifetime;
				var _dir = irandom(360);
				var _spd = random_range(0, _scale * 2);
				hsp = lengthdir_x(_spd, _dir);
				vsp = lengthdir_y(_spd, _dir);
				var _color = palette_color_get(other.palette, 0);
				custom_fx_struct.color =
					[
					color_get_red(_color) / 255,
					color_get_green(_color) / 255,
					color_get_blue(_color) / 255,
					];
				}
			}
		
		//Forces
		if (!on_ground())
			{
			friction_gravity(air_friction, hitstun_grav, max_fall_speed);
			}
		else
			{
			friction_gravity(ground_friction, hitstun_grav, max_fall_speed);
			}
		
		//If you transition to the lag state (hit into the ground), you can't fall of edges or bounce
		if (state != PLAYER_STATE.knockdown)
			{
			move_bouncing();
			}
		else
			{
			move_grounded();
			}
		}
	#endregion
}