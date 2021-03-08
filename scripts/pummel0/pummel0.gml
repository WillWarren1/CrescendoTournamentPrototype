function pummel0() {
	//Pummel for character0
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
				anim_sprite = spr_pummel0;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 3;
				return;
				}
			//Pummel Startup
			case 0:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
					attack_phase++;
					attack_frame = 3;
					var _hitbox = hitbox_create_targetbox(20, 5, 0.5, 0.3, 1, 5, 0.1, 8, 75, 4, HITBOX_SHAPE.circle, 0, grabbed_id);
					_hitbox.knockback_state = PLAYER_STATE.is_grabbed;
					_hitbox.hit_sfx = snd_hit_slap2;
					}
				break;
				}
			//Pummel Active
			case 1:
				{
				if (attack_frame == 2)
					anim_frame = 3;
				
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 1;
					}
				break;
				}
			//Pummel Endlag
			case 2:
				{
				anim_frame = 4;
			
				//Grab is released even during pummels
				if (state_frame == 0)
					{
					grab_release();
					break;
					}
			
				if (attack_frame == 0)
					{
					var _grab_time = state_frame;
					attack_stop(PLAYER_STATE.grabbing);
					state_frame = _grab_time;
					//No need to reset the control stick after a pummel
					throw_stick_has_reset = true;
					}
				break;
				}
			}
		}
	//Movement
	move_grounded();
	
	//Move the grabbed opponent
	grab_snap_move();
}
