function dash_grab0() {
	//Normal Grab for character0
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(slide_friction, grav, max_fall_speed);
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
				anim_sprite = spr_grab0;
				anim_speed = 0;
				anim_frame = 0;
				speed_set(1 * facing, 0, true, false);
		
				attack_frame = 9;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame = 3)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = 24;
					hitbox_create_grab(20, 4, 0.8, 0.6, 35, 0, 3, HITBOX_SHAPE.square);
					}
				break;
				}
			//Active -> Finish
			case 1:
				{
				//Animation
				if (attack_frame == 20)
					{
					anim_frame = 3;
					}
				if (attack_frame == 13)
					{
					anim_frame = 4;
					}
				if (attack_frame == 6)
					{
					anim_frame = 5;
					}
			
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
