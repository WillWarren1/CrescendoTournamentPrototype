function dash_attack_mewtwo() {
	//Dash Attack
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Canceling
	if run && cancel_air_check() run = false;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				anim_sprite = spr_dash_attack_mewtwo;
				anim_speed = 0;
				anim_frame = 0;
			
				//Initial slowdown
				speed_set(2 * facing, 0, false, false);
			
				attack_frame = 10;
				return;
				}
			//Startup
			case 0:
				{
				//Friction & gravity
				friction_gravity(slide_friction);
				
				if (attack_frame == 8)
					anim_frame = 1;
				if (attack_frame == 6)
					anim_frame = 2;
				if (attack_frame == 4)
					anim_frame = 3;
				if (attack_frame == 2)
					anim_frame = 4;
				
				if (attack_frame == 0)
					{
					anim_frame = 5;
			
					attack_phase++;
					attack_frame = 10;
					
					speed_set(13 * facing, 0, false, false);
				
					var _hitbox = hitbox_create_melee(30, 0, 1, 0.4, 12, 8, 1, 12, 45, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = [HIT_FX.normal_strong, HIT_FX.magic];
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.shieldstun_scaling = 0.4;
					
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
					}
				break;
				}
			//Active
			case 1:
				{		
				//Friction & gravity
				friction_gravity(slide_friction);
				
				if (attack_frame == 8)
					{
					anim_frame = 6;
					var _hitbox = hitbox_create_melee(24, 0, 1, 0.3, 6, 6, 1, 8, 45, 8, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
					_hitbox.hit_fx_style = [HIT_FX.normal_weak, HIT_FX.magic];
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					_hitbox.shieldstun_scaling = 0.4;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 7;
				
					attack_phase++;
					attack_frame = attack_has_hit() ? 9 : 18;
					}
				break;
				}
			//Endlag
			case 2:
				{
				//Friction & gravity
				friction_gravity(ground_friction);
	
				//Animation
				if (attack_frame <= 12)
					anim_frame = 8;
				if (attack_frame <= 6)
					anim_frame = 9;
			
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