///Taunt for character0
function taunt0() {
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;

	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(slide_friction);

	//Cancel in air
	if (run && cancel_air_check()) run = false;

	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_set(spr_taunt0, 0, 0.5);
				attack_frame = (sprite_get_number(spr_taunt0) * 6);
				attack_draw_script = taunt0_draw;
				return;
				}
			case 0:
				{
				anim_angle = dsin(attack_frame * 4) * 4;
				anim_scale = 1 + dcos((attack_frame - 40) * 3) * 0.3;
			
				//Sound
				if (attack_frame == 52)
					{
					audio_play_sound(snd_taunt0, 5, false);
					}
			
				//Taunt canceling
				if (attack_frame < 42)
					{
					if (run && check_walk()) run = false;
					if (run && check_dash()) run = false;
					if (run && check_crouch()) run = false;
					if (run && check_jump()) run = false;
					if (run && check_shield()) run = false;
					if (run && check_grounds()) run = false;
					if (run && check_aerials()) run = false;
					if (run && check_smashes()) run = false;
					if (run && check_specials()) run = false;
					if (run && check_grab()) run = false;
					if (!run && state != PLAYER_STATE.attacking)
						{
						attack_stop_preserve_state();
						}
					}
			
				if (run && attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			default: break;
			}
		}
	move();


}
