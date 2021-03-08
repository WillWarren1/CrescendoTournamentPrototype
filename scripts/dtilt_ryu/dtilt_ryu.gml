function dtilt_ryu() {
	//Down Tilt
	/*
	- Tap for the light version, hold for the heavy version
	- The light version cancels into specials on hit
	- You can buffer another dtilt during the endlag
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
				anim_sprite = spr_dtilt_ryu;
				anim_frame = 0;
				anim_speed = 0;
		
				attack_frame = 6;
				return;
				}
			//Startup
			case 0:
				{
				//Light
				if (attack_frame <= 4 && !button_hold(INPUT.attack))
					{
					anim_frame = 1;
					attack_phase = 1;
					attack_frame = 12;
					var _hitbox = hitbox_create_melee(24, 16, 1.1, 0.3, 2, 3, 0.1, 3, 55, 2, HITBOX_SHAPE.square, 0);
					_hitbox.techable = false;
					}
				//Heavy
				else if (attack_frame == 0)
					{
					anim_frame = 1;
					attack_phase = 2;
					attack_frame = 21;
					var _hitbox = hitbox_create_melee(24, 16, 1.1, 0.3, 12, 9, 0.3, 10, 45, 4, HITBOX_SHAPE.square, 0, FLIPPER.sakurai);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.techable = false;
					_hitbox.hit_sfx = snd_hit_strong2;
					}
				break;
				}
			//Light Endlag
			case 1:
				{
				//Animation
				if (attack_frame == 11)
					anim_frame = 2;
				if (attack_frame == 9)
					anim_frame = 3;
				if (attack_frame == 7)
					anim_frame = 4;
				if (attack_frame == 4)
					anim_frame = 5;
				
				if (attack_has_hit())
					{
					//Special cancel
					if (check_specials()) then return;
					//Whiff lag
					if (attack_frame > 5) then attack_frame = 5;
					}
				
				if (attack_frame == 0)
					{
					//Buffered Dtilt
					if (button_hold(INPUT.attack) && stick_tilted(Lstick, DIR.down))
						{
						attack_start(my_attacks[? "Dtilt"]);
						run = false;
						}
					else
						{
						attack_stop(PLAYER_STATE.crouching);
						run = false;
						}
					}
				break;
				}
			//Heavy Endlag
			case 2:
				{
				//Animation
				if (attack_frame == 19)
					anim_frame = 2;
				if (attack_frame == 15)
					anim_frame = 3;
				if (attack_frame == 10)
					anim_frame = 4;
				if (attack_frame == 5)
					anim_frame = 5;
			
				if (attack_frame == 0)
					{
					attack_stop();
					run = false;
					}
				break;
				}
			}
		}
	//Movement
	move_grounded();

	//Match hurtbox
	if (run)
		{
		hurtbox_anim_match();
		}


}
