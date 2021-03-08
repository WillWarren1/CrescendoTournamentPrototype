///@func character_data_get(character_number,data_enum)
///@param character_number
///@param data_enum
function character_data_get(_n, _i) {
	return character_data_get_all()[@ _n][@ _i];
}