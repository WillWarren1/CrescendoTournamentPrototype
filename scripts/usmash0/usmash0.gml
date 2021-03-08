function usmash0() {
	//Up Smash for character0
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(slide_friction, grav, max_fall_speed);
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
				anim_sprite = spr_usmash0;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 2;
				return;
				}
			//Charging -> Startup
			case 0:
				{
				//Animation (every 8 frames switch the sprite)
				if (charge % 8 == 0)
					{
					if (anim_frame == 0)
						anim_frame = 1;
					else
						{
						anim_frame = 0;
						
						//Shine VFX
						fx_create(spr_shine_attack, 1, 0, 7, x + irandom_range(-20, 20), y + irandom_range(-20, 20), 1, irandom(360));
						}
					}
			
				if (attack_frame == 0)
					{
					charge++;
					if (charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special)))
						{
						attack_phase++;
						attack_frame = 4;
						}
					}
				break;
				}
			//Startup -> Attack
			case 1:
				{
				//Animation
				anim_frame = 1;
		
				//Attack First Part
				if (attack_frame == 0)
					{
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 2;
					var _damage = calculate_smash_damage(15);
					var _hitbox = hitbox_create_melee(35, -5, 0.5, 0.6, _damage, 11, 1, 12, 75, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.shieldstun_scaling = 0.5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Attack -> Attack
			case 2:
				{
				//Attack Second Part
				if (attack_frame == 1)
					{
					anim_frame = 3;
				
					var _damage = calculate_smash_damage(15);
					var _hitbox = hitbox_create_melee(24, -37, 0.5, 0.9, _damage, 11, 1, 10, 75, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.shieldstun_scaling = 0.5;
					}
				//Attack Third Part
				if (attack_frame == 0)
					{
					anim_frame = 4;
				
					var _damage = calculate_smash_damage(14);
					var _hitbox = hitbox_create_melee(-5, -40, 1, 0.7, _damage, 9, 1, 8, 90, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = snd_hit_weak2;
					_hitbox.shieldstun_scaling = 0.5;
			
					attack_phase++;
					attack_frame = 2;
					}
				break;
				}
			//Attack -> Endlag
			case 3:
				{
				//Attack Fourth Part
				if (attack_frame == 0)
					{
					anim_frame = 5;
				
					var _damage = calculate_smash_damage(13);
					var _hitbox = hitbox_create_melee(-19, -15, 0.8, 1, _damage, 6, 1, 6, 120, 5, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.shieldstun_scaling = 0.5;
				
					attack_phase++;
					attack_frame = 20;
					}
				break;
				}
			//Finish
			case 4:
				{
				//Animation
				if (attack_frame == 15)
					anim_frame = 6;
				if (attack_frame == 10)
					anim_frame = 7;
				if (attack_frame == 5)
					anim_frame = 8;
		
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
