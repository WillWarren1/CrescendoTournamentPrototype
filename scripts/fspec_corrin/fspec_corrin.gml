function fspec_corrin() {
	//Forward Special
	/*
	- When grounded, the attack starts with a jump
	- Press again to stab
	- Stabbing the stage will pin you (and any opponents) in place
	- You can cancel the pin with a jump, kick, or fall
	- The stab has a sweetspot on the tip
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
				anim_sprite = spr_fspec_corrin;
				anim_speed = 0;
				landing_lag = 10;
			
				if (on_ground())
					{
					anim_frame = 0;
					attack_frame = 36;
					attack_phase = 0;
					}
				else
					{
					speed_set(0, -1, true, true);
					anim_frame = 4;
					attack_frame = 10;
					attack_phase = 1;
					}
				return;
				}
			//Grounded Jump
			case 0:
				{
				if (attack_frame < 33)
					{
					if (cancel_ground_check()) then return;
					friction_gravity(air_friction, grav, max_fall_speed);
					aerial_drift();
					}
			
				//Animation
				if (attack_frame == 34)
					anim_frame = 1;
				if (attack_frame == 30)
					anim_frame = 2;
				if (attack_frame == 26)
					anim_frame = 3;
				if (attack_frame == 22)
					anim_frame = 4;
				if (attack_frame == 18)
					anim_frame = 5;
				if (attack_frame == 14)
					anim_frame = 6;
				if (attack_frame == 10)
					anim_frame = 7;
				if (attack_frame == 5)
					anim_frame = 8;
				
				//Jump
				if (attack_frame == 33)
					{
					speed_set(5 * facing, -5, false, false);
					}
				
				//Cancel into attack
				if (attack_frame <= 32)
					{
					if (button(INPUT.attack) || button(INPUT.special))
						{
						attack_phase = 1;
						attack_frame = 4;
						anim_frame = 8;
						}
					}
				
				if (attack_frame == 0)
					{
					attack_stop();
					run = false;
					}
				break;
				}
			//Stab Attack Startup
			case 1:
				{	
				if (cancel_ground_check()) then return;
				friction_gravity(air_friction, grav, max_fall_speed);
				aerial_drift();
					
				//Animation
				if (attack_frame == 8)
					anim_frame = 5;
				if (attack_frame == 6)
					anim_frame = 6;
				if (attack_frame == 4)
					anim_frame = 7;
				if (attack_frame == 2)
					anim_frame = 8;
			
				if (attack_frame == 0)
					{
					//Pinning
					var _pinned = false;
					ds_list_clear(get_temp_list());
					if (collision_point_list(x + 96 * facing, y + 44, obj_collidable, true, true, get_temp_list(), false) > 0)
						{
						for(var i = 0; i < ds_list_size(get_temp_list()); i++)
							{
							var _inst = get_temp_list()[| i];
							var _f = flags_create(FLAG.block);
							if (_f & _inst.flags == _f)
								{
								_pinned = true;
							
								//VFX
								var _fx = fx_create(spr_dust_dash_large, 1, 0, 33, x + (90 * facing), _inst.bbox_top, 2, 0, "FX_Layer_Below");
								_fx.fx_xscale = 2 * -facing;
								break;
								}
							}
						}
					
					//Hitboxes
					if (!_pinned)
						{
						anim_frame = 9;
						attack_phase = 2;
						attack_frame = 24;
						var _hitbox = hitbox_create_melee(96, 44, 0.2, 0.2, 12, 7, 1.1, 16, 40, 3, HITBOX_SHAPE.circle, 0);
						_hitbox.hit_sfx = snd_hit_strong;
						_hitbox.hit_fx_style = [HIT_FX.shine, HIT_FX.splash, HIT_FX.slash_weak];
						_hitbox.knockback_state = PLAYER_STATE.in_balloon;
						var _hitbox = hitbox_create_melee(50, 20, 1.5, 0.1, 7, 6, 0.8, 9, 45, 3, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, 334);
						_hitbox.hit_sfx = snd_hit_weak2;
						_hitbox.hit_fx_style = HIT_FX.slash_weak;
						}
					else
						{
						anim_frame = 9;
						attack_phase = 3;
						attack_frame = 60;
						var _hitbox = hitbox_create_melee(50, 20, 1.5, 0.1, 7, 1, 0, 5, 45, 3, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, 334);
						_hitbox.hit_sfx = snd_hit_weak;
						_hitbox.hit_fx_style = HIT_FX.slash_weak;
						_hitbox.di_angle = 0;
						_hitbox.asdi_multiplier = 0;
						_hitbox.techable = false;
						var _hitbox = hitbox_create_detectbox(50, 20, 1.5, 0.1, 3, HITBOX_SHAPE.rotation, 1);
						hitbox_set_sprite_angle(_hitbox, 334);
						speed_set(0, 0, false, false);
						}
					
					//Shine VFX
					fx_create(spr_shine_attack, 1, 0, 7, x + hsp + 96 * facing, y + 44 + vsp, 1, irandom(360));
					}
				break;
				}
			//Pinning Opponents
			case PHASE.detection:
				{
				var _target = argument[1];
				switch(_target.hurtbox.inv_type)
					{
					case INV.invincible:
					case INV.parry:
					case INV.parry_ult:
					case INV.counter:
					case INV.shielding:
					case INV.powershielding:
					case INV.superarmor:
						break;
					case INV.normal:
						command_grab(_target, abs(_target.x - x), _target.y - y);
						with(_target)
							{
							Player_Move_To_Back();
							}
						break;
					}
				return;
				}
			//Stab Attack Endlag
			case 2:
				{
				if (cancel_ground_check()) then return;
				friction_gravity(air_friction, grav, max_fall_speed);
				aerial_drift();
				
				//Animation
				if (attack_frame == 22)
					anim_frame = 10;
				if (attack_frame == 19)
					anim_frame = 11;
				if (attack_frame == 15)
					anim_frame = 12;
				if (attack_frame == 10)
					anim_frame = 13;
				if (attack_frame == 5)
					anim_frame = 14;
			
				if (attack_frame == 0)
					{
					attack_stop();
					run = false;
					}
				break;
				}
			//Pinned Neutral
			case 3:
				{
				speed_set(0, 0, false, false);
			
				//Actions
				if (attack_frame < 45)
					{
					//Fall
					if (stick_tilted(Lstick, DIR.down))
						{
						attack_phase = 4;
						attack_frame = 18;
						anim_frame = 11;
					
						//Release any pinned opponents
						with(obj_player)
							{
							if (state == PLAYER_STATE.is_grabbed && grab_hold_id == other.id)
								{
								state_set(PLAYER_STATE.aerial);
								}
							}
						}
					//Jump
					else if (stick_tilted(Lstick, DIR.up) || button(INPUT.jump))
						{
						attack_phase = 5;
						attack_frame = 10;
						anim_frame = 11;
						speed_set(1 * facing, -11, false, false);
						
						//Jump applies a cooldown
						attack_set_cooldown(41, fspec_corrin);
					
						//Release any pinned opponents
						with(obj_player)
							{
							if (state == PLAYER_STATE.is_grabbed && grab_hold_id == other.id)
								{
								state_set(PLAYER_STATE.aerial);
								}
							}
						}
					//Kicks
					else if (stick_tilted(Lstick, DIR.horizontal) || button(INPUT.attack) || button(INPUT.special))
						{
						var _dir = facing;
						if (stick_tilted(Lstick, DIR.horizontal))
							{
							_dir = sign(stick_get_value(Lstick, DIR.horizontal));
							}
						
						//Forward
						if (_dir == facing)
							{
							attack_phase = 6;
							attack_frame = 10;
							anim_frame = 15;
							}
						else
							{
							attack_phase = 7;
							attack_frame = 16;
							anim_frame = 28;
						
							//Turnaround kick has superarmor at the start
							invulnerability_set(INV.superarmor, 14);
							}
						}
					}
			
				//Time out
				if (attack_frame == 0)
					{
					attack_phase = 4;
					attack_frame = 18;
					anim_frame = 11;
				
					//Release any pinned opponents
					with(obj_player)
						{
						if (state == PLAYER_STATE.is_grabbed && grab_hold_id == other.id)
							{
							state_set(PLAYER_STATE.aerial);
							}
						}
					}
				break;
				}
			//Pinned Fall
			case 4:
				{
				friction_gravity(air_friction, grav, max_fall_speed);
			
				//Animation
				if (attack_frame == 14)
					anim_frame = 12;
				if (attack_frame == 10)
					anim_frame = 13;
				if (attack_frame == 5)
					anim_frame = 14;
				
				if (attack_frame == 0)
					{
					attack_stop();
					run = false;
					}
				break;
				}
			//Pinned Jump
			case 5:
				{
				friction_gravity(air_friction, grav, max_fall_speed);
			
				//Animation
				if (attack_frame == 6)
					anim_frame = 12;
				if (attack_frame == 3)
					anim_frame = 14;
				
				if (attack_frame == 0)
					{
					attack_stop();
					run = false;
					}
				break;
				}
			//Pinned Kick
			case 6:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 16;
				if (attack_frame == 5)
					anim_frame = 17;
				if (attack_frame == 2)
					{
					anim_frame = 18;
				
					//Initial Hitbox
					var _hitbox = hitbox_create_melee(36, 16, 0.6, 0.5, 7, 8, 0.9, 6, 40, 2, HITBOX_SHAPE.square, 2);
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					}
			
				if (attack_frame == 0)
					{
					attack_phase = 8;
					attack_frame = 50;
					anim_frame = 19;
				
					//Change position
					x += 46 * facing;
					move_out_of_blocks(facing == 1 ? 180 : 0);
					speed_set(16 * facing, 0, false, false);
				
					//Hitbox
					var _hitbox = hitbox_create_melee(24, 4, 0.5, 0.4, 7, 8, 0.9, 6, 40, 10, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
				
					//Release any pinned opponents
					with(obj_player)
						{
						if (state == PLAYER_STATE.is_grabbed && grab_hold_id == other.id)
							{
							state_set(PLAYER_STATE.aerial);
							}
						}
					}
				break;
				}
			//Pinned Kick Around
			case 7:
				{
				//Animation
				if (attack_frame == 14)
					anim_frame = 29;
				if (attack_frame == 12)
					anim_frame = 30;
				if (attack_frame == 11)
					anim_frame = 31;
				if (attack_frame == 10)
					{
					anim_frame = 32;
				
					//Initial Hitboxes
					var _hitbox = hitbox_create_melee(120, 0, 0.5, 0.6, 7, 11, 0.75, 6, 50, 3, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					var _hitbox = hitbox_create_melee(70, 0, 1.5, 0.4, 7, 11, 0.75, 6, 50, 3, HITBOX_SHAPE.square, 2);
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					}
				if (attack_frame == 8)
					anim_frame = 33;
				if (attack_frame == 6)
					{
					anim_frame = 34;
				
					//Change position
					x += 84 * facing;
					move_out_of_blocks(facing == 1 ? 180 : 0);
					}
				if (attack_frame == 3)
					anim_frame = 35;

				if (attack_frame == 0)
					{
					facing *= -1;
					attack_phase = 8;
					attack_frame = 50;
					anim_frame = 19;
					speed_set(16 * facing, 0, false, false);
				
					//Hitbox
					var _hitbox = hitbox_create_melee(24, 4, 0.5, 0.4, 9, 8, 0.9, 6, 40, 10, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
				
					//Release any pinned opponents
					with(obj_player)
						{
						if (state == PLAYER_STATE.is_grabbed && grab_hold_id == other.id)
							{
							state_set(PLAYER_STATE.aerial);
							}
						}
					}
				break;
				}
			//Kick Active / Endlag
			case 8:
				{
				//Animation
				if (attack_frame > 30)
					{
					anim_frame += 0.2;
					if (anim_frame >= 22)
						anim_frame = 19;
					}
				if (attack_frame == 40)
					{
					//Late Hitbox
					var _hitbox = hitbox_create_melee(16, 4, 0.4, 0.3, 5, 8, 0.4, 4, 45, 15, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_sfx = snd_hit_weak;
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					}
				if (attack_frame == 30)
					anim_frame = 22;
				if (attack_frame == 25)
					anim_frame = 23;
				if (attack_frame == 20)
					anim_frame = 24;
				if (attack_frame == 15)
					anim_frame = 25;
				if (attack_frame == 10)
					anim_frame = 26;
				if (attack_frame == 5)
					anim_frame = 27;
			
				if (attack_frame < 25)
					{
					friction_gravity(0.4, grav, max_fall_speed);
					if (cancel_ground_check()) then return;
					}
				else
					{
					friction_gravity(0.6, 0.1, max_fall_speed);
					}
			
				if (attack_frame == 0)
					{
					attack_stop();
					run = false;
					}
				break;
				}
			}
		}
	
	//Hurtbox
	if (run)
		{
		hurtbox_anim_match(spr_fspec_corrin_hurtbox);
		}

	//Movement
	move();


}
