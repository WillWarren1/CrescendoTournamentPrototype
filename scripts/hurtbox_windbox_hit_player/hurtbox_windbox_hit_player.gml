///@func hurtbox_windbox_hit_player(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
function hurtbox_windbox_hit_player() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
		case INV.superarmor:
			if (_hitbox.windbox_multihit)
				{
				if (!array_contains(_hitbox.owner.hitbox_groups[@ _hitbox.hitbox_group], _hitbox))
					{
					hitbox_register_hit(_hitbox);
					}
				}
			else
				{
				hitbox_register_hit(_hitbox);
				}
			//Damage
			apply_damage(id, _hitbox.damage);
			if (is_dead()) then return;
			//Knockback
			var _total_kb = calculate_knockback(damage, _hitbox.damage, weight_multiplier, _hitbox.knockback_scaling, _hitbox.base_knockback);
			//Calculate angle based on flipper
			var _calc_angle = 90;
			if (on_ground()) then _calc_angle = apply_angle_flipper(_hitbox.grounded_angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			else _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			//Knockback is applied, unless there is zero knockback
			if (_hitbox.base_knockback != 0)
				{
				//Windbox push
				if (_hitbox.windbox_push)
					{
					//Manually move the player
					move_x(round(lengthdir_x(_total_kb, _calc_angle)));
					//Check if it is lifting the player
					if ((on_ground() && _hitbox.windbox_lift) || !on_ground())
						{
						move_y(false, round(lengthdir_y(_total_kb, _calc_angle)));
						}
					}
				//Windbox speed boost
				else
					{
					var _hsp = lengthdir_x(_total_kb, _calc_angle);
					var _vsp = lengthdir_y(_total_kb, _calc_angle);
					//No lift
					if (on_ground() && !_hitbox.windbox_lift)
						{
						speed_set(_hsp, 0, _hitbox.windbox_accelerate, true);
						//Max speed
						if (abs(hsp) > _hitbox.windbox_max_speed)
							{
							hsp = clamp(hsp, -_hitbox.windbox_max_speed, _hitbox.windbox_max_speed);
							}
						}
					else
						{
						//Set the speed
						speed_set(_hsp, _vsp, _hitbox.windbox_accelerate, _hitbox.windbox_accelerate);
						//Maximum speed
						if (_hitbox.windbox_max_speed > 0 && point_distance(0, 0, hsp,vsp) > _hitbox.windbox_max_speed)
							{
							var _dir = point_direction(0, 0, hsp, vsp);
							speed_set(lengthdir_x(_hitbox.windbox_max_speed, _dir), lengthdir_y(_hitbox.windbox_max_speed, _dir), false, false);
							}
						}
					}
				}
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, _calc_angle, _hitbox, _total_kb);
			hit_sfx_play(_hitbox.hit_sfx);
			break;
		case INV.invincible:
			//No knockback or damage or hitlag
			//Do not add the player to the hitbox group array
			//This is because the opponent should be hit even if their invincibility runs out mid-attack
			break;
		case INV.parry:
		case INV.parry_ult:
		case INV.counter:
		case INV.shielding:
		case INV.powershielding:
			if (_hitbox.windbox_multihit)
				{
				if (!array_contains(_hitbox.owner.hitbox_groups[@ _hitbox.hitbox_group], _hitbox))
					{
					hitbox_register_hit(_hitbox, true);
					}
				}
			else
				{
				hitbox_register_hit(_hitbox, true);
				}
			//Knockback
			var _total_kb = calculate_knockback(damage, _hitbox.damage, weight_multiplier, _hitbox.knockback_scaling, _hitbox.base_knockback);
			//Calculate angle based on flipper
			var _calc_angle = 90;
			if (on_ground()) then _calc_angle = apply_angle_flipper(_hitbox.grounded_angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			else _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			//Knockback is applied, unless there is zero knockback
			if (_hitbox.base_knockback != 0)
				{
				//Windbox push
				if (_hitbox.windbox_push)
					{
					//Manually move the player
					move_x(lengthdir_x(_total_kb, _calc_angle));
					//Don't lift the player
					if (!on_ground())
						{
						move_y(false, lengthdir_y(_total_kb, _calc_angle));
						}
					}
				//Windbox speed boost
				else
					{
					var _hsp = lengthdir_x(_total_kb, _calc_angle);
					var _vsp = lengthdir_y(_total_kb, _calc_angle);
					//No lift on ground
					if (on_ground())
						{
						speed_set(_hsp, 0, _hitbox.windbox_accelerate, true);
						//Max speed
						if (abs(hsp) > _hitbox.windbox_max_speed)
							{
							hsp = clamp(hsp, -_hitbox.windbox_max_speed, _hitbox.windbox_max_speed);
							}
						}
					else
						{
						//Set the speed
						speed_set(_hsp, _vsp, _hitbox.windbox_accelerate, _hitbox.windbox_accelerate);
						//Maximum speed
						if (_hitbox.windbox_max_speed > 0 && point_distance(0, 0, hsp,vsp) > _hitbox.windbox_max_speed)
							{
							var _dir = point_direction(0, 0, hsp, vsp);
							speed_set(lengthdir_x(_hitbox.windbox_max_speed, _dir), lengthdir_y(_hitbox.windbox_max_speed, _dir), false, false);
							}
						}
					}
				}
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, _calc_angle, _hitbox, _total_kb);
			hit_sfx_play(_hitbox.hit_sfx);
			break;
		}


}
