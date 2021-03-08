function utilt_firebreath() {
	//Upward Tilt
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
				anim_sprite = spr_utilt_firebreath;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 10;
				return;
				}
			//Startup
			case 0:
				{
				//Animation
				if (attack_frame == 7)
					anim_frame = 1;
				if (attack_frame == 4)
					anim_frame = 2;
				
				if (attack_frame == 0)
					{
					anim_frame = 3;
					hitbox_create_melee(24, 4, 0.3, 0.6, 2, 9, 0, 3, 65, 1, HITBOX_SHAPE.square, 0, FLIPPER.toward_player_center_horizontal);
					hitbox_create_melee(14, -24, 0.6, 0.6, 2, 6, 0, 3, 90, 4, HITBOX_SHAPE.circle, 0);
					attack_phase++;
					attack_frame = 10;
					}
				break;
				}
			//Active
			case 1:
				{
				if (attack_frame == 7)
					{
					anim_frame = 4;
					var _hitbox = hitbox_create_magnetbox(22, -44, 0.8, 0.4, 3, 3, 11, -22, 10, 4, HITBOX_SHAPE.rotation, 1);
					hitbox_set_sprite_angle(_hitbox, 60);
					}
				
				if (attack_frame == 4)
					{
					anim_frame = 5;
					var _hitbox = hitbox_create_melee(22, -44, 0.9, 0.4, 3, 5, 0.1, 3, 55, 4, HITBOX_SHAPE.rotation, 2);
					hitbox_set_sprite_angle(_hitbox, 60);
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 6;
					var _hitbox = hitbox_create_melee(22, -44, 1.1, 0.6, 5, 8, 1, 16, 60, 4, HITBOX_SHAPE.rotation, 3);
					hitbox_set_sprite_angle(_hitbox, 60);
					_hitbox.hit_fx_style = [HIT_FX.spin, HIT_FX.normal_weak];
					attack_phase++;
					attack_frame = attack_has_hit() ? 10 : 15;
					}
				break;
				}
			//Endlag
			case 2:
				{
				//Animation
				if (attack_frame == 13)
					anim_frame = 7;
				if (attack_frame == 9)
					anim_frame = 8;
				if (attack_frame = 5)
					anim_frame = 9;

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
