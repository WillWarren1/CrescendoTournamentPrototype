function uthrow0() {
	//Up Throw for character0
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
				anim_sprite = spr_uthrow0;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 3;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 0)
					{
					anim_frame = 1;
			
					attack_phase++;
					attack_frame = 10;
					hitbox_create_targetbox(32, 8, 0.4, 0.5, 3, 1, 0, 7, 90, 1, HITBOX_SHAPE.square, 0, grabbed_id);
					}
				break;
				}
			//Active -> Active -> Endlag
			case 1:
				{
				if (attack_frame == 8)
					{
					anim_frame = 2;
					var _hitbox = hitbox_create_melee(32, 4, 0.4, 0.8, 3, 15, 0.75, 5, 95, 9, HITBOX_SHAPE.circle, 1);
					_hitbox.hit_sfx = snd_hit_explosion2;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					_hitbox.custom_hitstun = 36;
					}
				
				if (attack_frame == 6)
					anim_frame = 3;
				if (attack_frame = 4)
					anim_frame = 4;
			
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 6;
					}
				break;
				}
			//Finish
			case 2:
				{
				anim_frame = 5;
		
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
