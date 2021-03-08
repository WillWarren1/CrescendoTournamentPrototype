function fspec_cross_slash() {
	//Forward Special
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
				anim_sprite = spr_fspec_cross_slash;
				anim_speed = 0;
				anim_frame = 0;
			
				speed_set(0, 0, false, false);
				attack_frame = 8;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 0)
					{
					anim_frame = 1;
			
					attack_phase++;
					attack_frame = 40;
					var _hitbox = hitbox_create_magnetbox(56, 0, 0.5, 0.5, 1, 4, 0, -1, 5, 4, HITBOX_SHAPE.square, 0);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.hit_sfx = snd_hit_weak;
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
					camera_shake(4);
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				if (attack_frame == 36)
					anim_frame = 2;
				if (attack_frame == 33)
					{
					anim_frame = 3;
					var _hitbox = hitbox_create_magnetbox(56, 0, 0.8, 0.8, 1, 4, 3, -1, 5, 1, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = snd_hit_strong;
					camera_shake(5);
					}
				if (attack_frame == 30)
					{
					anim_frame = 4;
					hitbox_group_reset(1);
					var _hitbox = hitbox_create_magnetbox(56, 0, 1, 1, 1, 4, 0, -1, 5, 1, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_weak;
					_hitbox.hit_sfx = snd_hit_strong2;
					camera_shake(5);
					}
				if (attack_frame == 27)
					{
					anim_frame = 5;
					hitbox_group_reset(1);
					var _hitbox = hitbox_create_magnetbox(56, 0, 1, 1, 1, 4, 3, -1, 5, 1, HITBOX_SHAPE.square, 1);
					_hitbox.hit_fx_style = HIT_FX.slash_medium;
					_hitbox.hit_sfx = snd_hit_strong;
					camera_shake(5);
					}
				if (attack_frame == 24)
					{
					anim_frame = 6;
					var _hitbox = hitbox_create_melee(56, 0, 1, 1, 12, 8, 2, 24, 35, 3, HITBOX_SHAPE.square, 2);
					_hitbox.hit_fx_style = [HIT_FX.slash_strong, HIT_FX.lines];
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.di_angle = 10;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					//VFX
					var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
					_fx.fx_xscale = 2 * facing;
					}
				if (attack_frame <= 20)
					{
					if (!on_ground())
						{
						friction_gravity(0, 0.3, max_fall_speed);
						aerial_drift();
						}
					}
				if (attack_frame == 20)
					anim_frame = 7;
				if (attack_frame == 14)
					anim_frame = 8;
				if (attack_frame == 6)
					anim_frame = 9;
				
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	move();


}
