function utilt_falcon() {
	//Upward Tilt
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
				anim_sprite = spr_utilt_falcon;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 14;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 11)
					anim_frame = 1;
				if (attack_frame == 8)
					anim_frame = 2;
				if (attack_frame == 5)
					anim_frame = 3;
				if (attack_frame == 2)
					anim_frame = 4;
				
				if (attack_frame == 0)
					{
					anim_frame = 5;
					var _hitbox = hitbox_create_melee(16, -48, 0.2, 1, 11, 8, 0.8, 10, 290, 1, HITBOX_SHAPE.square, 0);
					_hitbox.techable = false;
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = snd_hit_slap2;
					_hitbox.hitstun_scaling = 2;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
				
					attack_phase++;
					attack_frame = 6;
					}
				break;
				}
			//Active
			case 1:
				{
				if (attack_frame == 5)
					{
					anim_frame = 6;
					var _hitbox = hitbox_create_melee(32, -48, 0.8, 0.9, 11, 8, 0.8, 10, 290, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.techable = false;
					_hitbox.hit_sfx = snd_hit_slap2;
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				
				if (attack_frame == 4)
					{
					anim_frame = 7;
					var _hitbox = hitbox_create_melee(48, -16, 1.1, 0.6, 11, 8, 0.8, 4, 290, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.techable = false;
					_hitbox.hit_sfx = snd_hit_slap2;
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
				
				if (attack_frame == 3)
					{
					anim_frame = 8;
					var _hitbox = hitbox_create_melee(36, 8, 0.9, 0.4, 11, 8, 0.8, 3, 290, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.techable = false;
					_hitbox.hit_sfx = snd_hit_slap2;
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
				
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = attack_has_hit() ? 10 : 16;
					}
				break;
				}
			//Endlag
			case 2:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame = 9;
				if (attack_frame == 5)
					anim_frame = 10;

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
