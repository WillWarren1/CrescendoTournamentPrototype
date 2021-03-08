function usmash_sheik() {
	//Up Smash
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
				anim_sprite = spr_usmash_sheik;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 6;
				return;
				}
			//Charging
			case 0:
				{
				//Animation (every 8 frames switch the sprite)
				if (charge % 8 == 0)
					{
					if (anim_frame == 2)
						{
						anim_frame = 1;
						}
					else
						{
						anim_frame = 2;
						}
					}
			
				charge++;
				if ((charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special))) && attack_frame == 0)
					{
					anim_frame = 3;
					attack_phase++;
					attack_frame = 8;
					//Sourspot
					var _damage = calculate_smash_damage(10);
					var _hitbox = hitbox_create_melee(0, 4, 0.4, 0.6, _damage, 9, 0.9, 15, 90, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					//Sweetspot
					var _damage = calculate_smash_damage(13);
					var _hitbox = hitbox_create_melee(0, -38, 0.3, 0.4, _damage, 10, 1, 15, 90, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = [HIT_FX.slash_strong, HIT_FX.shine];
					_hitbox.hit_sfx = snd_hit_explosion3;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					//Shine VFX
					fx_create(spr_shine_attack, 1, 0, 7, x, y - 38, 1, irandom(360));
					}
				break;
				}
			//Startup -> First Hit
			case 1:
				{
				if (attack_frame == 6)
					{
					anim_frame = 4;
					var _damage = calculate_smash_damage(10);
					var _hitbox = hitbox_create_melee(20, 6, 0.7, 0.6, _damage, 9, 0.9, 5, 75, 5, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					var _hitbox = hitbox_create_melee(-20, 6, 0.7, 0.6, _damage, 9, 0.9, 5, 75, 5, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					}
				
				if (attack_frame == 4)
					anim_frame = 5;
		
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = attack_has_hit() ? 5 : 15;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 11)
					anim_frame = 6;
				if (attack_frame == 7)
					anim_frame = 7;
				if (attack_frame == 3)
					anim_frame = 8;
		
				if (attack_frame==0)
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