function ftilt_angled() {
	//Forward Tilt
	/*
	- Tilt the left stick up or down to get a different angle
	- The knockback angle, knockback, and scaling are different for each angle
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(ground_friction, grav, max_fall_speed);
	//Canceling
	if run && cancel_air_check() run = false;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_ftilt_angled;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 10;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 4)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					//Check angle
					var _val = stick_get_value(Lstick, DIR.vertical);
					//Up
					if (_val < -0.15)
						{
						anim_frame = 5;
						var _hitbox = hitbox_create_melee(42, -4, 1.2, 0.2, 6, 12, 0.6, 10, 58, 4, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, 20);
						_hitbox.hit_fx_style = HIT_FX.normal_medium;
						}
					//Down
					else if (_val > 0.15)
						{
						anim_frame = 8;
						var _hitbox = hitbox_create_melee(40, 10, 1.2, 0.2, 6, 8, 0.4, 10, 32, 4, HITBOX_SHAPE.rotation, 0);
						hitbox_set_sprite_angle(_hitbox, -15);
						_hitbox.hit_fx_style = HIT_FX.normal_medium;
						}
					//Neutral
					else 
						{
						anim_frame = 2;
						var _hitbox = hitbox_create_melee(42, 8, 1.2, 0.2, 6, 9, 0.5, 10, 45, 4, HITBOX_SHAPE.rotation, 0, FLIPPER.sakurai);
						hitbox_set_sprite_angle(_hitbox, 0);
						_hitbox.hit_fx_style = HIT_FX.normal_medium;
						}
					attack_phase++;
					attack_frame = 12;
					}
				break;
				}
			//Active
			case 1:
				{
				//Animation
				if (attack_frame == 10)
					anim_frame++;
				if (attack_frame = 6)
					anim_frame++;
				
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = attack_has_hit() ? 4 : 10;
					}
				break;
				}
			//Endlag
			case 2:
				{
				//Animation
				anim_frame = 11;

				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			}
		}
	//Movement
	move_grounded();
}