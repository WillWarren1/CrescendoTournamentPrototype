function fspec_afterburner_kick() {
	//Forward Special
	/*
	- Has no cooldown if the attack hits an opponent
	- Hold down during the startup of the aerial version to use the downward angled kick
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
				anim_sprite = spr_fspec_afterburner_kick;
				anim_speed = 0;
				anim_frame = 0;
			
				speed_set(0, 0, true, false);
				attack_frame = 7;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 4)
					anim_frame = 1;
					
				if (attack_frame == 0)
					{
					//Standard
					if (!stick_tilted(Lstick, DIR.down) || on_ground())
						{
						anim_frame = 2;
					
						//Speed
						speed_set(13 * facing, -3, false, false);
				
						//Hitbox
						var _hitbox = hitbox_create_melee(24, -8, 1, 0.6, 6, 10, 0.2, 12, 65, 3, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, 20);
						_hitbox.di_angle = 3;
						_hitbox.custom_hitstun = 30;
						_hitbox.hit_fx_style = HIT_FX.normal_medium;
					
						attack_phase++;
						attack_frame = 13;
						}
					//Downward angled
					else
						{
						anim_frame = 2;
						anim_angle = facing == 1 ? -65 : 65;
						
						//Speed
						speed_set(8 * facing, 8, false, false);
						landing_lag = 10;
				
						//Hitbox
						var _hitbox = hitbox_create_melee(16, 16, 0.9, 0.5, 5, 10, 0.35, 14, 80, 13, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, -45);
						_hitbox.custom_hitstun = 35;
						_hitbox.hit_fx_style = HIT_FX.normal_medium;
						
						attack_phase = 3;
						attack_frame = 14;
						}
					}
				break;
				}
			//Standard Active
			case 1:
				{
				//Grab ledges
				if check_ledge_grab() 
					{
					run = false;
					return;
					}
			
				//Speed
				speed_set(14 * facing, -3, false, false);
			
				//Animation
				if (attack_frame == 11)
					anim_frame = 3;
				if (attack_frame == 9)
					anim_frame = 4;
				if (attack_frame == 7)
					anim_frame = 5;
				if (attack_frame == 5)
					anim_frame = 6;
				if (attack_frame == 3)
					anim_frame = 7;
				if (attack_frame == 1)
					anim_frame = 8;
			
				if (attack_frame == 10)
					{
					var _hitbox = hitbox_create_melee(24, -8, 1, 0.5, 6, 8, 0.2, 12, 70, 3, HITBOX_SHAPE.rotation, 0);
					hitbox_set_sprite_angle(_hitbox, 20);
					_hitbox.di_angle = 3;
					_hitbox.custom_hitstun = 27;
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					}
					
				if (attack_frame == 7)
					{
					var _hitbox = hitbox_create_melee(24, -8, 1, 0.5, 6, 8, 0.2, 12, 85, 2, HITBOX_SHAPE.rotation, 0);
					hitbox_set_sprite_angle(_hitbox, 20);
					_hitbox.di_angle = 3;
					_hitbox.custom_hitstun = 24;
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					}
					
				if (attack_frame == 5)
					{
					var _hitbox = hitbox_create_melee(24, -8, 1, 0.4, 6, 8, 0.2, 8, 100, 5, HITBOX_SHAPE.rotation, 0);
					hitbox_set_sprite_angle(_hitbox, 20);
					_hitbox.di_angle = 3;
					_hitbox.custom_hitstun = 22;
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 9;
					
					//Speed
					speed_set(0, -1, false, false);
				
					//No cooldown on hit
					if (attack_has_hit())
						{
						attack_set_cooldown(0);
						attack_frame = 3;
						}
					else
						{
						attack_set_cooldown(50);
						attack_frame = 13;
						}
						
					attack_phase++
					}
				break;
				}
			//Standard Finish
			case 2:
				{
				//Animation
				if (attack_frame == 11)
					anim_frame = 10;
				if (attack_frame == 7)
					anim_frame = 11;
				if (attack_frame == 3)
					anim_frame = 12;
				if (attack_frame == 2 && anim_frame == 9)
					anim_frame = 10;
			
				//Speed
				friction_gravity(air_friction, grav, max_fall_speed);
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					run = false;
					}
				break;
				}
			//Downward Active
			case 3:
				{
				//Cancel
				if (cancel_ground_check()) 
					{
					run = false;
					break;
					}
				
				//Animation
				if (attack_frame == 12)
					anim_frame = 3;
				if (attack_frame == 10)
					anim_frame = 4;
				if (attack_frame == 8)
					anim_frame = 5;
				if (attack_frame == 6)
					anim_frame = 6;
				if (attack_frame == 4)
					anim_frame = 7;
				if (attack_frame == 2)
					anim_frame = 8;
					
				//Hit cancel
				if (attack_has_hit())
					{
					attack_set_cooldown(0);
					hitboxes_destroy_attached_all();
					speed_set(0, -5, false, false);
					attack_phase = 5;
					attack_frame = 7;
					break;
					}
					
				if (attack_frame == 0)
					{
					attack_set_cooldown(50);
					attack_frame = 18;
					attack_phase++;
					}
				break;
				}
			//Downward Finish
			case 4:
				{
				//Cancel
				if (cancel_ground_check())
					{
					run = false;
					break;
					}
				
				//Animation
				if (attack_frame == 13)
					anim_frame = 10;
				if (attack_frame == 9)
					anim_frame = 11;
				if (attack_frame == 4)
					anim_frame = 12;
					
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					run = false;
					}
				break;
				}
			//Downward Jump Finish
			case 5:
				{
				//Drift
				aerial_drift();
				
				//Animation
				if (attack_frame == 6)
					anim_frame = 10;
				if (attack_frame == 4)
					anim_frame = 11;
				if (attack_frame == 2)
					anim_frame = 12;
				
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					run = false;
					}
				break;
				}
			}
		}
	//Movement
	move();
	
	//Hurtbox matching
	if (run)
		{
		hurtbox_anim_match(spr_fspec_afterburner_kick_hurtbox);
		}
}