function uspec_shoryuken() {
	//Up Special for character0
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Speeds
	friction_gravity(air_friction, grav, max_fall_speed);
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_frame = 0;
				anim_sprite = spr_uspec_shoryuken;
				anim_speed = 0;
			
				parry_stun_time = 60;
				landing_lag = 22;
				attack_frame = 6;
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame == 3)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
					speed_set(4 * facing, -19, false, false);
					attack_phase++;
					attack_frame = 26;
					var _hitbox = hitbox_create_melee(16, 0, 0.5, 0.5, 15, 10, 1.1, 17, 80, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_punch;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					hurtbox_inv_set(hurtbox, INV.invincible, 1);
					}
				break;
				}
			//Active / Finish
			case 1:
				{
				//Animation
				if (attack_frame == 25)
					anim_frame = 3;
				if (attack_frame == 22)
					anim_frame = 4;
				if (attack_frame == 16)
					anim_frame = 5;
				if (attack_frame == 11)
					anim_frame = 6;
				if (attack_frame == 6)
					anim_frame = 7;
				if (attack_frame == 3)
					anim_frame = 8;
				
				//Weak hitbox
				if (attack_frame == 25)
					{
					var _hitbox = hitbox_create_melee(4, -4, 0.5, 0.9, 7, 8, 0.9, 8, 75, 12, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = snd_hit_punch;
					}
				
				if (attack_frame == 15)
					{
					speed_set(0, 5, true, true);
					}
				
				//Ledge grab
				if (attack_frame <= 15)
					{
					if (check_ledge_grab()) then return;
					}
			
				//Finish
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
