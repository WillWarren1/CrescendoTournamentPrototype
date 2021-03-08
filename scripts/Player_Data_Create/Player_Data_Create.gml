///@func Player_Data_Create(character,color,device,device_type,profile,is_random,is_cpu,cpu_type)
///@param character
///@param color
///@param device
///@param device_type
///@param profile
///@param is_random
///@param is_cpu
///@param cpu_type
function Player_Data_Create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	var _new = [];
	_new[PLAYER_DATA.character	] = argument0;
	_new[PLAYER_DATA.color		] = argument1;
	_new[PLAYER_DATA.device		] = argument2;
	_new[PLAYER_DATA.device_type] = argument3;
	_new[PLAYER_DATA.profile	] = argument4;
	_new[PLAYER_DATA.is_random	] = argument5;
	_new[PLAYER_DATA.is_cpu		] = argument6;
	_new[PLAYER_DATA.cpu_type	] = argument7;
	return _new;


}
