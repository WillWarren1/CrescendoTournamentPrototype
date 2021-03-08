///@func attack_set_cooldown(cooldown,[attack_script])
///@param cooldown
///@param [attack_script]
function attack_set_cooldown() {
	var _cool = argument[0];
	var _script = (argument_count > 1 && script_exists(argument[1])) ? argument[1] : attack_script;

	if (attack_script != -1)
		{
		attack_cooldown[? string(_script)] = _cool;
		}


}
