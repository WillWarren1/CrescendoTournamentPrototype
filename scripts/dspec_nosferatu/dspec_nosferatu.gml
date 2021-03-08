function dspec_nosferatu() {
	//Down Special
	/*
	- Command grabs opponents in front, and heals HP
	- Restores double jump on hit
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	if (on_ground())
		{
		friction_gravity(ground_friction);
		}
	else
		{
		friction_gravity(air_friction, 0.4, 2);
		}
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_dspec_nosferatu;
				anim_frame = 0;
				anim_speed = 0;
			
				attack_frame = 15;
				custom_ids_struct.nosferatu_target = noone;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame = 1;
				if (attack_frame == 5)
					{
					speed_set(0, 0, false, false);
					anim_frame = 2;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 3;
				
					attack_phase++;
					attack_frame = 45;
					hurtbox_inv_set(hurtbox, INV.invincible, 3);
				
					//Hitboxes
					var _hitbox = hitbox_create_detectbox(64, 0, 0.9, 0.7, 3, HITBOX_SHAPE.square, 0);
					}
				break;
				}
			//Active / Endlag
			case 1:
				{
				//Animation
				if (attack_frame == 42)
					anim_frame = 4;
				if (attack_frame == 39)
					anim_frame = 5;
				if (attack_frame == 35)
					anim_frame = 6;
				if (attack_frame == 31)
					anim_frame = 7;
				if (attack_frame == 26)
					anim_frame = 8;
				if (attack_frame == 21)
					anim_frame = 9;
				if (attack_frame == 16)
					anim_frame = 10;
				if (attack_frame == 11)
					anim_frame = 11;
				if (attack_frame == 5)
					anim_frame = 12;
			
				if (attack_frame == 0)
					{
					attack_set_cooldown(60);
					attack_stop();
					}
				break;
				}
			//Detection
			case PHASE.detection:
				{
				var _hit = argument[1];
				switch(_hit.hurtbox.inv_type)
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
						attack_phase = 2;
						attack_frame = 30;
						with(_hit) 
							{
							Player_Move_To_Back();
							}
						speed_set(0, 0, false, false);
						command_grab(_hit, 64, -2);
						var _fx = fx_create(spr_hit_grab, 0, 0, 15, mean(x, other.x), mean(y, other.y), 3, 0, "FX_Layer_Below");
						_fx.shrink = 0.88;
						_fx.spin = 9;
						_fx.fade = true;
						var _fx = fx_create(spr_hit_grab, 0, 0, 15, mean(x, other.x), mean(y, other.y), 3, 180, "FX_Layer_Below");
						_fx.shrink = 0.88;
						_fx.spin = 9;
						_fx.fade = true;
						custom_ids_struct.nosferatu_target = _hit;
						break;
					}
				return;
				}
			//Grab
			case 2:
				{
				speed_set(0, 0, false, false);
				
				//Animation
				if (attack_frame == 29)
					anim_frame = 4;
				if (attack_frame == 27)
					anim_frame = 5;
				if (attack_frame == 25)
					anim_frame = 6;
				if (attack_frame == 23)
					anim_frame = 7;
				if (attack_frame == 21)
					anim_frame = 8;
				if (attack_frame == 19)
					anim_frame = 9;
				if (attack_frame == 15)
					anim_frame = 10;
				if (attack_frame == 10)
					anim_frame = 11;
				if (attack_frame == 5)
					anim_frame = 12;
					
				//Looping Hits
				if (attack_frame == 29)
					{
					var _hitbox = hitbox_create_targetbox(64, -2, 2, 2, 1, 0, 0, 5, 35, 9, HITBOX_SHAPE.square, 1, custom_ids_struct.nosferatu_target);
					_hitbox.techable = false;
					_hitbox.custom_hitstun = 10;
					_hitbox.asdi_multiplier = 0;
					_hitbox.drift_di_multiplier = 0;
					_hitbox.hitlag_scaling = 0;
					_hitbox.di_angle = 0;
					_hitbox.hit_fx_style = HIT_FX.none;
					_hitbox.hit_sfx = [snd_hit_crit, snd_hit_weak2];
					}
				if (attack_frame > 20)
					{
					hitbox_group_reset(1);
					//Healing
					damage = max(0, --damage);
					//Grab move
					grab_snap_move();
					}
					
				//Final Hit
				if (attack_frame == 20)
					{
					var _hitbox = hitbox_create_targetbox(64, -2, 2, 2, 4, 13, 0.1, 10, 45, 1, HITBOX_SHAPE.circle, 2, custom_ids_struct.nosferatu_target);
					_hitbox.custom_hitstun = 25;
					_hitbox.di_angle = 0;
					_hitbox.hit_fx_style = [HIT_FX.magic, HIT_FX.normal_medium];
					_hitbox.hit_sfx = [snd_hit_blast2];
					}
					
				if (attack_frame == 0)
					{
					custom_ids_struct.nosferatu_target = noone;
					//Restore double jump
					double_jumps = max_double_jumps;
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	move();
}