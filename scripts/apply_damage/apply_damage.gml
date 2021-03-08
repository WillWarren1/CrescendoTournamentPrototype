///@func apply_damage(player_id,damage)
///@param player_id
///@param damage
///@desc Applies a given amount of damage to a player object
function apply_damage() {
	var _id = argument[0];
	var _d = argument[1];
	
	//Stamina
	if (match_has_stamina_set())
		{
		_id.stamina -= _d;
		//Check for KOs
		if (_id.stamina <= 0)
			{
			_id.stamina = 0;
			with(_id)
				{
				die();
				}
			}
		}
	//Normal Damage
	else
		{
		//Maximum & Minimum Damage
		_id.damage = clamp(_id.damage + _d, 0, max_damage);
		}
		
	//VFX
	_id.damage_text_random = _d;

	//Damage numbers
	if (setting().show_damage_numbers && _d != 0)
		{
		with(instance_create_layer(x + irandom_range(-14, 14), y + irandom_range(-14, 14), layer, obj_notice))
			{
			image_blend = c_white;
			custom_fx_struct.text = string(_d);
			lifetime = 60;
			}
		}
	
	//Combos
	if (setting().show_true_combos)
		{
		if (_id.state == PLAYER_STATE.in_balloon ||
			_id.state == PLAYER_STATE.in_flinch ||
			_id.state == PLAYER_STATE.knockdown ||
			_id.state == PLAYER_STATE.in_hitlag ||
			_id.state == PLAYER_STATE.in_hitstun ||
			_id.state == PLAYER_STATE.magnetized)
			{
			with(instance_create_layer(x + irandom_range(-14, 14), y -32 + irandom_range(-4, 4), "FX_Layer", obj_notice))
				{
				image_blend = c_yellow;
				custom_fx_struct.text = "COMBO";
				custom_fx_struct.font = fnt_notice_text;
				lifetime = 70;
				}
			}
		else
			{
			with(instance_create_layer(x + irandom_range(-14, 14), y -32 + irandom_range(-4, 4), "FX_Layer", obj_notice))
				{
				image_blend = c_red;
				custom_fx_struct.text = Player_State_Name_Get(_id.state);
				custom_fx_struct.font = fnt_notice_text;
				lifetime = 70;
				}
			}
		}
}