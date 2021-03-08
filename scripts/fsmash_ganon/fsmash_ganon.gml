function fsmash_ganon() {
	//Forward Smash
	/*
	- Get a speed boost when performing the attack in the opposite direction
	- Fully charge for a shockwave hitbox
	*/
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
				anim_sprite = spr_fsmash_ganon;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 17;
			
				//Special boost
				if (sign(hsp) != facing)
					{
					hsp *= 1.4;
					}
				return;
				}
			//Charging
			case 0:
				{
				if (attack_frame == 15)
					anim_frame = 1;
				if (attack_frame == 10)
					anim_frame = 2;
				if (attack_frame == 5)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					if ((!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special)) || charge >= smash_attack_max_charge)
						{
						attack_phase++;
						attack_frame = 8;
						}
					else
						{
						charge++;
						if (charge % 8 == 0)
							{
							if (anim_frame == 2)
								anim_frame = 1;
							else
								{
								anim_frame = 2;
								
								//Shine VFX
								fx_create(spr_shine_attack, 1, 0, 7, x + irandom_range(-20, 20), y + irandom_range(-20, 20), 1, irandom(360));
								}
							}
						}
					}
				break;
				}
			//Hitbox
			case 1:
				{
				if (attack_frame == 0)
					{
					anim_frame = 3;
					attack_phase++;
					attack_frame = 8;
					var _damage = calculate_smash_damage(16);
					var _hitbox = hitbox_create_melee(-8, -32, 1, 0.8, _damage, 4, 2, 15, 60, 3, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.shieldstun_scaling = 0.5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Second Hitbox
			case 2:
				{
				if (attack_frame == 6)
					{
					anim_frame = 4;
					var _damage = calculate_smash_damage(20);
					var _hitbox = hitbox_create_melee(32, -20, 2, 0.8, _damage, 8, 1.2, 15, 45, 3, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.extra_hitlag = 5;
					_hitbox.shieldstun_scaling = 0.5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					_hitbox.custom_hitstun = 35;
					}
				
				if (attack_frame == 4)
					{
					anim_frame = 5;
					if (charge >= smash_attack_max_charge)
						{
						var _hitbox = hitbox_create_melee(42, 0, 2, 0.8, 50, 8, 1.2, 20, 35, 4, HITBOX_SHAPE.circle, 2);
						_hitbox.hit_fx_style = [HIT_FX.explosion, HIT_FX.normal_strong];
						_hitbox.hit_sfx = snd_hit_explosion2;
						_hitbox.knockback_state = PLAYER_STATE.in_balloon;
						var _hitbox = hitbox_create_melee(48, 24, 4, 0.2, 5, 8, 0.7, 6, 90, 4, HITBOX_SHAPE.square, 2);
						_hitbox.hit_fx_style = HIT_FX.normal_strong;
						_hitbox.hit_sfx = snd_hit_explosion;
						}
					else
						{
						var _damage = calculate_smash_damage(20);
						var _hitbox = hitbox_create_melee(42, 0, 2, 0.8, _damage, 8, 1, 20, 45, 4, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
						_hitbox.hit_fx_style = HIT_FX.slash_strong;
						_hitbox.hit_sfx = snd_hit_strong2;
						_hitbox.shieldstun_scaling = 0.5;
						_hitbox.knockback_state = PLAYER_STATE.in_balloon;
						_hitbox.custom_hitstun = 35;
						}
					}
				
				if (attack_frame == 2)
					{
					anim_frame = 6;
					}
		
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = attack_has_hit() ? 18 : 24;
					}
				break;
				}
			//Finish
			case 3:
				{
				//Animation
				if (attack_frame == 18)
					anim_frame = 6;
				if (attack_frame == 13)
					anim_frame = 7;
				if (attack_frame == 7)
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
