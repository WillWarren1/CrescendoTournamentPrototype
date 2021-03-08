function fspec_falcon() {
	//Forward Special
	/*
	- Rushes ahead until an opponent is hit, then attacks
	- The grounded move hits upwards; the aerial move hits downwards
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_fspec_falcon;
				anim_frame = 0;
				anim_speed = 0;
		
				//Move backwards
				change_facing();
				if (on_ground())
					{
					speed_set(-6 * facing, 0, false, false);
					}
				else
					{
					speed_set(-1 * facing, 0, false, false);
					}
				attack_frame = 12;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 6)
					anim_frame = 1;
				if (attack_frame == 3)
					anim_frame = 2;
			
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 3;
				
					attack_frame = 15;
					attack_phase++;
				
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
				
					//Detection hitbox
					hitbox_create_detectbox(30, 0, 0.3, 0.4, 15, HITBOX_SHAPE.circle, 0);
					
					//Speed
					if (on_ground())
						{
						speed_set(15 * facing, 0, false, false);
						}
					else
						{
						speed_set(13 * facing, 0, false, false);
						}
					}
				break;
				}
			//Rush
			case 1:
				{
				if (check_ledge_grab()) return;
			
				//Animation
				if (attack_frame == 14)
					anim_frame = 4;
				if (attack_frame < 14 && attack_frame % 2 == 0)
					{
					anim_frame++;
					if (anim_frame > 8)
						{
						anim_frame = 5;
						}
					}
				
				//End attack in a failure
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 19;
				
					if (on_ground())
						{
						speed_set(4 * facing, 0, false, false);
						}
					else
						{
						speed_set(4 * facing, -1, false, false);
						}
					attack_phase = 4;
					attack_frame = 28;
					}
				break;
				}
			//Detection
			case PHASE.detection:
				{
				if (attack_phase == 1)
					{
					//If the opponent is hit, auto attack
					if (on_ground())
						{
						//Animation
						anim_frame = 9;
							
						attack_phase = 2;
						attack_frame = 18;
						hurtbox_inv_set(hurtbox, INV.superarmor, 7);
						}
					else
						{
						//Animation
						anim_frame = 14;
							
						speed_set(facing, -4, false, true);
						attack_phase = 3;
						attack_frame = 13;
						hurtbox_inv_set(hurtbox, INV.superarmor, 5);
						}
					}
				return;
				}
			//Grounded Hit
			case 2:
				{
				speed_set(0, 0, false, false);
			
				//Animation
				if (attack_frame == 17)
					anim_frame = 10;
				if (attack_frame == 11)
					anim_frame = 12;
				if (attack_frame == 5)
					anim_frame = 13;
			
				if (attack_frame == 16)
					{
					hitboxes_destroy_attached_all();
					//Animation
					anim_frame = 11;
				
					var _hitbox = hitbox_create_melee(38, -20, 0.5, 1, 9, 11, 0.1, 14, 80, 4, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = snd_hit_punch;
					_hitbox.shieldstun_scaling = 0.5;
					_hitbox.drift_di_multiplier = 0;
					_hitbox.di_angle = 5;
					hitbox_create_melee(4, -10, 0.3, 0.5, 9, 11, 0.1, 4, 80, 4, HITBOX_SHAPE.circle, 1);
					}
		
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			//Aerial Hit
			case 3:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 16;
				if (attack_frame == 6)
					anim_frame = 17;
				if (attack_frame == 2)
					anim_frame = 18;
			
				if (attack_frame == 11)
					{
					//Animation
					anim_frame = 15;
				
					var _hitbox = hitbox_create_melee(30, 8, 0.5, 1, 9, 9, 0.7, 14, 300, 4, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = snd_hit_punch;
					_hitbox.shieldstun_scaling = 0.8;
					hitbox_create_melee(4, 4, 0.3, 0.5, 9, 9, 0.7, 14, 300, 4, HITBOX_SHAPE.circle, 1);
					}
			
				if (attack_frame == 0)
					{
					//End in helpless if you hit a shield
					if (attack_has_hit(true, true))
						{
						attack_stop(PLAYER_STATE.helpless);
						}
					else
						{
						attack_stop(PLAYER_STATE.aerial);
						}
					}
				break;
				}
			//No attack finish
			case 4:
				{
				//Animation
				if (attack_frame == 25)
					anim_frame = 20;
				if (attack_frame == 20)
					anim_frame = 21;
				if (attack_frame == 15)
					anim_frame = 22;
				if (attack_frame == 10)
					anim_frame = 23;
			
				if (on_ground())
					{
					friction_gravity(ground_friction, grav, max_fall_speed);
					}
				else
					{
					if (check_ledge_grab()) return;
					friction_gravity(air_friction, grav, max_fall_speed);
					}
				if (attack_frame == 0)
					{
					if (on_ground())
						{
						attack_stop(PLAYER_STATE.idle);
						}
					else
						{
						attack_stop(PLAYER_STATE.helpless);
						}
					}
				break;
				}
			}
		}
	//Movement
	if (on_ground())
		{
		move_grounded();
		}
	else
		{
		move();
		}
}