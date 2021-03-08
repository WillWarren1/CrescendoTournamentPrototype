///@func hurtbox_magnetbox_hit_player(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
function hurtbox_magnetbox_hit_player() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
			hitbox_register_hit(_hitbox);
			//Knockback and damage
			apply_damage(id, _hitbox.damage);
			if (is_dead()) then exit;
			//Change state
			attack_stop_ext(PLAYER_STATE.magnetized, false);
			if (_hitbox.magnet_relative)
				{
				magnet_goal_x = _hitbox.owner.x + _hitbox.magnet_goal_x;
				magnet_goal_y = _hitbox.owner.y + _hitbox.magnet_goal_y;
				}
			else
				{
				magnet_goal_x = _hitbox.x + _hitbox.magnet_goal_x;
				magnet_goal_y = _hitbox.y + _hitbox.magnet_goal_y;
				}
			state_frame = _hitbox.state_frame + _hitbox.base_hitlag;
			//Attacking player gets some hitlag
			_hitbox.owner.self_hitlag_frame = _hitbox.base_hitlag;
			//Turn to face the attacker
			if (hit_turnaround)
				{
				if (x != _hitbox.owner.x) then facing = sign(_hitbox.owner.x - x);
				}
			//Effects
			var _dir = point_direction(x, y, magnet_goal_x, magnet_goal_y);
			hit_fx_style_create(_hitbox.hit_fx_style, _dir, _hitbox, _hitbox.damage);
			hit_sfx_play(_hitbox.hit_sfx);
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
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, point_direction(x, y, _hitbox.magnet_goal_x, _hitbox.magnet_goal_y), _hitbox, _hitbox.damage);
			hit_sfx_play(_hitbox.hit_sfx);
			break;
		case INV.shielding:
			hitbox_register_hit(_hitbox, true);
			//Deplete other's shield
			shield_hp -= _hitbox.damage;
			shield_stun += calculate_shieldstun(_hitbox.damage, _hitbox.shieldstun_scaling);
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
