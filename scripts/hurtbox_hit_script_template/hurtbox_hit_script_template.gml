///@func hurtbox_hit_script_template(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
///@desc Template for making an on-hit script.
/// This script would be called when a certain hitbox collides with a hurtbox
/// It is run from the scope of the owner of the hurtbox that was hit
function hurtbox_hit_script_template() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
			break;
		case INV.invincible:
			break;
		case INV.superarmor:
			break;
		case INV.shielding:
			break;
		case INV.powershielding:
			break;
		case INV.parry:
			break;
		case INV.parry_ult:
			break;
		case INV.counter:
			break;
		}


}
