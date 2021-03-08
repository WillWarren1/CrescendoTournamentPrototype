///@func hurtbox_melee_hit_player(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
function hurtbox_melee_hit_player() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
			hitbox_register_hit(_hitbox);
			//Knockback and damage
			apply_damage(id, _hitbox.damage);
			if (is_dead()) then return;
			//Hitstun stored for later use when the hitlag ends
			stored_hitstun = calculate_hitstun(_hitbox.base_knockback, weight_multiplier, _hitbox.damage, _hitbox.knockback_scaling, hitstun_multiplier * _hitbox.hitstun_scaling, _hitbox.custom_hitstun);
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
			//Knockback and hitlag
			var _total_kb = 0, _total_hl = 0;
			_total_kb = calculate_knockback(damage, _hitbox.damage, weight_multiplier, _hitbox.knockback_scaling, _hitbox.base_knockback, _hitbox.knockback_formula);
			_total_hl = calculate_hitlag(_hitbox.base_hitlag, damage, _hitbox.hitlag_scaling);
			//Change state
			attack_stop_ext(PLAYER_STATE.in_hitlag, false);
			//Calculate angle based on flipper
			var _calc_angle = 90;
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
					background_clear_activate(_total_hl, palette_color_get(_hitbox.owner.palette, 0));
					}
				}
			apply_knockback(_calc_angle, _total_kb, _total_hl + _hitbox.extra_hitlag);
			//Turn to face the attacker
			if (hit_turnaround)
				{
				facing = abs(angle_difference(_calc_angle, 0)) < 90 ? -1 : 1;
				}
			//Attacking player gets the same hitlag
			_hitbox.owner.self_hitlag_frame = _total_hl;
			break;
		case INV.invincible:
			//No knockback or damage or hitlag
			//Do not add the player to the hitbox group array
			//This is because the opponent should be hit even if their invincibility runs out mid-attack
			break;
		case INV.superarmor:
			hitbox_register_hit(_hitbox);
			//Just damage; no state change
			apply_damage(id, _hitbox.damage);
			if (is_dead()) then exit;
			//Hitlag
			_hitbox.owner.self_hitlag_frame = _hitbox.base_hitlag;
			self_hitlag_frame = _hitbox.base_hitlag;
			//Knockback and hitlag
			var _total_kb = calculate_knockback(damage, _hitbox.damage, weight_multiplier, _hitbox.knockback_scaling, _hitbox.base_knockback);
			//Calculate angle based on flipper
			var _calc_angle = 90;
			if (on_ground()) then _calc_angle = apply_angle_flipper(_hitbox.grounded_angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			else _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, _calc_angle, _hitbox, _total_kb);
			hit_sfx_play(_hitbox.hit_sfx);
			break;
		case INV.shielding:
			hitbox_register_hit(_hitbox, true);
			//Deplete shield
			shield_hp -= _hitbox.damage;
			shield_stun += calculate_shieldstun(_hitbox.damage, _hitbox.shieldstun_scaling);
			//Pushback
			if (shield_pushback_enable)
				{
				//Angle
				var _calc_angle = 90;
				if (on_ground()) then _calc_angle = apply_angle_flipper(_hitbox.grounded_angle, _hitbox.angle_flipper, _hitbox.owner, id, s_angle_knockback_threshold, _hitbox.facing);
				else _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, s_angle_knockback_threshold, _hitbox.facing);
				//Setting speed
				hsp = calculate_shield_pushback(_hitbox.damage, _calc_angle, 1);
				}
			//Hitlag
			var _hitlag = ceil(_hitbox.base_hitlag * shield_hitlag_multiplier);
			_hitbox.owner.self_hitlag_frame = _hitlag;
			self_hitlag_frame = _hitlag;
			//Effects
			hit_fx_style_create(HIT_FX.shield, 0, _hitbox, 0);
			hit_sfx_play(_hitbox.hit_sfx);
			break;
		case INV.powershielding:
			hitbox_register_hit(_hitbox, true);
			//Target can cancel their shield with no lag
			state_frame = 0;
			//Hitlag
			_hitbox.owner.self_hitlag_frame = _hitbox.base_hitlag;
			//Effects
			fx_create(spr_hit_powershield, 1, 0, 12, mean(_hitbox.x, x), mean(_hitbox.y, y), 1, choose(-1, 1), "FX_Layer_Below");
			fx_create_action_lines(10, x, y, irandom(10));
			audio_play_sound(snd_parry, 0, false);
			break;
		case INV.parry:
			hitbox_register_hit(_hitbox, true);
			//Activate the player's parry
			parry_trigger(_hitbox, true, id);
			break;
		case INV.parry_ult:
			hitbox_register_hit(_hitbox, true);
			//Activate the player's parry
			parry_trigger_ult(_hitbox, true, id);
			break;
		case INV.counter:
			hitbox_register_hit(_hitbox);
			//Active the player's counter
			if (script_exists(attack_script))
				{
				script_execute(attack_script, PHASE.counter, _hitbox);
				}
			break;
		}


}
