function fspec_drill() {
	//Forward Special
	/*
	- Multihit attack
	- Can be slightly angled
	- The final hit bounces off opponents
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
				anim_sprite = spr_fspec_drill;
				anim_frame = 0;
				anim_speed = 0;
				landing_lag = 20;
			
				//Special variable
				custom_ids_struct.drill_facing = facing;
				if (facing == -1)
					{
					anim_angle = 180;
					}
				facing = 1;
		
				attack_frame = 15;
			
				speed_set(0, 0, false, false);
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame = 1;
				if (attack_frame == 5)
					anim_frame = 2;
			
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 3;
				
					attack_frame = 32;
					attack_phase++;
				
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
				
					//Initial hit
					var _hitbox = hitbox_create_magnetbox(0, 0, 0.9, 0.5, 1, 5, 32 * custom_ids_struct.drill_facing, 0, 15, 1, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
				break;
				}
			//Rush
			case 1:
				{
				//Angling
				if (stick_tilted(Lstick))
					{
					anim_angle -= clamp(angle_difference(anim_angle, stick_get_direction(Lstick)), -2, 2);
					}
				speed_set(lengthdir_x(12, anim_angle), lengthdir_y(12, anim_angle));
			
				//Cancel on ground
				if (on_ground() && abs(angle_difference(anim_angle, 270)) < 45)
					{
					attack_phase++;
					attack_frame = 20;
					speed_set(-4 * custom_ids_struct.drill_facing, -7, false, false);
					break;
					}
			
				if check_ledge_grab() return;
			
				//Animation / Looping hits
				if (attack_frame % 3 == 0)
					{
					anim_frame++;
					if (anim_frame > 6)
						{
						anim_frame = 3;
						}
					hitbox_group_reset_all();
					var _hitbox = hitbox_create_magnetbox(0, 0, 0.9, 0.5, 1, 3, lengthdir_x(32, anim_angle), lengthdir_y(32, anim_angle), 15, 3, HITBOX_SHAPE.rotation, 0);
					hitbox_set_sprite_angle(_hitbox, anim_angle);
					_hitbox.hit_sfx = snd_hit_weak2;
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
			
				//Final Hit
				if (attack_frame == 0)
					{
					anim_frame = 7;
					attack_phase++;
					attack_frame = 20;
				
					var _hitbox = hitbox_create_melee(0, 0, 1.2, 0.9, 5, 9, 0.8, 15, (custom_ids_struct.drill_facing == 1 ? 50 : 130), 6, HITBOX_SHAPE.rotation, 1);
					hitbox_set_sprite_angle(_hitbox, anim_angle);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
				
					speed_set(0, -1, false, false);
					}
				break;
				}
			//Endlag
			case 2:
				{
				//Bounce back
				if (attack_frame == 15 && hitbox_attached_group_has_hit(1))
					{
					speed_set(-7 * custom_ids_struct.drill_facing, -7, false, false);
					facing = custom_ids_struct.drill_facing;
					anim_angle -= 180;
					attack_frame = 5; //Whiff lag
					}
				if (attack_frame < 15)
					{
					friction_gravity(air_friction, 0.3, max_fall_speed);
					}
			
				//Animation
				if (attack_frame == 17)
					anim_frame = 8;
				if (attack_frame == 5)
					anim_frame = 9;
		
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.helpless);
					}
				break;
				}
			}
		}
	//Movement
	move();


}
