///@func Virtual_Controllers_Create
function Virtual_Controllers_Create() {
	var _cons = array_create(max_players);
	for(var m = 0; m < max_players; m++)
		{
		var _con = array_create(VB.length);
		for(var i = 0; i < VB.length; i++)
			{
			var _button = [];
			_button[0] = 0;
			_button[1] = false;
			_con[@ i] = _button;
			}
		_cons[@ m] = _con;
		}
	return _cons;
}