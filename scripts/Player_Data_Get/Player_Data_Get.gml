///@func Player_Data_Get(player, data)
///@param player
///@param data
function Player_Data_Get() {
	var _play = engine().players[argument[0]];
	return _play[argument[1]];
}