function fair_mario() {
	//Forward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
	allow_hitfall();
	aerial_drift();
	//Cancels
	if run && cancel_ground_check()	run = false;
	//Main Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				anim_sprite = spr_fair_mario;
				anim_frame = 0;
				anim_speed = 0;
				landing_lag = 10;
				speed_set(0, -1, true, true);
				attack_frame = 14;
				
				//Shine VFX
				fx_create(spr_shine_attack, 1, 0, 7, x + (-32 * facing), y, 1, irandom(360));
				return;
				}
			//Active
			case 0:
				{
				//Animation
				if (attack_frame == 9)
					anim_frame = 1;
				if (attack_frame == 4)
					anim_frame = 2;
				if (attack_frame = 2)
					anim_frame = 3;
  
				//Strong hitbox
				if (attack_frame == 0)
					{
					anim_frame = 4;
					//Creates both the spiking sweetspot and the sourspot
					var _hitbox = hitbox_create_melee(26, 16, 0.9, 0.5, 13, 7.5, 0.8, 8, 300, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_strong;
					_hitbox.hit_sfx = snd_hit_strong;
					_hitbox.shieldstun_scaling = 0.5;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
				
					var _hitbox = hitbox_create_melee(26, -8, 0.8, 0.9, 10, 10, 0.35, 6, 45, 2, HITBOX_SHAPE.circle, 0);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.shieldstun_scaling = 0.5;
					_hitbox.hitstun_scaling = 0.4;
					//Next phase
					attack_phase++;
					attack_frame = 10;
					}
				break;
				}
			//Endlag
			case 1:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 5;
				if (attack_frame == 6)
					anim_frame = 6;
				if (attack_frame == 4)
					anim_frame = 7;
	
				if (attack_frame == 0)
					{
					anim_frame = 8;
					
					//Whiff lag
					attack_phase++;
					attack_frame = attack_has_hit() ? 15 : 24;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (!attack_has_hit())
					{
					if (attack_frame == 20)
						anim_frame = 9;
					if (attack_frame == 16)
						anim_frame = 10;	
					if (attack_frame == 12)
						anim_frame = 11;
					if (attack_frame == 7)
						anim_frame = 12;	
					if (attack_frame == 3)
						anim_frame = 13;	
					}
				else
					{
					if (attack_frame == 10)
						anim_frame = 12;
					if (attack_frame == 5)
						anim_frame = 13;
					}
					
				if (attack_frame == 0)
					{
					//Revert back to the original state
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}
			}
		}
	//Movement
	move();


}
