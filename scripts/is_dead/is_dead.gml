///@func is_dead([player])
///@param [player]
function is_dead() {
	var _p = argument_count > 0 ? argument[0] : id;
	return 
		_p.state == PLAYER_STATE.knocked_out	||
		_p.state == PLAYER_STATE.star_ko		||
		_p.state == PLAYER_STATE.screen_ko		||
		_p.state == PLAYER_STATE.lost;


}
