function fair_bayonetta() {
	//Forward Aerial
	/*
	- 3 part attack
	- Press the attack repeatedly to continue the attack
	- If you already hit, you only need to hold the button
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;

	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_try();
	aerial_drift();

	//Canceling
	if run && cancel_ground_check() run = false;

	//Special checks
	var _stick_atk = stick_choose_by_input(INPUT.attack);
	var _stick_smh = stick_choose_by_input(INPUT.smash);

	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_fair_bayonetta;
				anim_speed = 0;
				anim_frame = 0;
			
				landing_lag = 10;
				speed_set(0, -1, true, true);
				attack_frame = 7;
				return;
				}
			//Hit 1
			case 0:
				{
				if (attack_frame == 4)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
				
					attack_phase++;
					attack_frame = 15;
					var _hitbox = hitbox_create_melee(38, -8, 0.8, 0.5, 3, 7, 0, 8, 35, 5, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.techable = false;
					_hitbox.di_angle = 0
					_hitbox.asdi_multiplier = 0;
					_hitbox.hitlag_scaling = 0;
					_hitbox.background_clear_allow = false;
					}
				break;
				}
			//Endlag 1
			case 1:
				{
				//Boost
				if (hitbox_attached_group_has_hit(0))
					{
					if (vsp > -2)
						{
						speed_set(2 * facing, -5, true, false);
						}
					else if (vsp < -2)
						{
						speed_set(2 * facing, -2, true, false);
						}
					}
				
				if (attack_frame == 10)
					anim_frame = 3;
				
				//Next part
				var _cont = (button(INPUT.attack, 15) || (attack_has_hit() && button_hold(INPUT.attack)));
				if (_stick_atk == Rstick || _stick_smh == Rstick)
					{
					//Is the control stick in the direction the player is facing?
					if (sign(stick_get_value(Rstick, DIR.horizontal)) == sign(facing)) then _cont = true;
					}
		
				if (attack_frame < 10 && _cont)
					{
					attack_phase++;
					attack_frame = 6;
					}
			
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			//Hit 2
			case 2:
				{	
				if (attack_frame == 2)
					anim_frame = 3;
				
				if (attack_frame == 0)
					{
					anim_frame = 4;
				
					attack_phase++;
					attack_frame = 15;
					var _hitbox = hitbox_create_melee(48, 8, 0.8, 0.6, 3, 8, 0, 8, 45, 5, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.techable = false;
					_hitbox.di_angle = 0
					_hitbox.asdi_multiplier = 0;
					_hitbox.hitlag_scaling = 0;
					_hitbox.background_clear_allow = false;
					var _hitbox = hitbox_create_melee(12, 0, 0.5, 0.5, 3, 8, 0, 8, 45, 5, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.techable = false;
					_hitbox.di_angle = 0
					_hitbox.asdi_multiplier = 0;
					_hitbox.hitlag_scaling = 0;
					_hitbox.background_clear_allow = false;
					}
				break;
				}
			//Endlag 2
			case 3:
				{
				//Boost
				if (vsp > -2 && hitbox_attached_group_has_hit(1))
					{
					speed_set(6 * facing, -4, true, false);
					}
				
				if (attack_frame == 10)
					anim_frame = 5;
				if (attack_frame == 5)
					anim_frame = 6;
				
				//Next part
				var _cont = (button(INPUT.attack, 15) || (attack_has_hit() && button_hold(INPUT.attack)));
				if (_stick_atk == Rstick || _stick_smh == Rstick)
					{
					//Is the control stick in the direction the player is facing?
					if (sign(stick_get_value(Rstick, DIR.horizontal)) == sign(facing)) then _cont = true;
					}
				
				if (attack_frame < 10 && _cont)
					{
					attack_phase++;
					attack_frame = 6;
					}
			
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			//Hit 3
			case 4:
				{
				if (attack_frame == 4)
					anim_frame = 7;
				if (attack_frame == 2)
					anim_frame = 8;
				
				if (attack_frame == 0)
					{
					anim_frame = 9;
				
					attack_phase++;
					attack_frame = 20;
					var _hitbox = hitbox_create_melee(30, 0, 1, 1.4, 11, 7, 0.6, 10, 50, 8, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_punch;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Endlag 3
			case 5:
				{
				//Boost
				if (vsp > 0 && hitbox_attached_group_has_hit(1))
					{
					speed_set(0, -4, true, false);
					}
				
				if (attack_frame == 18)
					anim_frame = 10;
				if (attack_frame == 12)
					anim_frame = 11;
				if (attack_frame == 6)
					anim_frame = 12;
			
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
