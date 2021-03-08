function dsmash_game_and_watch() {
	//Down Smash
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
				anim_sprite = spr_dsmash_game_and_watch;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 6;
				return;
				}
			//Charging
			case 0:
				{	
				charge++;
				
				if (attack_frame == 0 && charge % 14 == 0)
					{
					//Shine VFX
					fx_create(spr_shine_attack, 1, 0, 7, x + irandom_range(-20, 20), y + irandom_range(-20, 20), 1, irandom(360));
					}
				
				if ((charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special))) && attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 6;
					}
				break;
				}
			//Startup / Hitbox
			case 1:
				{
				if (attack_frame == 0)
					{
					anim_frame = 1;
					attack_phase++;
					attack_frame = 25;
				
					//Sourspot
					var _damage = calculate_smash_damage(13, charge);
					var _hitbox = hitbox_create_melee(0, 16, 1, 0.5, _damage, 7, 1, 7, 20, 2, HITBOX_SHAPE.square, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.di_angle = 10;
				
					//Sweetspots
					var _damage = calculate_smash_damage(15, charge);
					var _hitbox = hitbox_create_melee(64, 16, 0.5, 0.5, _damage, 10, 1.1, 7, 80, 2, HITBOX_SHAPE.square, 0);
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					var _hitbox = hitbox_create_melee(-64, 16, 0.5, 0.5, _damage, 10, 1.1, 7, 100, 2, HITBOX_SHAPE.square, 0);
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					camera_shake(0, 5);
					}
				break;
				}
			//Finish
			case 2:
				{
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
