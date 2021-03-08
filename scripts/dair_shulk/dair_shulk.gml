function dair_shulk() {
	//Down Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_try();
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
				anim_sprite = spr_dair_shulk;
				anim_speed = 0;
				anim_frame = 0;
				landing_lag = 14;
				speed_set(0, -1, true, true);
				attack_frame = 12;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 8)
					anim_frame = 1;
				if (attack_frame == 4)
					anim_frame = 2;
				
				if (attack_frame == 0)
					{
					anim_frame = 3;
			
					attack_phase++;
					attack_frame = 13;
					var _hitbox = hitbox_create_melee(8, 36, 0.5, 1, 4, 4, 0.1, 12, 270, 3, HITBOX_SHAPE.circle, 0, FLIPPER.autolink);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					_hitbox.techable = false;
					_hitbox.background_clear_allow = false;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				if (attack_frame == 12)
					anim_frame = 4;
				
				if (attack_frame == 11)
					{
					anim_frame = 5;
					var _hitbox = hitbox_create_melee(0, 16, 0.4, 0.8, 8, 8, 0.8, 12, 270, 7, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					var _hitbox = hitbox_create_melee(0, 62, 0.4, 0.8, 8, 6, 0.7, 12, 270, 7, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				
				if (attack_frame == 9)
					anim_frame = 6;
				if (attack_frame == 4)
					anim_frame = 7;
			
				if (attack_frame == 0)
					{
					landing_lag = 6;
					attack_phase++;
					attack_frame = attack_has_hit() ? 12 : 22;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 18)
					anim_frame = 8;
				if (attack_frame == 9)
					anim_frame = 9;
				
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