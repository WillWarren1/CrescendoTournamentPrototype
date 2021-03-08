function uspec_rising_attack() {
	//Up Special
	/*
	- Moves upwards quickly. You can drift left or right
	- You can change the direction you are facing right after the first hitbox comes out
	- Hold down on the left stick and press the special button again to use the "falling attack"
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame=max(--attack_frame,0);
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_frame=0;
				anim_sprite=spr_uspec_rising_attack;
				anim_speed=0;
			
				landing_lag=15;
				speed_set(0,0,false,false);
				attack_frame=4;
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame==3)
					anim_frame=1;
				if (attack_frame==2)
					anim_frame=2;
				if (attack_frame==1)
					anim_frame=3;
				
				if (attack_frame==0)
					{
					//Animation
					anim_frame=4;
				
					attack_phase++;
					attack_frame=14;
					hitbox_create_melee(16,2,0.4,0.4,8,4,1.2,15,40,1,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
					hitbox_create_melee(16,-8,0.3,0.4,7,7,0.6,1,80,6,HITBOX_SHAPE.square,0);
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				//Grab ledges
				if check_ledge_grab() return;
				//Drift while rising
				aerial_drift();
			
				if (attack_frame==13)
					{
					change_facing();
					speed_set(4*facing,-30,false,false);
					}
				if (attack_frame==8)
					{
					hitbox_create_melee(20,-20,0.3,0.3,8,7,1.5,30,70,2,HITBOX_SHAPE.circle,0);
					hitbox_create_melee(18,-8,0.3,0.5,5,5,0.5,1,80,18,HITBOX_SHAPE.square,0);
					speed_set(0,-2,true,false);
					}
				//Animation
				if (attack_frame==10)
					anim_frame=5;
				if (attack_frame==7)
					anim_frame=6;
				if (attack_frame==0)
					{
					//vsp=-3;
					attack_phase++;
					attack_frame=22;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Grab ledges
				if check_ledge_grab() return;
				//Animation
				if (attack_frame==7)
					anim_frame=7;
				if (attack_frame==4)
					anim_frame=8;
			
				//Cancel with Down Special
				if (button(INPUT.special,12) && stick_tilted(Lstick,DIR.down))
					{
					//Goes to the script directly
					attack_start(dspec_falling_attack);
					}
				else
				if (attack_frame==0)
					{
					attack_stop(PLAYER_STATE.helpless);
					}
				break;
				}
			}
		}
	//Movement
	move();
}