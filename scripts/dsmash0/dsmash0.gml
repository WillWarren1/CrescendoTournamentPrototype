function dsmash0() {
	//Down Smash for character0
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
				anim_sprite = spr_dsmash0;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 6;
				return;
				}
			//Charging -> Startup
			case 0:
				{
				//Animation
				if (attack_frame == 3)
					anim_frame = 1;
					
				//Charging
				if (attack_frame == 0)
					{
					charge++;
					if (charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special)))
						{
						attack_phase++;
						attack_frame = 4;
						}
						
					//Animation (every 8 frames switch the sprite)
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
			//Swing 1
			case 1:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 2;
		
				if (attack_frame == 0)
					{
					anim_frame = 3;
				
					attack_phase++;
					attack_frame = 10;
					var _hitbox = hitbox_create_magnetbox(-36, 16, 0.9, 0.2, 4, 8, 60 + hsp, -5, 13, 2, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
				break;
				}
			//Swing 2
			case 2:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 4;
				if (attack_frame == 5)
					anim_frame = 5;
				if (attack_frame == 2)
					anim_frame = 6;
		
				if (attack_frame == 0)
					{
					anim_frame = 7;
				
					attack_phase++;
					attack_frame = 6;
					var _damage = calculate_smash_damage(11);
					var _hitbox = hitbox_create_melee(36, 20, 1.1, 0.4, _damage, 8.5, 1.2, 10, 45, 2, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Attack -> Endlag
			case 3:
				{
				//Animation
				if (attack_frame == 4)
					anim_frame = 8;
					
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 24;
					}
				break;
				}
			//Finish
			case 4:
				{
				//Animation
				if (attack_frame == 16)
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