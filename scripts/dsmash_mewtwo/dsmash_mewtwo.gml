function dsmash_mewtwo() {
	//Down Smash
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
				anim_sprite = spr_dsmash_mewtwo;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 17;
				return;
				}
			//Charging
			case 0:
				{
				//Animation (every 7 frames switch the sprite)
				if (charge % 7 == 0)
					{
					if (anim_frame == 1)
						anim_frame = 0;
					else
						{
						anim_frame = 1;
						
						//Shine VFX
						fx_create(spr_shine_attack, 1, 0, 7, x + irandom_range(-20, 20), y + irandom_range(-20, 20), 1, irandom(360));
						}
					}
			
				charge++;
				if ((charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special))) && attack_frame == 0)
					{
					anim_frame = 3;
					attack_phase++;
					attack_frame = 4;
					//Burst
					var _damage = calculate_smash_damage(18);
					var _hitbox = hitbox_create_melee(32, 8, 0.8, 0.8, _damage, 8, 1, 20, 35, 5, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = [HIT_FX.normal_strong, HIT_FX.magic];
					_hitbox.hit_sfx = snd_hit_explosion3;
					_hitbox.extra_hitlag = 5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Startup -> First Hit
			case 1:
				{
				if (attack_frame == 2)
					anim_frame = 4;
		
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = attack_has_hit() ? 5 : 20;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 16)
					anim_frame = 5;
				if (attack_frame == 12)
					anim_frame = 6;
				if (attack_frame == 8)
					anim_frame = 7;
				if (attack_frame == 4)
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
