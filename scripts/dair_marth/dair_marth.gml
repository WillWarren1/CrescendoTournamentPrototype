function dair_marth() {
	//Downward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_try();
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
				anim_sprite = spr_nair_ike;
				anim_speed = 0;
				anim_frame = 0;
		
				landing_lag = 14;
				speed_set(0, -1, true, true);
				attack_frame = 8;
				return;
				}
			//Startup
			case 0:
				{
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 1;
			
					attack_phase++;
					attack_frame = 6;
					var _hitbox = hitbox_create_melee(32, -28, 0.6, 0.5, 10, 7, 0.7, 7, 290, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				break;
				}
			//Active
			case 1:
				{
				if (attack_frame == 5)
					{
					//Animation
					anim_frame = 2;
					var _hitbox = hitbox_create_melee(30, 26, 0.7, 0.8, 13, 7, 0.7, 7, 290, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					var _hitbox = hitbox_create_melee(45, 0, 0.7, 0.7, 13, 7, 0.7, 7, 290, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				if (attack_frame == 4)
					{
					//Animation
					anim_frame = 3;
					var _hitbox = hitbox_create_melee(-18, 32, 1, 0.7, 9, 7, 0.7, 7, 290, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				if (attack_frame == 3)
					{
					//Animation
					anim_frame = 4;
					var _hitbox = hitbox_create_melee(-48, -4, 0.6, 0.7, 9, 7, 0.7, 7, 290, 4, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					}
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 5;
			
					attack_phase++;
					attack_frame = attack_has_hit() ? 14 : 30;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 13)
					anim_frame = 6;
				
				//Autocancel
				if (attack_frame < 10)
					{
					landing_lag = 4;
					}
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
