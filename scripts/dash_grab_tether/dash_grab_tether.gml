function dash_grab_tether() {
	//Dash Tether Grab
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame=max(--attack_frame,0);
	friction_gravity(ground_friction/2,grav,max_fall_speed);
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
				anim_sprite=spr_grab_tether;
				anim_speed=0;
				anim_frame=0;
		
				attack_frame=9;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame==0)
					{
					//Animation
					anim_frame=1;
			
					attack_phase++;
					attack_frame=5;
					hitbox_create_grab(20,0,0.5,0.2,40,0,3,HITBOX_SHAPE.square);
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				//Second & longer grab hitbox
				if (attack_frame==4)
					{
					//Animation
					anim_frame=2;
					hitbox_create_grab(52,0,1.2,0.1,40,0,5,HITBOX_SHAPE.square);
					}
				if (attack_frame==0)
					{
					//Animation
					anim_frame=2;
			
					attack_phase++;
					attack_frame=25;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame==14)
					{
					anim_frame=3;
					}
			
				if (attack_frame==0)
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
