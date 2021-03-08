function fsmash_cloud() {
	//Forward Smash for character0
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
				anim_sprite = spr_fsmash_cloud;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 5;
				return;
				}
			//Startup / Charging
			case 0:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 1;
					
				//Charging
				if (attack_frame == 0)
					{
					charge++;
					if (charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special)))
						{
						attack_phase++;
						attack_frame = 14;
						}
					//Charge Animation (every 8 frames switch the sprite)
					if (charge % 8 == 0)
						{
						if (anim_frame == 0)
							{
							anim_frame = 1;
							}
						else
							{
							anim_frame = 0;
							
							//Shine VFX
							fx_create(spr_shine_attack, 1, 0, 7, x + irandom_range(-20, 20), y + irandom_range(-20, 20), 1, irandom(360));
							}
						}
					}
				break;
				}
			//First Swing
			case 1:
				{
				//Animation
				if (attack_frame == 9)
					anim_frame = 1;
				if (attack_frame == 4)
					anim_frame = 2;
		
				if (attack_frame == 0)
					{
					anim_frame = 3;
				
					speed_set(facing * 3, 0, false, false);
					attack_phase++;
					attack_frame = 4;
					var _damage = calculate_smash_damage(3);
					var _hitbox = hitbox_create_melee(44, 0, 1.2, 0.7, _damage, 3, 0, 8, 0, 2, HITBOX_SHAPE.circle, 0, FLIPPER.toward_hitbox_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.techable = false;
					_hitbox.asdi_multiplier = 0;
					_hitbox.di_angle = 0;
					_hitbox.drift_di_multiplier = 0;
					}
				break;
				}
			//Second Swing
			case 2:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 4;
		
				if (attack_frame == 0)
					{
					anim_frame = 5;
			
					speed_set(0, 0, false, false);
					attack_phase++;
					attack_frame = 8;
					var _damage = calculate_smash_damage(2);
					var _hitbox = hitbox_create_melee(36, -8, 1.2, 0.7, _damage, 4, 0, 8, 0, 2, HITBOX_SHAPE.circle, 1, FLIPPER.toward_hitbox_center);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.techable = false;
					_hitbox.asdi_multiplier = 0;
					_hitbox.di_angle = 0;
					_hitbox.drift_di_multiplier = 0;
					}
				break;
				}
			//Third Swing
			case 3:
				{
				//Animation
				if (attack_frame == 6)
					anim_frame = 6;
				if (attack_frame == 4)
					anim_frame = 7;
		
				if (attack_frame == 0)
					{
					anim_frame = 8;
				
					speed_set(facing * 4, 0, false, false);
					attack_phase++;
					attack_frame = 6;
					var _damage = calculate_smash_damage(12);
					var _hitbox = hitbox_create_melee(44, 0, 1.2, 0.7, _damage, 8, 1.2, 26, 40, 2, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.custom_hitstun = 45;
					_hitbox.shieldstun_scaling = 0.3;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Third Swing -> Endlag
			case 4:
				{
				//Animation
				if (attack_frame == 3)
					anim_frame = 9;
		
				if (attack_frame == 0)
					{
					anim_frame = 10;
			
					speed_set(0, 0, false, false);
					
					attack_phase++;
					attack_frame = attack_has_hit() ? 16 : 25;
					}
				break;
				}
			//Finish
			case 5:
				{
				//Animation
				if (attack_frame == 15)
					anim_frame = 11;
				if (attack_frame == 5)
					anim_frame = 12;
				
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