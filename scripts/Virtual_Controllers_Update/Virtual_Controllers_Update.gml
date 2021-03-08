///@func Virtual_Controllers_Update(controllers)
///@param controllers
function Virtual_Controllers_Update(argument0) {
	var _cons = argument0;

	for(var i = 0; i < max_players; i++)
		{
		var _con = _cons[i];
		for(var m = 0; m < VB.length; m++)
			{
			var _button = _con[m];
			if (!_button[1])
				{
				_button[@ 0] = 0;
				}
			_button[@ 1] = false;
			}
		}
}