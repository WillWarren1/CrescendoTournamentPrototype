///@func dspec_hydrant_melee_hit(hitbox, hurtbox)
///@param hitbox
///@param hurtbox
function dspec_hydrant_melee_hit() {

	var _hitbox = argument[0];
	var _hurtbox = argument[1];
	
	var _s = custom_entity_struct;
	var _ids = custom_ids_struct;

	//Check invulnerability
	switch(_hurtbox.inv_type)
		{
		case INV.normal:
			hitbox_register_hit(_hitbox);
			//Subtract HP
			_s.hp -= _hitbox.damage;
			//Hitlag
			_s.self_hitlag_frame = _hitbox.base_hitlag;
			_hitbox.owner.self_hitlag_frame = _hitbox.base_hitlag;
			//Knockback and hitlag
			var _total_kb = calculate_knockback(30, _hitbox.damage, 1, _hitbox.knockback_scaling, _hitbox.base_knockback);
			//Calculate angle based on flipper
			var _calc_angle = apply_angle_flipper(_hitbox.angle, _hitbox.angle_flipper, _hitbox.owner, id, _total_kb, _hitbox.facing);
			//Effects
			hit_fx_style_create(_hitbox.hit_fx_style, _calc_angle, _hitbox, _total_kb);
			hit_sfx_play(_hitbox.hit_sfx);
			//Launch the hydrant
			if (_s.hp <= 0 && !_s.launched)
				{
				hsp = lengthdir_x(_total_kb, _calc_angle);
				vsp = min(-5, -abs(lengthdir_y(_total_kb, _calc_angle))); //Always launches upwards
				if (sign(hsp) != 0) then facing = sign(hsp);
				_s.launched = true;
				//Destroy the solid collision block
				instance_set_flag(id, FLAG.solid, false);
				//Destroy other hitboxes
				hitboxes_destroy_attached_all();
				//Reset hitbox groups
				hitbox_group_reset_all();
				//Change ownership
				owner = _hitbox.owner;
				_s.palette_sprite = owner.palette_sprite;
				_s.player_color = owner.player_color;
				//The new owner can't be hit by the attack
				hitbox_group_whitelist_id(owner, 2);
				//Launch hitbox object
				_ids.launch_hitbox = hitbox_create_melee(0, 0, 0.75, 0.75, 13, 9, 0.7, 12, 45, 180, HITBOX_SHAPE.circle, 2);
				_ids.launch_hitbox.hit_fx_style = HIT_FX.normal_strong;
				_ids.launch_hitbox.hit_sfx = snd_hit_strong;
				//Change lifetime
				_s.lifetime = 180;
				}
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
