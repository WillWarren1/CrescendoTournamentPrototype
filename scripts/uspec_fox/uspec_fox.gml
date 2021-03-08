function uspec_fox() {
	//Up Special
	/*
	- Angle in any direction
	- Hitting opponents doesn't put you into the helpless state
	- The beginning of the attack is strongest
	- Hitting the ground at certain angles stops the move
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
				anim_set(spr_uspec_fox, 0, 0);
			
				//Variable management
				custom_attack_struct.fox_uspec_dir = 0;
				
				attack_draw_script = uspec_fox_draw;
			
				speed_set(0, 0.5, false, false);
				attack_frame = 30;
				landing_lag = 15;
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame == 24)
					anim_frame = 1;
				if (attack_frame == 18)
					anim_frame = 2;
				if (attack_frame == 12)
					anim_frame = 3;
				if (attack_frame == 6)
					anim_frame = 4;
				
				//Multihit Attacks
				if (attack_frame <= 18 && attack_frame % 3 == 0)
					{
					hitbox_group_reset(0);
					var _hitbox = hitbox_create_melee(0, 0, 0.9, 0.9, 1, 1, 0, 4, 180, 2, HITBOX_SHAPE.circle, 0, FLIPPER.toward_player_center);
					_hitbox.hitlag_scaling = 0;
					_hitbox.techable = false;
					
					//VFX
					var _fx = fx_create(spr_fx_fire, 1, 0, 9, x + irandom_range(-10, 10), bbox_bottom + 16, 2, 270 + irandom_range(-15, 15));
					_fx.fx_yscale = choose(-2, 2);
					}
				
				if (attack_frame == 0)
					{
					//Point in the correct direction
					var _dir = (stick_tilted(Lstick)) ? stick_get_direction(Lstick) : 90;
					speed_set(lengthdir_x(15, _dir), lengthdir_y(15, _dir), false, false);
					hitboxes_destroy_attached_all();
					
					//Strong hitbox
					var _hitbox = hitbox_create_melee(0, 0, 0.8, 0.8, 12, 10, 0.65, 15, _dir, 5, HITBOX_SHAPE.circle, 1, FLIPPER.fixed);
					_hitbox.hitstun_scaling = 0.8;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hit_fx_style = [HIT_FX.normal_strong, HIT_FX.spin];
					_hitbox.di_angle = 10;
					custom_attack_struct.fox_uspec_dir = _dir;
				
					//Animation
					anim_frame = 5;
					anim_angle = (facing == 1 ? _dir : _dir - 180);

					attack_frame = 25;
					attack_phase++;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				//Late hitbox
				if (attack_frame == 20)
					{
					var _hitbox = hitbox_create_melee(0, 0, 0.7, 0.7, 5, 5, 0.5, 7, custom_attack_struct.fox_uspec_dir, 20, HITBOX_SHAPE.circle, 1, FLIPPER.fixed);
					_hitbox.custom_hitstun = 20;
					_hitbox.hit_sfx = snd_hit_weak2;
					_hitbox.hit_fx_style = [HIT_FX.spin, HIT_FX.normal_weak];
					}
				
				//VFX
				if (attack_frame % 2 == 0)
					{
					var _fx = fx_create(spr_fx_smoke, 1, 0, 25, x, y, 2, custom_attack_struct.fox_uspec_dir + irandom_range(-15, 15), "FX_Layer_Below");
					_fx.fx_yscale = choose(-2, 2);
					_fx.fade = true;
					}
				if (attack_frame % 3 == 0)
					{
					var _fx = fx_create(spr_fx_fire, 1, 0, 9, x, y, 2, custom_attack_struct.fox_uspec_dir + irandom_range(-10, 10));
					_fx.fx_yscale = choose(-2, 2);
					}
				if (attack_frame % 3 == 1)
					{
					var _fx = fx_create(spr_fx_spin, 1, 0, 13, x, y, 1, custom_attack_struct.fox_uspec_dir);
					_fx.fx_yscale = choose(-1, 1);
					_fx.shrink = 1.08;
					_fx.fx_blend = make_color_hsv(irandom_range(0, 40), 200, 255);
					}
				
				//Animation
				if (attack_frame % 3 == 0)
					{
					anim_frame++;
					if (anim_frame > 9)
						anim_frame = 5;
					}
				
				//Hit the ground
				if (on_ground())
					{
					if (abs(angle_difference(custom_attack_struct.fox_uspec_dir, 270)) < 45)
						{
						hitboxes_destroy_attached_all();
						speed_set(hsp / 2, -6, false, false);
						attack_frame = 20;
						attack_phase = 3;
						//VFX
						fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
						break;
						}
					}
			
				//Grab ledges
				if (check_ledge_grab()) 
					{
					attack_draw_script = -1;
					return;
					}
			
				//Speed
				var _spd = 14;
				speed_set(lengthdir_x(_spd, custom_attack_struct.fox_uspec_dir), lengthdir_y(_spd, custom_attack_struct.fox_uspec_dir), false, false);
			
				if (attack_frame == 0)
					{
					speed_set(hsp / 2, vsp / 2, false, false);
					attack_frame = 20;
					attack_phase++;
					//Cancel on hit
					if (attack_has_hit())
						{
						attack_stop();
						run = false;
						}
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 16)
					anim_frame = 10;
				if (attack_frame == 12)
					anim_frame = 11;
				if (attack_frame == 8)
					anim_frame = 12;
				if (attack_frame == 4)
					anim_frame = 13;
				
				//Grab ledges
				if (check_ledge_grab()) 
					{
					attack_draw_script = -1;
					return;
					}
				
				//Now has friction/gravity
				if (on_ground())
					{
					friction_gravity(air_friction, grav, max_fall_speed);
					}
				else
					{
					friction_gravity(ground_friction, grav, max_fall_speed);
					}
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.helpless);
					run = false;
					}
				break;
				}
			//Grounded bounce
			case 3:
				{
				//Animation
				if (attack_frame == 16)
					anim_frame = 10;
				if (attack_frame == 12)
					anim_frame = 11;
				if (attack_frame == 8)
					anim_frame = 12;
				if (attack_frame == 4)
					anim_frame = 13;
				
				//Now has friction/gravity
				friction_gravity(air_friction, grav, max_fall_speed);
			
				//Drift
				aerial_drift();
			
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.helpless);
					run = false;
					}
				break;
				}
			}
		}
	//Movement
	move_hit_platforms();
	
	//Hurtbox
	if (run)
		{
		hurtbox_anim_match();
		}
}