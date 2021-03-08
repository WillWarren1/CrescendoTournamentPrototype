function uair_cloud() {
	//Up Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
	allow_hitfall();
	aerial_drift();
	//Canceling
	if run && cancel_ground_check() run = false;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_uair_cloud;
				anim_speed = 0;
				anim_frame = 0;
			
				landing_lag = 12;
				speed_set(0, -1, true, true);
				attack_frame = 8;
				return;
				}
			//Startup / Active
			case 0:
				{
				if (attack_frame == 4)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
					attack_phase++;
					attack_frame = 19;
					//Initial hit
					var _hitbox = hitbox_create_melee(36, -28, 1, 0.9, 10*beat_modifier, 7, 0.9, 10, 82, 3, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = snd_hit_weak2;
					_hitbox.hitstun_scaling = 1.5;
					}
				break;
				}
			//Active
			case 1:
				{
				if (attack_frame == 17)
					anim_frame = 3;

				if (attack_frame == 16)
					{
					anim_frame = 4;
					//Long lasting hit
					var _hitbox = hitbox_create_melee(40, -32, 0.9, 0.3, 8, 5, 0.8, 4, 82, 6, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
				
				if (attack_frame == 0)
					{
					anim_frame = 5;
					attack_phase++;
					//Whiff lag
					attack_frame = attack_has_hit() ? 3 : 10;
					//Autocancel
					landing_lag = 4;
					}
				
				//Autocancel on hit
				if (attack_has_hit())
					{
					landing_lag = 4;
					}
				break;
				}
			//Endlag / Finish
			case 2:
				{
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