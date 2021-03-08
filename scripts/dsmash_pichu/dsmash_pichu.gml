function dsmash_pichu() {
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
				anim_sprite = spr_dsmash_pichu;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 10;
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
					attack_frame = 30;
				
					var _hitbox = hitbox_create_melee(0, 8, 0.8, 0.3, 2, 6, 0, 2, 315, 25, HITBOX_SHAPE.square, 0, FLIPPER.toward_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					_hitbox.techable = false;
					_hitbox.asdi_multiplier = 0;
					_hitbox.di_angle = 0;
					_hitbox.background_clear_allow = false;
					_hitbox.hitlag_scaling = 0;
					}
				break;
				}
			//Attacking -> Final Hit
			case 1:
				{
				if (attack_frame % 4 == 0)
					{
					if (attack_frame > 2)
						{
						hitbox_group_reset(0);
						}
					anim_frame++;
					}
				
				if (attack_frame == 2)
					{
					anim_frame = 10;
					//Burst
					var _damage = calculate_smash_damage(3);
					var _hitbox = hitbox_create_melee(16, 8, 0.9, 0.5, _damage, 9, 1.2, 10, 35, 5, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.extra_hitlag = 5;
					}
		
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
				if (attack_frame == 19)
					anim_frame = 11;
				if (attack_frame == 15)
					anim_frame = 12;
				if (attack_frame == 10)
					anim_frame = 13;
				if (attack_frame == 5)
					anim_frame = 14;
		
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