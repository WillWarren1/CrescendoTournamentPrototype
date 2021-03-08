function fair0() {
	//Forward Aerial for character0
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
				anim_sprite = spr_fair0;
				anim_speed = 0;
				anim_frame = 0;
			
				landing_lag = 9;
				speed_set(0, -1, true, true);
				attack_frame = 5;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 1;
			
					attack_phase++;
					attack_frame = 5;

					var _hitbox = hitbox_create_melee(38, -17, 0.6, 0.5, 10, 5, 1.1, 6, 35, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				if (attack_frame == 4)
					{
					//Animation
					anim_frame = 2;
				
					var _hitbox = hitbox_create_melee(58, 12, 0.6, 0.4, 10, 5, 1, 6, 35, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				if (attack_frame == 2)
					{
					//Animation
					anim_frame = 3;
				
					var _hitbox = hitbox_create_melee(36, 10, 1.1, 0.7, 10, 5, 1, 6, 35, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 4;
				
					attack_phase++;
					attack_frame = attack_has_hit() ? 17 :  20;
					}
				break;
				}
			//Finish
			case 2:
				{
				if (attack_frame == 10)
					{
					//Animation
					anim_frame = 5;
				
					landing_lag = 7;
					}
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}
			}
		}
	//Movement
	move();


}
