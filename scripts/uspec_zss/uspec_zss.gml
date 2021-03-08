function uspec_zss() {
	//Up Special
	/*
	- Grounded version goes higher than the aerial version
	- Hold down on the control stick at the start to reduce the rise height
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_frame = 0;
				anim_sprite = spr_uspec_zss;
				anim_speed = 0;
			
				parry_stun_time = 60;
				landing_lag = 17;
				if (!on_ground())
					{
					speed_set(0, -1, false, false);
					}
				attack_frame = 5;
				return;
				}
			//Startup
			case 0:
				{
				friction_gravity(air_friction, grav, max_fall_speed);
			
				if (attack_frame == 2)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
				
					//Initial hit
					var _hitbox = hitbox_create_magnetbox(16, -4, 0.4, 0.9, 1, 4, 13, -24, 15, 1, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.hitlag_scaling = 0;
					
					if (!stick_tilted(Lstick, DIR.down))
						{
						if (!on_ground())
							{
							speed_set(2 * facing, -10, false, false);
							}
						else
							{
							speed_set(2 * facing, -12, false, false);
							}
						}
					else
						{
						speed_set(2 * facing, -3, false, false);
						}
					attack_phase++;
					attack_frame = 20;
					}
				break;
				}
			//Active
			case 1:
				{
				//aerial_drift();
				friction_gravity(air_friction);
				if (check_ledge_grab()) return;
			
				//Animation
				if (attack_frame == 17)
					anim_frame = 3;
				if (attack_frame == 13)
					anim_frame = 4;
				if (attack_frame == 8)
					anim_frame = 5;
				if (attack_frame == 4)
					anim_frame = 6;
				
				//Looping hits
				if (attack_frame % 3 == 0)
					{
					hitbox_group_reset_all();
					var _hitbox = hitbox_create_magnetbox(16, -4, 0.4, 0.9, 1, 4, 13, -24, 15, 1, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.hitlag_scaling = 0;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 7;
				
					attack_phase++;
					attack_frame = 20;
					speed_set(0, -1, false, false);
					}
				break;
				}
			//Final Hit
			case 2:
				{
				friction_gravity(air_friction, grav, max_fall_speed);
			
				//Animation
				if (attack_frame == 18)
					anim_frame = 8;
				if (attack_frame == 13)
					anim_frame = 10;
				if (attack_frame == 7)
					anim_frame = 11;
				if (attack_frame == 4)
					anim_frame = 12;
			
				if (attack_frame == 16)
					{
					anim_frame = 9;
					var _hitbox = hitbox_create_melee(26, -8, 1, 0.7, 7, 12, 0.7, 25, 60, 3, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					speed_set(3 * facing, -6, false, false);
					}
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.helpless);
					}
				break;
				}
			}
		}
	//Movement
	move();
}