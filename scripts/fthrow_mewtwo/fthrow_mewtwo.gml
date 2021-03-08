function fthrow_mewtwo() {
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
				anim_sprite = spr_fthrow_mewtwo;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 30;

				//Grant superarmor to avoid interruptions
				hurtbox_inv_set(hurtbox, INV.superarmor, 30);
				
				speed_set(0, 0, false, false);
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Launch hitbox
				if (attack_frame == 29)
					{
					anim_frame = 1;
					var _hitbox = hitbox_create_targetbox(45, 0, 1, 1, 3, 11, 0.05, 5, 45, 1, HITBOX_SHAPE.square, 0, grabbed_id);
					_hitbox.drift_di_multiplier = 0.5;
					_hitbox.di_angle = 0;
					_hitbox.techable = false;
					_hitbox.hit_fx_style = [HIT_FX.normal_strong];
					_hitbox.hit_sfx = [snd_hit_strong, snd_hit_strong2];
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
					
				//Animation
				if (attack_frame == 21 ||
					attack_frame == 18 ||
					attack_frame == 12 ||
					attack_frame == 9)
					{
					anim_frame++;
					}
					
				//Projectiles
				if (attack_frame == 24 || attack_frame == 15 || attack_frame == 6)
					{
					anim_frame++;
					var _dir = 30;
					var _hsp = lengthdir_x(18, _dir);
					var _vsp = lengthdir_y(18, _dir);
					var _projectile = hitbox_create_projectile(32, -4, 0.4, 0.4, 3, 7, 0.85, 50, 60, HITBOX_SHAPE.circle, _hsp, _vsp);
					if (facing == -1) then _dir = 180 - _dir;
					hitbox_set_overlay_sprite(_projectile, spr_fthrow_mewtwo_projectile, 0, 1, 2, _dir, c_white, 1, 1);
					_projectile.destroy_on_blocks = true;
					_projectile.base_hitlag = 10;
					_projectile.hit_fx_style = [HIT_FX.spin, HIT_FX.magic];
					_projectile.hit_sfx = snd_hit_crit;
					if (attack_frame != 6)
						{
						_projectile.background_clear_allow = false;
						}
					}
					
				if (attack_frame == 4)
					anim_frame = 9;
				if (attack_frame == 2)
					anim_frame = 10;
				if (attack_frame == 1)
					anim_frame = 11;
					
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