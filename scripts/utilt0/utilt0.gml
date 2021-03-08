function utilt0() {
	//Up Tilt for character0
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame=max(--attack_frame,0);
	friction_gravity(ground_friction,grav,max_fall_speed);
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
				anim_sprite=spr_utilt0;
				anim_speed=0;
				anim_frame=0;
		
				attack_frame=6;
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame==3)
					anim_frame=1;
				
				if (attack_frame==0)
					{
					//Animation
					anim_frame=2;
			
					attack_phase++;
					attack_frame=9;
					var _hitbox = hitbox_create_melee(0,-15,0.5,0.4,6,7,0.45,9,90,9,HITBOX_SHAPE.square,0);
					_hitbox.hitstun_scaling = 3;
					_hitbox.shieldstun_scaling = 0.5;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				//Animation
				if (attack_frame==6)
					{
					anim_frame=3;
					hitbox_create_melee(0,-15,0.5,0.8,6,7,0.45,7,90,9,HITBOX_SHAPE.square,0);
					}
			
				if (attack_frame==0)
					{
					attack_phase++;
					attack_frame= attack_has_hit() ? 4 : 10;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				anim_frame=4;
		
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
