function jab0() {
	//Jab for character0
	/*
	- Press the button multiple times to continue the combo
	- The first two hits can be canceled into tilts
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(ground_friction, grav, max_fall_speed);
	//Canceling
	if run && cancel_air_check() run = false;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_jab0;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 5;
				return;
				}
			//First Jab Startup
			case 0:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 1;
			
					attack_phase++;
					attack_frame = 8;
					speed_set(facing * 2, 0, true, false);
					var _hitbox = hitbox_create_melee(20, 0, 0.5, 0.3, 2, 5, 0, 3, 75, 4, HITBOX_SHAPE.circle, 0);
					_hitbox.knockback_state = PLAYER_STATE.in_flinch;
					_hitbox.can_be_parried = false;
					}
				break;
				}
			//First Jab Active
			case 1:
				{
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 6;
					}
				break;
				}
			//First Jab Endlag
			case 2:
				{
				//Animation
				anim_frame = 2;
			
				//Cancel into tilts from first jab
				if (stick_tilted(Lstick) && check_grounds())
					{
					break;
					}
				//Continue to next jab
				if (button(INPUT.attack,12)) or (attack_has_hit() && button_hold(INPUT.attack))
					{
					attack_phase++;
					attack_frame = 3;
					}
				//Auto end
				else if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			//Second Jab Startup
			case 3:
				{
				if (attack_frame == 0)
					{
					//Continue jab combo
					attack_phase++;
					attack_frame = 3;
					speed_set(facing * 3, 0, false, false);
					var _hitbox = hitbox_create_magnetbox(20, 0, 0.7, 0.3, 2, 5, 14, 5, 16, 4, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.can_be_parried = false;
					}
				break;
				}
			//Second Jab Active
			case 4:
				{
				//Animation
				anim_frame = 3;
			
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 16;
					}
				break;
				}
			//Second Jab Endlag
			case 5:
				{
				//Animation
				anim_frame = 4;
			
				//Cancel into tilts from the second jab
				if (stick_tilted(Lstick) && check_grounds())
					{
					break;
					}
				//Continue to next jab
				if (button(INPUT.attack, 12)) or (attack_has_hit() && button_hold(INPUT.attack))
					{
					attack_phase++;
					attack_frame = 4;
					}
				//Auto end
				else if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			//Third Jab Startup
			case 6:
				{
				//Animation
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 5;
			
					attack_phase++;
					attack_frame = 15;
					speed_set(facing * 6, 0, false, false);
					var _hitbox = hitbox_create_melee(30, -5, 0.7, 0.3, 9, 10, 0.3, 6, 40, 4, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = snd_hit_punch;
					}
				break;
				}
			//Third Jab Active
			case 7:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 6;
				
					attack_phase++;
					attack_frame = 10;
					}
				break;
				}
			//Third Jab Endlag
			case 8:
				{
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			}
		}
	//Movement
	move_grounded();


}
