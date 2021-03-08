function fsmash_link() {
	//Forward Smash
	/*
	- Optional two part attack
	- First part shoots a beam at 0%
	- First part has a tipper that launches at full power
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
				anim_sprite = spr_fsmash_link;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 9;
				return;
				}
			//Charging
			case 0:
				{
				//Animation
				if (attack_frame == 7)
					anim_frame = 1;
				if (attack_frame == 4)
					anim_frame = 2;
			
				if (attack_frame == 0)
					{
					charge++;
					//Charging animation
					if (charge % 8 == 0)
						{
						if (anim_frame == 3)
							anim_frame = 2;
						else
							{
							anim_frame = 3;
							
							//Shine VFX
							fx_create(spr_shine_attack, 1, 0, 7, x + irandom_range(-20, 20), y + irandom_range(-20, 20), 1, irandom(360));
							}
						}
					
					if ((!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special)) || charge >= smash_attack_max_charge)
						{
						attack_phase++;
						attack_frame = 8;
						}
					}
				break;
				}
			//First Swing
			case 1:
				{
				//Animation
				if (attack_frame == 7)
					anim_frame = 4;
				if (attack_frame == 5)
					anim_frame = 5;
				if (attack_frame == 3)
					anim_frame = 6;
				if (attack_frame == 1)
					{
					speed_set(3 * facing, 0, true, true);
					anim_frame = 7;
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
					}
				
				//Create hitboxes
				if (attack_frame == 0)
					{
					anim_frame = 8;
				
					//Beam
					if (damage == 0)
						{
						var _damage = calculate_smash_damage(4);
						var _lifetime = lerp(30, 40, charge / smash_attack_max_charge);
						var _speed = lerp(10, 15, charge / smash_attack_max_charge);
						var _proj = hitbox_create_projectile(72, 0, 0.5, 0.1, _damage, 5, 0.2, 0, _lifetime, HITBOX_SHAPE.circle, _speed, 0);
						hitbox_set_overlay_sprite(_proj, spr_fsmash_link_beam, 0, 1, 2, 0, c_white, 1, facing);
						_proj.destroy_on_blocks = true;
						_proj.knockback_state = PLAYER_STATE.in_flinch;
						_proj.hit_fx_style = HIT_FX.slash_weak;
						}
					
					//Weak Hitbox
					var _damage = calculate_smash_damage(7);
					var _hitbox = hitbox_create_melee(36, 0, 1.1, 0.5, _damage, 6, 0, 7, 60, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.techable = false;
					_hitbox.di_angle = 0;
					_hitbox.drift_di_multiplier = 0;
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.hit_sfx = snd_hit_weak2;
				
					//Tipper Hitbox
					var _damage = calculate_smash_damage(14);
					var _hitbox = hitbox_create_melee(80, -4, 0.4, 0.4, _damage, 9, 1, 12, 45, 2, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hitstun_scaling = 0.8;
					attack_phase++;
					attack_frame = 30;
					}
				break;
				}
			//First Swing Endlag
			case 2:
				{
				//Animation
				if (attack_frame == 28)
					anim_frame = 9;
				if (attack_frame == 24)
					anim_frame = 10;
				if (attack_frame == 19)
					anim_frame = 11;
				if (attack_frame == 11)
					anim_frame = 12;
				if (attack_frame == 6)
					anim_frame = 13;
				
				//Transition to second swing
				if (attack_frame < 25 && (button(INPUT.smash, 14) || button(INPUT.attack, 14) || button(INPUT.special, 14)))
					{
					attack_phase = 3;
					attack_frame = 10;
					}
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			//Second Swing
			case 3:
				{
				//Animation
				if (attack_frame == 9)
					anim_frame = 14;
				if (attack_frame == 6)
					anim_frame = 15;
				if (attack_frame == 4)
					anim_frame = 16;
				if (attack_frame == 2)
					{
					speed_set(6 * facing, 0, true, true);
					anim_frame = 17;
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
					}
			
				if (attack_frame == 0)
					{
					anim_frame = 18;
				
					//Strong hitbox
					var _damage = calculate_smash_damage(13);
					var _hitbox = hitbox_create_melee(70, -8, 0.8, 0.7, _damage, 10, 1.3, 15, 45, 2, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.hitstun_scaling = 0.5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
				
					//Weak hitbox
					var _damage = calculate_smash_damage(12);
					var _hitbox = hitbox_create_melee(28, 4, 1, 0.5, _damage, 10, 1.2, 12, 45, 2, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hitstun_scaling = 0.5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					attack_phase++;
					attack_frame = 20;
					}
				break;
				}
			//Second Swing Endlag
			case 4:
				{
				//Animation
				if (attack_frame == 18)
					anim_frame = 19;
				if (attack_frame == 15)
					anim_frame = 20;
				if (attack_frame == 11)
					anim_frame = 21;

				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = attack_has_hit() ? 5 : 30;
					}
				break;
				}
			//Finish
			case 5:
				{
				//Animation
				if (attack_frame == 20)
					anim_frame = 22;
				if (attack_frame <= 10)
					anim_frame = 23;
			
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
