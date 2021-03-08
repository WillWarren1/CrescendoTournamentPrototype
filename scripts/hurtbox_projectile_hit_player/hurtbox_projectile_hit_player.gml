///@func hurtbox_projectile_hit_player(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
function hurtbox_projectile_hit_player() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
			//Register hit
			_hitbox.has_hit = true;
			array_push(_hitbox.hitbox_group_array, id);
			//Knockback and damage
			apply_damage(id, _hitbox.damage);
			if (is_dead()) then exit;
			//Hitstun stored for later use when the hitlag ends
			stored_hitstun = calculate_hitstun(_hitbox.base_knockback, weight_multiplier, _hitbox.damage, _hitbox.knockback_scaling, hitstun_multiplier, _hitbox.custom_hitstun);
			//Stored knockback state
			stored_state = _hitbox.knockback_state;
			//ASDI
			asdi_multiplier = _hitbox.asdi_multiplier;
			//Drift DI
			drift_di_multiplier = _hitbox.drift_di_multiplier;
			//Max DI
			di_angle = _hitbox.di_angle;
			//Techable
			can_tech = _hitbox.techable;
			//Change state
			attack_stop_ext(PLAYER_STATE.in_hitlag, false);
			//Placeholder angle (in case the knockback is zero)
			var _calc_angle = _hitbox.angle;
			//Knockback and hitlag
			var _total_kb = 0, _total_hl = 0;
			_total_kb = calculate_knockback(damage, _hitbox.damage, weight_multiplier, _hitbox.knockback_scaling, _hitbox.base_knockback, _hitbox.knockback_formula);
			_total_hl = calculate_hitlag(_hitbox.base_hitlag, damage, _hitbox.hitlag_scaling);
			//Calculate angle based on flipper
			if (on_ground()) then _calc_angle = apply_angle_flipper(_hitbox.grounded_angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			else _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			apply_sakurai_angle(_hitbox.angle_flipper, _total_kb);
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, _calc_angle, _hitbox, _total_kb);
			hit_sfx_play(_hitbox.hit_sfx);
			//Check for finishing blow
			if (_hitbox.base_knockback != 0)
				{
				if (is_finishing_blow(_total_kb, x, y, _calc_angle, stored_hitstun, id) && _hitbox.background_clear_allow)
					{
					_total_hl += finishing_blow_hitlag_increase;
					var _fx = fx_create(spr_hit_final_hit, 1, 0, 34, x, y, 2, irandom(360));
					_fx.fx_blend = c_black;
					//Final Hit fade
					background_clear_activate(_total_hl, palette_color_get(_hitbox.owner.palette, 0));
					}
				}
			apply_knockback(_calc_angle, _total_kb, _total_hl);
			//Turn to face the attacker
			if (hit_turnaround)
				{
				facing = abs(angle_difference(_calc_angle, 0)) < 90 ? -1 : 1;
				}
			//Projectiles do not give any hitlag to the owner
			//Projectiles destroy on contact
			if (_hitbox.destroy_on_hit)
				{
				_hitbox.destroy = true;
				}
			break;
		case INV.invincible:
			//No knockback or damage or hitlag
			//Do not add the player to the hitbox group array
			//This is because the opponent should be hit even if their invincibility runs out mid-attack
			break;
		case INV.superarmor:
			//Register hit
			_hitbox.has_hit = true;
			array_push(_hitbox.hitbox_group_array, id);
			//Just damage; no state change
			apply_damage(id, _hitbox.damage);
			if (is_dead()) then exit;
			//Hitlag
			self_hitlag_frame = calculate_hitlag(_hitbox.base_hitlag, damage, _hitbox.hitlag_scaling);
			//Calculations
			var _total_kb = calculate_knockback(damage, _hitbox.damage, weight_multiplier, _hitbox.knockback_scaling, _hitbox.base_knockback);
			var _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, _calc_angle, _hitbox, _total_kb);
			hit_sfx_play(_hitbox.hit_sfx);
			//Projectiles destroy on contact
			if (_hitbox.destroy_on_hit)
				{
				_hitbox.destroy = true;
				}
			break;
		case INV.shielding:
			//Register hit
			_hitbox.has_been_blocked = true;
			array_push(_hitbox.hitbox_group_array, id);
			//Deplete other's shield
			shield_hp -= _hitbox.damage;
			shield_stun += calculate_shieldstun(_hitbox.damage, _hitbox.shieldstun_scaling);
			//Pushback
			if (shield_pushback_enable)
				{
				//Angle
				_calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, s_angle_knockback_threshold, _hitbox.facing);
				//Setting speed
				hsp = calculate_shield_pushback(_hitbox.damage, _calc_angle, 1);
				}
			//Projectiles destroy on contact
			if (_hitbox.destroy_on_hit)
				{
				_hitbox.destroy = true;
				}
			//Effects
			hit_fx_style_create(HIT_FX.shield_projectile, 0, _hitbox, 0);
			hit_sfx_play(_hitbox.hit_sfx);
			break;
		case INV.powershielding:
			//Register hit
			_hitbox.has_been_blocked = true;
			array_push(_hitbox.hitbox_group_array, id);
			//Change ownership
			_hitbox.owner = id;
			//Reflect
			_hitbox.hsp = -_hitbox.hsp * parry_reflect_speed_multiplier;
			_hitbox.vsp = -_hitbox.vsp * parry_reflect_speed_multiplier;
			_hitbox.facing = -_hitbox.facing;
			//Target can cancel their shield with no lag
			state_frame = 0;
			//Effects
			fx_create(spr_hit_powershield, 1, 0, 12, x, y, 1, choose(-1, 1), "FX_Layer_Below");
			fx_create_action_lines(10, x, y, irandom(10));
			audio_play_sound(snd_parry, 0, false);
			break;
		case INV.parry:
			//Register hit
			_hitbox.has_been_blocked = true;
			array_push(_hitbox.hitbox_group_array, id);
			//Change ownership
			_hitbox.owner = id;
			//Trigger the parry
			parry_trigger(_hitbox, false, id);
			//Reflect
			_hitbox.hsp = -_hitbox.hsp * parry_reflect_speed_multiplier;
			_hitbox.vsp = -_hitbox.vsp * parry_reflect_speed_multiplier;
			_hitbox.facing = -_hitbox.facing;
			break;
		case INV.parry_ult:
			//Register hit
			_hitbox.has_been_blocked = true;
			array_push(_hitbox.hitbox_group_array, id);
			//Destroy the hitbox
			_hitbox.destroy = true;
			//Activate the player's parry
			parry_trigger_ult(_hitbox, false, id);
			break;
		case INV.counter:
			//Register hit
			_hitbox.has_been_blocked = true;
			array_push(_hitbox.hitbox_group_array, id);
			//Active the player's counter
			if (script_exists(attack_script))
				{
				script_execute(attack_script, PHASE.counter, _hitbox);
				}
			break;
		}
}