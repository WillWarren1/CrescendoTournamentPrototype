function dspec_c4() {
	//Down Special
	/*
	- Attaches to players or blocks
	- If there is already a C4 active, using the move explodes it
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
		friction_gravity(air_friction, grav, max_fall_speed);
		aerial_drift();
		}
	
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_dspec_shine;
				anim_frame = 0;
				anim_speed = 0;
			
				//Check if the C4 exists already or not
				var _exists = false;
				with(obj_dspec_c4_bomb)
					{
					if (owner == other.id)
						{
						_exists = true;
						break;
						}
					}
				if (_exists)
					{
					attack_phase = 2;
					attack_frame = 30;
					}
				else
					{
					attack_frame = 4;
					}
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
					attack_phase++;
					attack_frame = 15;
					//Grounded versus aerial
					if (on_ground())
						{
						entity_create(x, bbox_bottom - 1, obj_dspec_c4_bomb, "Player_Front");
						}
					else
						{
						entity_create(x, y, obj_dspec_c4_bomb, "Player_Front");
						}
					}
				break;
				}
			//Finish
			case 1:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame = 3;
				if (attack_frame == 5)
					anim_frame = 4;

				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			//Detonate
			case 2:
				{
				if (attack_frame == 25)
					anim_frame = 1;
				
				if (attack_frame == 20)
					{
					anim_frame = 2;
					//Explode the C4 you own
					with(obj_dspec_c4_bomb)
						{
						var _s = custom_entity_struct;
						var _ids = custom_ids_struct;
						
						if (owner == other.id)
							{
							_s.explosion_time = 10;
						
							if (_ids.attached != noone)
								{
								//Sweetspot
								var _hitbox = hitbox_create_melee(0, 0, 1, 1, 17, 7, 0.6, 15, 90, 5, HITBOX_SHAPE.circle, 0);
								_hitbox.hit_sfx = snd_hit_blast;
								_hitbox.hit_fx_style = HIT_FX.explosion;
						
								//Weak hitbox
								var _hitbox = hitbox_create_melee(0, 0, 2.5, 2.5, 5, 6, 0.5, 10, 90, 10, HITBOX_SHAPE.circle, 0);
								_hitbox.hit_sfx = snd_hit_blast;
								_hitbox.hit_fx_style = HIT_FX.normal_strong;
								}
							else
								{
								//Sweetspot
								var _hitbox = hitbox_create_melee(0, 0, 1, 1, 17, 10, 1, 15, 90, 5, HITBOX_SHAPE.circle, 0);
								_hitbox.hit_sfx = snd_hit_blast;
								_hitbox.hit_fx_style = HIT_FX.explosion;
						
								//Weak hitbox
								var _hitbox = hitbox_create_melee(0, 0, 2.5, 2.5, 5, 8, 0.9, 10, 90, 10, HITBOX_SHAPE.circle, 0);
								_hitbox.hit_sfx = snd_hit_blast;
								_hitbox.hit_fx_style = HIT_FX.normal_strong;
								}
						
							//FX
							var _fx = fx_create(spr_dspec_c4_explosion, 1, 0, 33, x, y, 2, 0);
							_fx.fx_xscale = choose(-2, 2);
							audio_play_sound(snd_hit_blast2, 5, false);
							camera_shake(5);
							break;
							}
						}
					}
				
				if (attack_frame == 13)
					anim_frame = 3;
				if (attack_frame == 7)
					anim_frame = 4;
			
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	move();


}
