///@func calculate_knockback(target_hp,damage,weight,scaling,base_knockback,[formula])
///@param target_hp
///@param damage
///@param target_weight
///@param scaling
///@param base_knockback
///@param [formula]
function calculate_knockback() {
	var _target_hp, _damage, _target_weight, _scaling, _knockback, _formula;
	_target_hp = argument[0];
	_damage = argument[1];
	_target_weight = argument[2];
	_scaling = argument[3];
	_knockback = argument[4];
	_formula = argument_count > 5 ? argument[5] : KNOCKBACK_FORMULA.standard;

	/* Target HP is the damage percent the target has after the attack hits*/
	switch(_formula)
		{
		default:
		case KNOCKBACK_FORMULA.standard:
			if (match_has_stamina_set())
				{
				return _knockback * _target_weight;
				}
			else
				{
				return _knockback + (_target_hp + _damage) * _scaling * knockback_scaling_multiplier * _target_weight;
				}
			break;
		case KNOCKBACK_FORMULA.stronger:
			if (match_has_stamina_set())
				{
				return _knockback * _target_weight;
				}
			else
				{
				return _knockback + (power((_target_hp + _damage) / 25, 1 + _scaling) * _target_weight);
				}
			break;
		}


}
