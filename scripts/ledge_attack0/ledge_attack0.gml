function ledge_attack0() {
	//Ledge Attack for character0
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
				anim_sprite = spr_ledge_attack0;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 3;
				hurtbox_inv_set(hurtbox, INV.invincible, 10);
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 0)
					{
					anim_frame = 1;
			
					attack_phase++;
					attack_frame = 3;
					var _hitbox = hitbox_create_melee(30, 10, 1.2, 0.4, 4, 12, 0.2, 4, 35, 3, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				if (attack_frame == 0)
					{
					anim_frame = 2;
			
					attack_phase++;
					attack_frame = attack_has_hit() ? 8 : 12;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 3)
					anim_frame = 3;
			
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