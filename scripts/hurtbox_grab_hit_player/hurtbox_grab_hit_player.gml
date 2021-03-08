///@func hurtbox_grab_hit_player(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
///@desc Returns true if the player was grabbed successfully
function hurtbox_grab_hit_player() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.shielding:
		case INV.powershielding:
		case INV.superarmor:
		case INV.counter:
		case INV.parry_ult:
		case INV.normal:
			hitbox_register_hit(_hitbox);
			//Change state of target
			attack_stop(PLAYER_STATE.is_grabbed);
			Player_Move_To_Front();
			//Turn to face the attacker
			facing = -_hitbox.owner.facing;
			//Pass ID
			grab_hold_id = _hitbox.owner;
			//Set grab hold position
			grab_hold_enable = true;
			grab_hold_x = _hitbox.grab_destination_x;
			grab_hold_y = _hitbox.grab_destination_y;
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, point_direction(x, y, _hitbox.owner.x, _hitbox.owner.y), _hitbox, 0);
			hit_sfx_play(_hitbox.hit_sfx);
			//Change state of the grabbing player (this results in the hitbox being destroyed)
			with(_hitbox.owner)
				{
				attack_stop(PLAYER_STATE.grabbing);
				grabbed_id = other.id;
				//Set the grab timer
				state_frame = calculate_grab_time(other.damage);
				}
			//Acknowledge the grab
			return true;
			break;
		case INV.invincible:
			//No knockback or damage or hitlag
			//Do not add the player to the hitbox group array
			//This is because the opponent should be hit even if their invincibility runs out mid-attack
			break;
		case INV.parry:
			hitbox_register_hit(_hitbox, true);
			if (parry_grabs)
				{
				//Activate the other player's parry
				parry_trigger(_hitbox, true, id);
				break;
				}
			else
				{
				//Change state of target
				attack_stop(PLAYER_STATE.is_grabbed);
				//Turn to face the attacker
				facing = -_hitbox.owner.facing;
				//Pass ID
				grab_hold_enable = true;
				grab_hold_id = _hitbox.owner;
				//Set grab hold position
				grab_hold_x = _hitbox.grab_destination_x;
				grab_hold_y = _hitbox.grab_destination_y;
				//Change state of player
				with(_hitbox.owner)
					{
					attack_stop(PLAYER_STATE.grabbing);
					grabbed_id = other.id;
					//Set the grab timer
					state_frame = calculate_grab_time(other.damage);
					}
				//Effects
				hit_fx_style_create(_hitbox.hit_fx_style, point_direction(x, y, _hitbox.owner.x, _hitbox.owner.y), _hitbox, 0);
				hit_sfx_play(_hitbox.hit_sfx);
				//Acknowledge the grab
				return true;
				}
			break;
		}


}
