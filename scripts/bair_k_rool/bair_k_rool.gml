function bair_k_rool() {
	//Backward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
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
				anim_sprite = spr_bair_k_rool;
				anim_speed = 0;
				anim_frame = 0;
				landing_lag = 12;
				speed_set(0, -2, true, true);
				attack_frame = 18;
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame == 9)
					anim_frame = 1;
				if (attack_frame == 4)
					anim_frame = 2;
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 3;
			
					attack_phase++;
					attack_frame = 4;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				if (attack_frame == 3)
					{
					//Animation
					anim_frame = 4;
				
					var _hitbox = hitbox_create_melee(-38, 0, 0.7, 0.7, 12, 8, 1.2, 20, 255, 3, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_punch;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 5;
				
					attack_phase++;
					attack_frame = 25;
					hitbox_create_melee(-38, 0, 0.7, 0.7, 11, 8, 1.1, 14, 255, 5, HITBOX_SHAPE.circle, 0);
					hitbox_create_melee(-30, 24, 0.7, 0.7, 11, 8, 1.1, 14, 255, 5, HITBOX_SHAPE.circle, 0);
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 19)
					anim_frame = 6;
				if (attack_frame == 13)
					anim_frame = 7;
				if (attack_frame == 7)
					anim_frame = 8;
			
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
