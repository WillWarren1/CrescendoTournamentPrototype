function fspec_core_enforcer() {
	//Core Enforcer
	/*
	- Command grab opponents in front, and shoot a powerful laser at them
	*/
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
					speed_set(0, -1, true, true);
					friction_gravity(air_friction, grav, max_fall_speed);
					}
				else
					{
					friction_gravity(ground_friction, grav, max_fall_speed);
					}
			
				//Animation
				anim_sprite = spr_dspec_shine;
				anim_frame = 0;
				anim_speed = 0;
				
				//Drawing
				attack_draw_script = fspec_core_enforcer_draw;
		
				//Variable management
				custom_ids_struct.core_enforcer_target = noone;
				
				attack_frame = 14;
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
					friction_gravity(ground_friction, grav, max_fall_speed);
					}
				else
					{
					friction_gravity(air_friction, grav, max_fall_speed);
					aerial_drift();
					}
			
				//Animation
				if (attack_frame == 6)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 10;
					hitbox_create_magnetbox(16, -4, 0.4, 0.4, 0, 10, 16, -4, 20, 6, HITBOX_SHAPE.circle, 0);
					hitbox_create_detectbox(16, -4, 0.4, 0.4, 6, HITBOX_SHAPE.circle, 1);
					}
				
				//Movement
				move();
				break;
				}
			//Check for collisions
			case 1:
				{
				//Timer
				attack_frame = max(--attack_frame, 0);
			
				//Speeds
				if (on_ground())
					{
					friction_gravity(ground_friction, grav, max_fall_speed);
					}
				else
					{
					friction_gravity(air_friction, grav, max_fall_speed);
					}
			
				if (attack_frame == 0)
					{
					//Animation
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
					{
					friction_gravity(ground_friction, grav, max_fall_speed);
					}
				else
					{
					friction_gravity(air_friction, grav, max_fall_speed);
					}
			
				//Animation
				if (attack_frame == 6)
					anim_frame = 4;
			
				if (attack_frame == 0)
					{
					if (on_ground())
						{
						attack_stop(PLAYER_STATE.idle);
						}
					else
						{
						attack_stop(PLAYER_STATE.aerial);
						}
					}
				
				//Movement
				move();
				break;
				}
			//Detection activate
			case PHASE.detection:
				{
				custom_ids_struct.core_enforcer_target = argument[1];
			
				switch(custom_ids_struct.core_enforcer_target.hurtbox.inv_type)
					{
					case INV.invincible:
						break;
					case INV.normal:
					case INV.parry:
					case INV.parry_ult:
					case INV.counter:
					case INV.shielding:
					case INV.powershielding:
					case INV.superarmor:
						//Command grab next phase
						attack_phase = 3;
						attack_frame = 60;
						speed_set(0, 0, false, false);
						break;
					}
				break;
				}
			//Throw phase
			case 3:
				{
				//Timer
				attack_frame = max(--attack_frame, 0);
			
				//Throw opponent into the air
				if (attack_frame == 40)
					{
					hitbox_create_targetbox(32, -4, 2, 2, 5, 14, 0, 8, 40, 1, HITBOX_SHAPE.square, 2, custom_ids_struct.core_enforcer_target);
					}
			
				//Shoot a laser beam
				if (attack_frame == 30)
					{
					var _hitbox = hitbox_create_melee(240, -140, 8, 1, 1, 4, 0.8, 1, 40, 8, HITBOX_SHAPE.rotation, 3);
					hitbox_set_sprite_angle(_hitbox, 30);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.background_clear_allow = false;
					}
				if (attack_frame > 20 && attack_frame < 30)
					{
					hitbox_group_reset(3);
					}
				if (attack_frame == 20)
					{
					hitbox_group_reset(3);
					var _hitbox = hitbox_create_melee(240, -140, 8, 1, 2, 8, 0.8, 5, 40, 1, HITBOX_SHAPE.rotation, 3);
					hitbox_set_sprite_angle(_hitbox, 30);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					}
			
				if (attack_frame == 10)
					{
					if (on_ground())
						{
						friction_gravity(ground_friction, grav, max_fall_speed);
						}
					else
						{
						friction_gravity(air_friction, grav, max_fall_speed);
						}
					}
			
				if (attack_frame == 0)
					{
					if (on_ground())
						{
						attack_stop(PLAYER_STATE.idle);
						}
					else
						{
						attack_stop(PLAYER_STATE.aerial);
						}
					}
				
				//Movement
				move();
				break;
				}
			}
		}
}