function dair_wario() {
	//Downward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_try();
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
				anim_sprite = spr_dair_wario;
				anim_speed = 0;
				anim_frame = 0;
		
				landing_lag = 16;
				speed_set(0, -1, true, true);
				attack_frame = 9;
				return;
				}
			//Startup
			case 0:
				{
				if (attack_frame == 5)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 14;
					var _hitbox = hitbox_create_melee(0, 28, 0.6, 1, 1, 6, 0, 2, 270, 13, HITBOX_SHAPE.square, 0, FLIPPER.autolink_center);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					_hitbox.di_angle = 0;
					_hitbox.asdi_multiplier = 0.5;
					_hitbox.techable = false;
					_hitbox.background_clear_allow = false;
					}
				break;
				}
			//Active
			case 1:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame = 3;
				if (attack_frame == 7)
					anim_frame = 4;
				if (attack_frame == 4)
					anim_frame = 5;
			
				if (attack_frame % 3 == 0 && attack_frame > 2)
					{
					hitbox_group_reset(0);
					}
				
				if (attack_frame == 2)
					{
					anim_frame = 6;
				
					var _hitbox = hitbox_create_melee(0, 28, 0.6, 1.1, 4, 6, 1, 12, 45, 3, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					}
				
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 7;
			
					attack_phase++;
					attack_frame = attack_has_hit() ? 4 : 20;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 15)
					anim_frame = 8;
				if (attack_frame < 8)
					anim_frame = 9;
				
				//Autocancel
				if (attack_frame < 15)
					{
					landing_lag = 4;
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