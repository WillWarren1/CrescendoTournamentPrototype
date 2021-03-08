function fair_samus() {
	//Forward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_try();
	aerial_drift();
	//Canceling
	if run && cancel_ground_check() run = false;
	var _size = 0.7;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_fair_samus;
				anim_speed = 0;
				anim_frame = 0;
			
				landing_lag = 10;
				speed_set(0, -1, true, true);
				attack_frame = 6;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 2)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 26;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				var _dist = 46;
				var _h = (3 * facing);
				var _v = 3;
				if (attack_frame == 25)
					{
					anim_frame = 2;
					var _dir = 43;
					var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 2, 1, lengthdir_x(_dist, 30) + (hsp * _h), lengthdir_y(_dist, 30) + (vsp * _v), 8, 2, HITBOX_SHAPE.circle, 0, true);
					fx_create_color(spr_fair_samus_burst, 1, 0, 39, x + lengthdir_x(_dist, _dir) * facing, y + lengthdir_y(_dist, _dir), 1.5, _dir);
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					}
				if (attack_frame == 23)
					{
					hitbox_group_reset(0);
					anim_frame = 3;
					if (attack_has_hit())
						{
						var _dir = 43;
						var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 0, 0, lengthdir_x(_dist, 30) + (hsp * _h), lengthdir_y(_dist, 30) + (vsp * _v), 8, 4, HITBOX_SHAPE.circle, 0, true);
						_hitbox.hit_fx_style = -1;
						_hitbox.hit_sfx = -1;
						}
					}
				if (attack_frame == 19)
					{
					hitbox_group_reset(0);
					anim_frame = 4;
					var _dir = 30;
					var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 2, 1, lengthdir_x(_dist, 14) + (hsp * _h), lengthdir_y(_dist, 14) + (vsp * _v), 8, 2, HITBOX_SHAPE.circle, 0, true);
					fx_create_color(spr_fair_samus_burst, 1, 0, 39, x + lengthdir_x(_dist, _dir) * facing, y + lengthdir_y(_dist, _dir), 1.5, _dir);
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					}
				if (attack_frame == 17)
					{
					hitbox_group_reset(0);
					anim_frame = 5;
					if (attack_has_hit())
						{
						var _dir = 30;
						var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 0, 0, lengthdir_x(_dist, 14) + (hsp * _h), lengthdir_y(_dist, 14) + (vsp * _v), 8, 4, HITBOX_SHAPE.circle, 0, true);
						_hitbox.hit_fx_style = -1;
						_hitbox.hit_sfx = -1;
						}
					}
				if (attack_frame == 13)
					{
					hitbox_group_reset(0);
					anim_frame = 6;
					var _dir = 14;
					var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 2, 3, lengthdir_x(_dist, 350) + (hsp * _h), lengthdir_y(_dist, 350) + (vsp * _v), 8, 2, HITBOX_SHAPE.circle, 0, true);
					fx_create_color(spr_fair_samus_burst, 1, 0, 39, x + lengthdir_x(_dist, _dir) * facing, y + lengthdir_y(_dist, _dir), 1.5, _dir);
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					}
				if (attack_frame == 11)
					{
					hitbox_group_reset(0);
					anim_frame = 7;
					if (attack_has_hit())
						{
						var _dir = 14;
						var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 0, 0, lengthdir_x(_dist, 350) + (hsp * _h), lengthdir_y(_dist, 350) + (vsp * _v), 8, 4, HITBOX_SHAPE.circle, 0, true);
						_hitbox.hit_fx_style = -1;
						_hitbox.hit_sfx = -1;
						}
					}
				if (attack_frame == 7)
					{
					hitbox_group_reset(0);
					anim_frame = 8;
					var _dir = 350;
					var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 2, 3, lengthdir_x(_dist, 355) + (hsp * _h), lengthdir_y(_dist, 355) + (vsp * _v), 8, 2, HITBOX_SHAPE.circle, 0, true);
					fx_create_color(spr_fair_samus_burst, 1, 0, 39, x + lengthdir_x(_dist, _dir) * facing, y + lengthdir_y(_dist, _dir), 1.5, _dir);
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					}
				if (attack_frame == 5)
					{
					hitbox_group_reset(0);
					anim_frame = 9;
					if (attack_has_hit())
						{
						var _dir = 350;
						var _hitbox = hitbox_create_magnetbox(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), _size, _size, 0, 0, lengthdir_x(_dist, 355) + (hsp * _h), lengthdir_y(_dist, 355) + (vsp * _v), 18, 2, HITBOX_SHAPE.circle, 0, true);
						_hitbox.hit_fx_style = -1;
						_hitbox.hit_sfx = -1;
						}
					}
				if (attack_frame == 3)
					{
					hitbox_group_reset(0);
					anim_frame = 10;
					var _dir = 335;
					var _hitbox = hitbox_create_melee(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir) - 16, 0.8, 1.3, 5, 7, 1, 12, 45, 3, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
					fx_create_color(spr_fair_samus_burst, 1, 0, 39, x + lengthdir_x(_dist, _dir) * facing, y + lengthdir_y(_dist, _dir), 2, _dir);
					_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					}
				if (attack_frame == 0)
					{
					attack_phase++;
					if (attack_has_hit())
						{
						//Whiff Lag
						attack_frame = 4;
						landing_lag = 2;
						}
					else
						{
						attack_frame = 25;
						//Autocancel
						landing_lag = 6;
						}
					}
				break;
				}
			//Finish
			case 2:
				{
				if (attack_frame = 24)
					anim_frame = 11;
				if (attack_frame = 22)
					anim_frame = 12;
				if (attack_frame = 20)
					anim_frame = 13;
				if (attack_frame = 18)
					anim_frame = 14;
				if (attack_frame = 16)
					anim_frame = 15;
				if (attack_frame = 13)
					anim_frame = 16;
				if (attack_frame = 10)
					anim_frame = 17;
				if (attack_frame = 6)
					anim_frame = 18;
				if (attack_frame = 4)
					anim_frame = 19;
				
				if (attack_frame == 10)
					{
					//Autocancel
					landing_lag = 6;
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
