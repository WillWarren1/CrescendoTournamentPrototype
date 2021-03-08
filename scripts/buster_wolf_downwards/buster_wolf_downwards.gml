function buster_wolf_downwards() {
	/*
	- Rushes ahead until an opponent is hit, then attacks
	- Hitting a shield is the same as missing the attack
	- If used in the air, the attack is weaker
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
				anim_sprite = spr_buster_wolf;
				anim_frame = 0;
				anim_speed = 0;
				anim_angle = facing == 1 ? 280 : 80;
			
				change_facing();
				speed_set(0, 0, false, false);
				attack_frame = 14;
				landing_lag = 12;
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
					anim_frame = 3;
					attack_frame = 19;
					attack_phase++;
					speed_set(3 * facing, 15, false, false);
					//Detection hitbox
					hitbox_create_detectbox(4, 32, 0.6, 0.6, 19, HITBOX_SHAPE.circle, 0);
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, facing == 1 ? 280 : 80, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
					}
				break;
				}
			//Rush
			case 1:
				{
				//Animation
				if (attack_frame == 17)
					anim_frame = 4;
				if (attack_frame == 15)
					anim_frame = 5;
				if (attack_frame == 13)
					anim_frame = 6;
				if (attack_frame == 7)
					anim_frame = 4;
				if (attack_frame == 5)
					anim_frame = 5;
				if (attack_frame == 3)
					anim_frame = 6;
				
				//VFX
				if (attack_frame % 3 == 0)
					{
					var _fx = fx_create(spr_buster_wolf_trail, 1, 0, 13, x, bbox_bottom, 2, facing == 1 ? 280 : 80, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
					}
			
				//Miss
				var _ground = on_ground();
				if (attack_frame == 0 || _ground)
					{
					if (_ground) then camera_shake(6);
					anim_frame = 7;
					attack_phase = 3;
					attack_frame = on_ground() ? 35 : 15;
					}
				break;
				}
			//Detection
			case PHASE.detection:
				{
				var _target = argument[1];
				switch(_target.hurtbox.inv_type)
					{
					case INV.invincible:
					case INV.shielding:
					case INV.powershielding:
						//Hitting a shield counts as missing
						anim_frame = 7;
						attack_phase = 3;
						attack_frame = on_ground() ? 35 : 15;
						break;
					case INV.normal:
					case INV.parry:
					case INV.parry_ult:
					case INV.counter:
					case INV.superarmor:
						invulnerability_set(INV.superarmor, 8);
						anim_frame = 12;	
						attack_phase = 2;
						attack_frame = 35;
						command_grab(_target, 4, 32);
						with(_target)
							{
							//Grav VFX
							var _dir = irandom(360);
							var _fx = fx_create(spr_hit_grab, 0, 0, 15, mean(x, other.x), mean(y, other.y), 3, _dir, "FX_Layer_Below");
							_fx.shrink = 0.88;
							_fx.spin = 9;
							_fx.fade = true;
							var _fx = fx_create(spr_hit_grab, 0, 0, 15, mean(x, other.x), mean(y, other.y), 3, _dir + 180, "FX_Layer_Below");
							_fx.shrink = 0.88;
							_fx.spin = 9;
							_fx.fade = true;
							}
						speed_set(0, 0, false, false);
						break;
					}
				return;
				}
			//Explosion
			case 2:
				{
				//Grab
				if (attack_frame > 20)
					{
					grab_snap_move();
					}
					
				//Animation
				if (attack_frame == 28)
					anim_frame = 13;
				if (attack_frame == 17)
					anim_frame = 15;
				if (attack_frame == 12)
					anim_frame = 16;
				if (attack_frame == 6)
					anim_frame = 17;
			
				if (attack_frame == 20)
					{
					anim_frame = 14;
					speed_set(-4 * facing, -9, false, false);
				
					//Hitbox
					var _hitbox = hitbox_create_melee(4, 56, 1.1, 0.7, 20, 5, 1.6, 12, 280, 4, HITBOX_SHAPE.rotation, 1);
					_hitbox.image_angle = facing == 1 ? 280 : 80;
					_hitbox.hit_sfx = snd_hit_blast;
					_hitbox.hit_fx_style = [HIT_FX.explosion, HIT_FX.normal_strong];
					_hitbox.techable = false;
					var _hitbox = hitbox_create_melee(4, 108, 3, 1.8, 5, 7, 0.6, 3, 45, 5, HITBOX_SHAPE.rotation, 1);
					_hitbox.image_angle = facing == 1 ? 280 : 80;
					_hitbox.hit_sfx = snd_hit_blast2;
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
				
					//VFX
					var _fx = fx_create(spr_buster_wolf_explosion, 1, 0, 39, x + (4 * facing), y + 48, 2, facing == 1 ? 280 : 80);
					_fx.fx_xscale = 2 * facing;
					}
		
				if (attack_frame < 20)
					{
					aerial_drift();
					friction_gravity(air_friction, grav, max_fall_speed);
					}
		
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			//Miss
			case 3:
				{
				//Animation
				if (attack_frame == 30)
					anim_frame = 8;
				if (attack_frame == 24)
					anim_frame = 9;
				if (attack_frame == 15)
					anim_frame = 10;

				//Speeds
				friction_gravity(ground_friction, grav, max_fall_speed);
				
				if (attack_frame == 0)
					{
					attack_stop();
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
