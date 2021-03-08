function fthrow0() {
	//Forward Throw for character0
	/*
	- Jumps up with the opponent, then slams them into the ground
	- Press the attack button during the rise to flip kick off the opponent
	- You can do this at the edge of the stage to knock out both you and your opponent
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_fthrow0;
				anim_speed = 0;
				anim_frame = 0;
			
				//Jump up in an arc
				speed_set(4 * facing, -12, false, false);
				attack_phase = 0;
				return;
				}
			//Jump off side
			case 0:
				{
				//Animation
				if (vsp < -10)
					anim_frame = 1;
				else if (vsp < -5)
					anim_frame = 2;
				else if (vsp < 0)
					anim_frame = 3;
				else if (vsp < 5)
					anim_frame = 4;
				else if (vsp < 10)
					anim_frame = 5;
				
				//Friction and gravity
				friction_gravity(air_friction, grav, 30);
				//Hold the grabbed player
				with(grabbed_id)
					{
					//Manually move the target
					grab_hold_enable = false;
					//speed_set(0, 0, false, false);
					x = other.x + (16 * other.facing);
					y = other.y + ceil(other.vsp * 1.5);
					}
				
				//Cancel on ground
				if (on_ground())
					{
					//Animation
					anim_frame = 11;
				
					var _hitbox = hitbox_create_melee(32, 0, 0.4, 0.4, 12, 13, 0.6, 15, 80, 1, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = [HIT_FX.explosion, HIT_FX.normal_strong];
					_hitbox.hit_sfx = snd_hit_explosion2;
					attack_frame = 10;
					attack_phase = 1;
					break;
					}
				
				//Manual cancel (only at the start)
				if (vsp <= 0 && button(INPUT.attack, buff))
					{
					//Animation
					anim_frame = 6;
				
					var _hitbox = hitbox_create_targetbox(24, 24, 2, 2, 9, 9, 0.7, 30, 40, 1, HITBOX_SHAPE.circle, 0, grabbed_id);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					speed_set(-5 * facing, -9, false, false);
					attack_frame = 15;
					attack_phase = 2;
					break;
					}
				break;
				}
			//Grounded cancel
			case 1:
				{
				friction_gravity(ground_friction);
				//Animation
				if (attack_frame == 8)
					anim_frame = 12;
				if (attack_frame == 6)
					anim_frame = 13;
				if (attack_frame == 3)
					anim_frame = 14;
				
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.idle);
					}
				break;
				}
			//Manual Cancel
			case 2:
				{
				friction_gravity(air_friction, grav);
				//Animation (flip)
				if (attack_frame == 13)
					anim_frame = 7;
				if (attack_frame == 10)
					anim_frame = 8;
				if (attack_frame == 6)
					anim_frame = 9;
				if (attack_frame == 3)
					anim_frame = 10;
				
				if (attack_frame == 0)
					{
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}
			}
		}
	//Movement
	move();


}
