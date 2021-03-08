function fair_cloud() {
	//Forward Aerial
	/*
	- Hold the button to charge the attack longer
	- The fully charged version always spikes opponents and is untechable
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
	allow_hitfall();
	aerial_drift();
	//Cancels
	if run && cancel_ground_check()	run = false;
	//Main Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				anim_sprite = spr_fair_cloud;
				anim_frame = 0;
				anim_speed = 0;
				charge = 0;
				landing_lag = 17;
				speed_set(0, -1, true, true);
				attack_frame = 45;
				return;
				}
			//Active
			case 0:
				{
				//Animation
				if (attack_frame == 34)
					anim_frame = 1;
				if (attack_frame == 27)
					anim_frame = 2;
				if (attack_frame == 17)
					anim_frame = 3;
  
				//Next phase
				if (attack_frame <= 30)
					{
					if ((!button_hold(INPUT.attack) && !button_hold(INPUT.smash)) || attack_frame == 0)
						{
						anim_frame = 4;
						attack_phase++;
						attack_frame = 3;
						}
					else
						{
						charge++;
						if (charge == 15)
							{
							fx_create(spr_shine_fastfall, 1, 0, 13, x - (32 * facing), y + 48, 2, 0);
							}
						}
					}
				break;
				}
			//Endlag
			case 1:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 5;
				
				//Hitbox
				if (attack_frame == 0)
					{
					anim_frame = 6;
					if (charge < 30)
						{
						var _damage = floor(lerp(11, 19, charge / 30));
						//Sweetspot Hitbox
						var _hitbox = hitbox_create_melee(64, 46, 0.6, 0.45, _damage, 4, 0.9, 18, 290, 1, HITBOX_SHAPE.circle, 0);
						_hitbox.hit_fx_style = HIT_FX.slash_strong;
						_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
						_hitbox.knockback_state = PLAYER_STATE.in_balloon;
						_hitbox.grounded_angle = 45;
						//Normal Hitbox
						var _hitbox = hitbox_create_melee(64, 0, 1.2, 2, _damage, 7.5, 0.9, 18, 45, 2, HITBOX_SHAPE.circle, 0);
						_hitbox.hit_fx_style = HIT_FX.slash_medium;
						_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
						_hitbox.shieldstun_scaling = 0.5;
						_hitbox.knockback_state = PLAYER_STATE.in_balloon;
						}
					else
						{
						//Spike Only Hitbox
						var _hitbox = hitbox_create_melee(64, 0, 1.1, 2, 21, 6, 1.1, 20, 285, 2, HITBOX_SHAPE.circle, 0);
						_hitbox.hit_fx_style = HIT_FX.slash_strong;
						_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
						_hitbox.techable = false;
						_hitbox.di_angle = 5;
						_hitbox.knockback_state = PLAYER_STATE.in_balloon;
						}
					attack_phase++;
					attack_frame = 8;
					}
				break;
				}
			//Active
			case 2:
				{
				if (attack_frame == 7)
					{
					anim_frame = 7;
					var _damage = floor(lerp(11, 19, charge / 30));
					//Normal Hitbox
					var _hitbox = hitbox_create_melee(44, 56, 0.8, 0.9, _damage, 7.5, 0.9, 18, 45, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = [HIT_FX.normal_strong, HIT_FX.slash_medium];
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.shieldstun_scaling = 0.5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				
				if (attack_frame == 6)
					{
					anim_frame = 8;
					if (charge < 30)
						{
						var _damage = floor(lerp(7, 14, charge / 30));
						//Normal Hitbox
						var _hitbox = hitbox_create_melee(48, 48, 1, 0.3, _damage, 7, 0.7, 14, 45, 6, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, 310);
						_hitbox.hit_fx_style = [HIT_FX.normal_strong];
						_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
						_hitbox.shieldstun_scaling = 0.5;
						}
					else
						{
						//Stronger Hitbox
						var _hitbox = hitbox_create_melee(48, 48, 1, 0.3, 19, 7, 0.9, 14, 45, 6, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, 310);
						_hitbox.hit_fx_style = [HIT_FX.normal_strong];
						_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
						_hitbox.shieldstun_scaling = 0.5;
						}
					}
			
				if (attack_frame == 4)
					anim_frame = 9;
			
				if (attack_frame == 0)
					{
					//Whiff lag
					attack_phase++;
					if (charge < 30)
						{
						attack_frame = attack_has_hit() ? 15 : 25;
						}
					else
						{
						attack_frame = attack_has_hit() ? 5 : 15;
						}
					}
				break;
				}
			//Finish
			case 3:
				{
				//Animation
				if (attack_frame == 20)
					anim_frame = 10;
				if (attack_frame == 10)
					{
					anim_frame = 11;	
					//Autocancel
					landing_lag = 6;
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
