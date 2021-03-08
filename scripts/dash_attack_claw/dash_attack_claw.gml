function dash_attack_claw() {
	//Dash Attack
	/*
	- You can cancel the startup with an Up Smash
	*/
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
				anim_sprite = spr_dash_attack_claw;
				anim_speed = 0;
				anim_frame = 0;
			
				//Initial boost
				speed_set(6 * facing, 0, true, true);
				hsp = clamp(hsp, -11, 11);
			
				//VFX
				var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
				_fx.fx_xscale = 2 * facing;
			
				attack_frame = 8;
				return;
				}
			//Startup
			case 0:
				{
				//Friction gravity
				friction_gravity(slide_friction);
			
				//Dash attack cancel up smash
				if (attack_frame > 3)
					{
					var _stick = stick_choose_by_input(INPUT.smash);
					if (stick_tilted(_stick, DIR.up) && button(INPUT.smash))
						{
						attack_start(my_attacks[? "Usmash"]);
						break;
						}
					}
				
				if (attack_frame == 6)
					anim_frame = 1;
				if (attack_frame == 4)
					anim_frame = 2;
				if (attack_frame == 2)
					anim_frame = 3;
				
				if (attack_frame == 0)
					{
					anim_frame = 4;
			
					attack_phase++;
					attack_frame = 12;
				
					var _hitbox = hitbox_create_melee(54, 0, 0.9, 1.0, 10, 7, 0.7, 7, 45, 4, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.shieldstun_scaling = 0.4;
					var _hitbox = hitbox_create_melee(6, 6, 0.6, 0.6, 10, 7, 0.7, 6, 45, 4, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.shieldstun_scaling = 0.4;
					}
				break;
				}
			//Active
			case 1:
				{		
				//Friction gravity
				friction_gravity(ground_friction);
			
				if (attack_frame == 9)
					anim_frame = 5;
				if (attack_frame == 4)
					anim_frame = 6;
				
				if (attack_frame == 0)
					{
					anim_frame = 7;
				
					attack_phase++;
					attack_frame = attack_has_hit() ? 2 : 18;
					}
				break;
				}
			//Endlag
			case 2:
				{
				//Friction gravity
				friction_gravity(ground_friction);
	
				//Animation
				if (attack_frame == 9)
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