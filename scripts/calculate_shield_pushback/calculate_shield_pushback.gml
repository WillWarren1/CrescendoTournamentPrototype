///@func calculate_shield_pushback(damage,angle,multiplier)
///@param damage
///@param angle
///@param multiplier
function calculate_shield_pushback(argument0, argument1, argument2) {

	return (lengthdir_x(argument0, argument1) * shield_pushback_multiplier * argument2);


}
