function dtilt0() {
	//Down Tilt for character0
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame=max(--attack_frame, 0);
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
				anim_sprite = spr_dtilt0;
				anim_frame = 0;
				anim_speed = 0;
		
				attack_frame = 7;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 4)
					anim_frame = 1;
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 4;
					var _hitbox = hitbox_create_melee(32, 20, 0.8, 0.5, 4, 6, 0.45, 5, 75, 3, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.hitstun_scaling = 7;
					}
				break;
				}
			//Active
			case 1:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 3;
				
					attack_phase++;
					//Whiff lag
					attack_frame = attack_has_hit() ? 7 : 14;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 6)
					anim_frame = 4;
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.crouching);
					}
				break;
				}
			}
		}
	//Movement
	move_grounded();


}
