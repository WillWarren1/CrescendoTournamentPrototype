///@func nspec_build_melee_hit(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
function nspec_build_melee_hit() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];
	
	var _s = custom_entity_struct;

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
			hitbox_register_hit(_hitbox);
			//Dealing damage reduces the lifetime
			_s.lifetime -= _hitbox.damage * 10;
			//Hitlag
			_hitbox.owner.self_hitlag_frame = _hitbox.base_hitlag;
			//Knockback
			var _total_kb = calculate_knockback(30, _hitbox.damage, 1, _hitbox.knockback_scaling, _hitbox.base_knockback);
			//Calculate angle based on flipper
			var _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, _calc_angle, _hitbox, _total_kb);
			hit_sfx_play(_hitbox.hit_sfx);
			break;
		//The hydrant cannot have these states
		case INV.superarmor:
		case INV.invincible:
		case INV.shielding:
		case INV.powershielding:
		case INV.parry:
		case INV.parry_ult:
		case INV.counter:
			break;
		}
}