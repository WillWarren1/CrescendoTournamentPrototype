function dair0() {
	//Down Aerial for character0
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_try();
	aerial_drift();
	//Canceling
	if (run && cancel_ground_check())
		{
		//Camera shake
		if (_phase == 1)
			{
			camera_shake(0, 6);
			}
		run = false;
		}
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_dair0;
				anim_speed = 0;
				anim_frame = 0;
		
				landing_lag = 10;
				speed_set(0, -1, true, true);
				attack_frame = 8;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame < 4)
					anim_frame = 1;
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 4;
					var _hitbox = hitbox_create_melee(0, 20, 0.1, 0.4, 8, 6, 1.2, 12, 280, 3, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.di_angle = 10;
					var _hitbox = hitbox_create_melee(0, 10, 0.6, 0.7, 8, 5, 0.7, 5, 285, 5, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 3;
			
					attack_phase++;
					//Whiff lag
					attack_frame = attack_has_hit() ? 12 : 22;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 6)
					{
					anim_frame = 4;
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
