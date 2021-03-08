///@func css_get_next_character_color(index,character,[current],[direction])
///@param index
///@param character
///@param [current]
///@param [direction]
///@desc Gets the next available color choice for a given character
function css_get_next_character_color() {

	var _index = argument[0];
	var _character = argument[1];
	var _current = argument_count > 2 ? argument[2] : 0;
	var _dir = argument_count > 3 ? argument[3] : 1;
	var _col = _current;

	//Find all of the colors already taken (assume that there is an open slot left)
	var _taken = true;
	while(_taken)
		{
		//Check the next color. Wrap if necessary
		_col += _dir;
		if (_col > max_players)
			{
			_col = 1;
			}
		else if (_col < 1)
			{
			_col = max_players;
			}
		
		//Make sure it isn't already taken
		_taken = false;
		for(var i = 0; i < css_number_of_players(); i++)
			{
			var _player_index = css_player_index(i);
			if (_player_index == _index) then continue;
		
			if (css_player_get(_player_index, CSS_PLAYER.character) == _character && css_player_get(_player_index, CSS_PLAYER.color) == _col)
				{
				_taken = true;
				break;
				}
			}
		}
	return _col;


}
