///@func hurtbox_detectbox_hit_player(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
function hurtbox_detectbox_hit_player() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
		case INV.superarmor:
		case INV.counter:
			hitbox_register_hit(_hitbox);
			//Run the attack's detection phase
			with(_hitbox.owner) 
				{
				if (script_exists(_hitbox.detect_script))
					{
					script_execute(_hitbox.detect_script, other.id);
					}
				else if (script_exists(_hitbox.owner.attack_script))
					{
					script_execute(_hitbox.owner.attack_script, PHASE.detection, other.id);
					}
				}
			break;
		case INV.shielding:
		case INV.powershielding:
		case INV.parry:
		case INV.parry_ult:
		case INV.invincible:
			if (!is_dead())
				{
				hitbox_register_hit(_hitbox, true);
			
				//Run the attack's detection phase
				with(_hitbox.owner) 
					{
					if (script_exists(_hitbox.detect_script))
						{
						script_execute(_hitbox.detect_script, other.id);
						}
					else if (script_exists(_hitbox.owner.attack_script))
						{
						script_execute(_hitbox.owner.attack_script, PHASE.detection, other.id);
						}
					}
				}
			break;
		}


}
