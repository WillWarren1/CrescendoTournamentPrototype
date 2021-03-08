function fthrow_spin() {
	//Forward Throw
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(ground_friction, grav, max_fall_speed);
	if run && cancel_air_check() run = false;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_fthrow_spin;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 33;
			
				grabbed_id.grab_hold_y = -2;
			
				//Grant superarmor to avoid interruptions
				hurtbox_inv_set(hurtbox, INV.superarmor, 34);
				with(grabbed_id)
					{
					hurtbox_inv_set(hurtbox, INV.superarmor, 33);
					}
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Automatically animate
				if (attack_frame % 3 == 0)
					anim_frame++;
			
				//Move to front at halfway point
				if (attack_frame == 16)
					{
					with(grabbed_id)
						{
						Player_Move_To_Front();
						}
					}
				
				//Change facing during spin
				if (attack_frame == 22 || attack_frame == 7)
					{
					with(grabbed_id)
						{
						facing *= -1;
						}
					}
			
				//Spin around player
				grabbed_id.grab_hold_x = dcos((attack_frame / 33) * 360) * 45;
				
				//Move the grabbed opponent
				grab_snap_move();
				
				//Final hitbox
				if (attack_frame == 0)
					{
					anim_frame = 11;
					attack_phase++;
					attack_frame = 18;
					speed_set(2 * facing, 0, true, false);
					var _hitbox = hitbox_create_targetbox(45, 0, 1, 1, 10, 11, 0.95, 7, 45, 1, HITBOX_SHAPE.square, 0, grabbed_id);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					_hitbox.knockback_formula = KNOCKBACK_FORMULA.stronger;
					}
				break;
				}
			//Active -> Finish
			case 1:
				{
				Player_Move_To_Back();
				
				//Animation
				if (attack_frame == 17)
					anim_frame = 12;
				if (attack_frame == 15)
					anim_frame = 13;
				if (attack_frame == 12)
					anim_frame = 14;
				if (attack_frame == 9)
					anim_frame = 15;
				if (attack_frame == 6)
					anim_frame = 16;
				if (attack_frame == 3)
					anim_frame = 17;
			
				//Finish
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			}
		}
	//Stay on the ground
	move_grounded();
}