///@func attack_has_hit([count_blocked],[only_blocked])
///@param [count_blocked]
///@param [only_blocked]
///@desc Checks if any attched hitbox of the owner has collided
function attack_has_hit() {
	//Projectiles do not count
	//Hitting a shield or getting parried won't count unless count_blocked_hits is true
	var _count_blocked = argument_count > 0 ? argument[0] : false;
	var _only_blocked = argument_count > 1 ? argument[1] : false;

	if (_count_blocked)
		{
		if (_only_blocked) then return any_hitbox_has_been_blocked;
		else return any_hitbox_has_hit || any_hitbox_has_been_blocked;
		}
	else return any_hitbox_has_hit;


}
