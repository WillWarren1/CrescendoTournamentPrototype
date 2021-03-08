function nair_dedede() {
	//Neutral Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
	allow_hitfall();
	aerial_drift();
	//Canceling
	if run && cancel_ground_check() run = false;

	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_nair_dedede;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 6;
				speed_set(0, -1, true, true);
				return;
				}
			//Startup -> First hit
			case 0:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 1;
			
					attack_phase++;
					attack_frame = 1;
					var _hit1 = hitbox_create_melee(0, 0, 0.8, 0.8, 5, 7, 0.45, 5, 75, 4, HITBOX_SHAPE.rotation, 3);
					var _hit2 = hitbox_create_melee(0, 0, 0.7, 0.6, 3, 6, 0.4, 3, 85, 20, HITBOX_SHAPE.rotation, 3);
					if (facing == 1)
						{
						_hit1.image_angle = 55;
						_hit2.image_angle = 55;
						}
					else if (facing == -1)
						{
						_hit1.image_angle = 125;
						_hit2.image_angle = 125;
						}
					_hit1.hitstun_scaling = 7;
					_hit2.hitstun_scaling = 7;
					_hit1.hit_fx_style = HIT_FX.normal_medium;
					_hit2.hit_fx_style = HIT_FX.normal_weak;
					}
				break;
				}
			//First hit -> Active
			case 1:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 19;
					}
				break;
				}
			//Active -> Endlag
			case 2:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 3;
				
					attack_phase++;
					attack_frame = 5;
					}
				}
			//Finish
			case 3:
				{
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					run = false;
					}
				break;
				}
			}
		}
	//Movement
	move();

	//Hurtbox matching
	if (run)
		{
		hurtbox_anim_match();
		}
}