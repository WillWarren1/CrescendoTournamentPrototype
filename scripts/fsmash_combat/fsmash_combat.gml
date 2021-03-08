function fsmash_combat() {
	//Forward Smash
	/*
	- Hold upwards when releasing to perform a stronger but slower uppercut
	*/
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
				anim_sprite = spr_fsmash_combat;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 5;
				return;
				}
			//Charging
			case 0:
				{
				if (attack_frame == 3)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					if ((!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special)) || charge >= smash_attack_max_charge)
						{
						if (stick_get_value(Lstick, DIR.up) < -stick_flick_amount)
							{
							attack_phase = 4;
							attack_frame = 20;
							}
						else
							{
							attack_phase = 1;
							attack_frame = 10;
							}
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
			//Hitbox - Forward
			case 1:
				{
				if (attack_frame == 7)
					anim_frame = 2;
				if (attack_frame == 4)
					anim_frame = 3;
			
				if (attack_frame == 0)
					{
					anim_frame = 4;
					attack_phase++;
					attack_frame = 10;
				
					var _damage = calculate_smash_damage(14);
					var _hitbox = hitbox_create_melee(20, 0, 0.8, 0.4, _damage, 5.5, 1.3, 6, 45, 4, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_punch;
					_hitbox.di_angle = 7;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
				
					var _damage = calculate_smash_damage(17);
					var _hitbox = hitbox_create_melee(48, 0, 0.8, 0.8, _damage, 5.5, 1.4, 16, 45, 4, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = [HIT_FX.explosion, HIT_FX.normal_medium];
					_hitbox.hit_sfx = snd_hit_punch;
					_hitbox.di_angle = 7;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Active - Forward
			case 2:
				{
				if (attack_frame == 8)
					anim_frame = 5;
				if (attack_frame == 4)
					anim_frame = 6;
				
				if (attack_frame == 0)
					{
					anim_frame = 7;
					attack_phase++;
					attack_frame = attack_has_hit() ? 4 : 15;
					}
				}
			//Finish - Forward
			case 3:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame = 8;
				if (attack_frame == 5)
					anim_frame = 9;
		
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			//Hitbox - Up
			case 4:
				{
				if (attack_frame == 15)
					anim_frame = 10;
				if (attack_frame == 10)
					anim_frame = 11;
			
				if (attack_frame == 0)
					{
					anim_frame = 12;
					attack_phase++;
					attack_frame = 6;
				
					var _damage = calculate_smash_damage(15);
					var _hitbox = hitbox_create_melee(24, 0, 0.6, 0.8, _damage, 3, 2, 16, 85, 3, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.techable = false;
					_hitbox.shieldstun_scaling = 2;
					}
				break;
				}
			//Active - Up
			case 5:
				{
				if (attack_frame == 4)
					{
					anim_frame = 13;
				
					var _damage = calculate_smash_damage(10);
					var _hitbox = hitbox_create_melee(20, -32, 0.6, 0.8, _damage, 3, 1.5, 16, 85, 3, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.techable = false;
					}
				
				if (attack_frame == 2)
					{
					anim_frame = 14;
				
					var _damage = calculate_smash_damage(5);
					var _hitbox = hitbox_create_melee(20, -64, 0.5, 0.5, _damage, 5, 0.5, 16, 85, 3, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_weak;
					_hitbox.techable = false;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 15;
					attack_phase++;
					attack_frame = 25;
					}
				}
			//Finish - Up
			case 6:
				{
				//Animation
				if (attack_frame == 22)
					anim_frame = 16;
				if (attack_frame == 19)
					anim_frame = 17;
				if (attack_frame == 13)
					anim_frame = 18;
				if (attack_frame == 5)
					anim_frame = 19;
		
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
