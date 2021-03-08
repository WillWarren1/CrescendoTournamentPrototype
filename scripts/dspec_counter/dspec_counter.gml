function dspec_counter() {
	//Counter
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Timer
				attack_frame = max(--attack_frame, 0);
			
				//Speeds
				if (!on_ground())
					{
					speed_set(0, -1, true, false);
					}
			
				//Animation
				anim_sprite = spr_dspec_counter;
				anim_frame = 0;
				anim_speed = 0;
				
				attack_frame = 5;
				break;
				}
			//Startup
			case 0:
				{
				//Timer
				attack_frame = max(--attack_frame, 0);
			
				//Speeds
				if (on_ground())
					{
					friction_gravity(ground_friction, grav, 2);
					}
				else
					{
					friction_gravity(ground_friction, grav, 2);
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 1;
				
					attack_phase++;
					attack_frame = 20;
					hurtbox_inv_set(hurtbox, INV.counter, 20);
					}
				
				//Movement
				move();
				break;
				}
			//Check for attacks
			case 1:
				{
				//Timer
				attack_frame = max(--attack_frame, 0);
			
				//Speeds
				if (on_ground())
					friction_gravity(ground_friction, grav, 2);
				else
					friction_gravity(air_friction, grav, 2);
			
				//Animation
				if (attack_frame == 10)
					anim_frame = 2;
		
				if (attack_frame == 0)
					{
					anim_frame = 3;
				
					attack_phase++;
					attack_frame = 14;
					}
				
				//Movement
				move();
				break;
				}
			//Finish
			case 2:
				{
				//Timer
				attack_frame = max(--attack_frame, 0);
			
				//Speeds
				if (on_ground())
					friction_gravity(ground_friction, grav, max_fall_speed);
				else
					friction_gravity(air_friction, grav, max_fall_speed);
			
				if (attack_frame == 0)
					{
					attack_stop();
					}
				
				//Movement
				move();
				break;
				}
			//Counter activate
			case PHASE.counter:
				{
				var _attacking_hitbox = argument[1];
				//Freeze frames for both players
				self_hitlag_frame = 15;
				_attacking_hitbox.owner.self_hitlag_frame = 15;
			
				//Face the attacker
				var _face = sign(_attacking_hitbox.owner.x - x);
				if (_face != 0) then facing = _face;
			
				//Animation
				anim_frame = 4;
			
				//Command grab next phase
				attack_phase = 3;
				attack_frame = 30;
				hurtbox_inv_set(hurtbox, INV.invincible, 36);
				speed_set(0, 0, false, false);
				//VFX
				var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
				_fx.fx_xscale = 2 * facing;
				fx_create_action_lines(30, x, y, irandom(10), "FX_Layer");
				fx_create(spr_hit_counter, 1, 0, 35, x, y, 2, 0, "FX_Layer");
				fade_value = 0.0;
				_attacking_hitbox.owner.fade_value = 0.0;
				camera_shake(10);
				break;
				}
			//Attack phase
			case 3:
				{
				//Timer
				attack_frame = max(--attack_frame, 0);
			
				//Animation
				if (attack_frame == 28)
					anim_frame = 5;
				if (attack_frame == 26)
					anim_frame = 6;
				if (attack_frame == 21)
					anim_frame = 8;
				if (attack_frame == 15)
					anim_frame = 9;
				if (attack_frame == 7)
					anim_frame = 10;
			
				//Hitbox
				if (attack_frame == 24)
					{
					anim_frame = 7;
					var _hitbox = hitbox_create_melee(36, 0, 1, 1.9, 7, 10, 1, 15, 40, 7, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_strong;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					}
			
				//End attack
				if (attack_frame == 0)
					{
					attack_stop();
					}
				
				//Movement
				move();
				break;
				}
			}
		}


}
