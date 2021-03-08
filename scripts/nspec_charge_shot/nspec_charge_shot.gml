function nspec_charge_shot() {
	//Neutral Special
	/*
	- Press once to charge, press again to shoot
	- Tilt the stick in the opposite direction right after starting to reverse the attack
	- If at full charge, press once to shoot
	- On the ground, you can cancel the charge with a roll, spot dodge, shield, or jump
	- In the air, you can cancel the charge with an airdodge or jump
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions / Cancels
	if (on_ground())
		{
		friction_gravity(ground_friction, grav, max_fall_speed);
		}
	else
		{
		friction_gravity(air_friction, grav, max_fall_speed);
		}
	//Phases
	if (run)
		{
		var _total_charge = 125;
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_nspec_charge_shot;
				anim_frame = 0;
				anim_speed = 0;
		
				//Reverse B
				reverse_b();
				
				if (!variable_struct_exists(custom_attack_struct, "charge"))
					{
					custom_attack_struct.charge = 0;
					}
					
				attack_draw_script = nspec_charge_shot_draw;

				attack_frame = 10;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 1;
				if (attack_frame == 5)
					anim_frame = 2;
				if (attack_frame == 2)
					anim_frame = 3;
					
				//B Reverse
				if (attack_frame == 6)
					{
					b_reverse();
					}
				if (attack_frame == 0)
					{
					//Charging
					if (custom_attack_struct.charge < _total_charge)
						{
						attack_phase++;
						attack_frame = 0;
						}
					else
						{
						attack_phase = 2;
						attack_frame = 3;
						}
					}
				break;
				}
			//Charge
			case 1:
				{
				custom_attack_struct.charge += 1;
			
				//Cancel at full charge
				if (custom_attack_struct.charge >= _total_charge)
					{
					//Store charge
					attack_stop();
					break;
					}
			
				//Cancels
				if (cancel_charge_check()) return;
			
				//Shoot
				if (button(INPUT.special, buff))
					{
					attack_phase = 2;
					attack_frame = 3;
					}
				break;
				}
			//Shoot
			case 2:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 3;
					
				if (attack_frame == 0)
					{
					anim_frame = 4;
					if (!on_ground())
						{
						speed_set(-3 * facing, -1, true, true);
						}
					var _percent = (custom_attack_struct.charge / _total_charge);
					var _size = lerp(0.45, 1.55, _percent);
					var _scale = 0.5 + _percent * 1.5;
					var _proj = hitbox_create_projectile_custom
						(
						obj_nspec_charge_shot, 
						45, 
						0, 
						0.4 * _size, 
						0.4 * _size, 
						(_percent == 1) ? 30 : ceil(lerp(5, 26, _percent)), 
						4.5 * _scale, 
						(_percent == 1) ? 1.1 : 0.6,
						40, 
						75, 
						HITBOX_SHAPE.circle,
						5 + (5 * _scale), 
						0,
						FLIPPER.sakurai
						);
					_proj.base_hitlag = (_percent == 1) ? 17 : ceil(lerp(5, 15, _percent));
					_proj.hit_sfx = snd_hit_explosion2;
					_proj.overlay_scale = _size;
					_proj.grounded_angle = 0;
					_proj.hit_fx_style = (_percent == 1) ? [HIT_FX.explosion, HIT_FX.normal_strong] : HIT_FX.normal_medium;
					audio_play_sound(snd_hit_shot, 10, false);
					attack_phase++;
					attack_frame = 30;
					custom_attack_struct.charge = 0;
					}
				break;
				}
			//Finish
			case 3:
				{
				//Animation
				if (attack_frame == 28)
					anim_frame = 5;
				if (attack_frame == 26)
					anim_frame = 6;
				if (attack_frame == 24)
					anim_frame = 7;
				if (attack_frame == 18)
					anim_frame = 8;
				if (attack_frame == 12)
					anim_frame = 9;
				if (attack_frame == 6)
					anim_frame = 10;
					
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	move();
}