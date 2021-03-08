function nair_toon_link() {
	//Neutral Aerial
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
				anim_sprite = spr_nair_toon_link;
				anim_speed = 0;
				anim_frame = 0;
		
				landing_lag = 6;
				speed_set(0, -1, true, true);
				attack_frame = 5;
				return;
				}
			//First Hit
			case 0:
				{
				//Animation
				if (attack_frame == 4)
					anim_frame = 1;
				if (attack_frame == 2)
					anim_frame = 2;
				
				if (attack_frame == 0)
					{
					anim_frame = 3;
			
					attack_phase++;
					attack_frame = 7;
					var _hitbox = hitbox_create_melee(32, 2, 1, 0.4, 8, 6, 0.9, 9, 40, 2, HITBOX_SHAPE.rotation, 0, FLIPPER.sakurai);
					hitbox_set_sprite_angle(_hitbox, 340);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					}
				break;
				}
			//Second Hit
			case 1:
				{
				//Animation
				if (attack_frame == 5)
					anim_frame = 4;
				if (attack_frame == 3)
					anim_frame = 5;
				
				if (run && attack_frame == 0)
					{
					anim_frame = 6;
				
					attack_phase++;
					attack_frame = 22;
					var _hitbox = hitbox_create_melee(-30, -2, 1, 0.4, 7, 7, 0.9, 9, 40, 5, HITBOX_SHAPE.rotation, 1, FLIPPER.sakurai_reverse);
					hitbox_set_sprite_angle(_hitbox, 20);
					_hitbox.hit_sfx = snd_hit_weak2;
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 17)
					anim_frame = 7;
				if (attack_frame == 11)
					anim_frame = 8;
				if (attack_frame == 5)
					anim_frame = 9;
				
				//Autocancel
				if (attack_frame > 16)
					landing_lag = 4;
				else
					landing_lag = 10;

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