///@func css_ui_color_get(number,is_cpu)
///@param number
///@param is_cpu
function css_ui_color_get() {

	if (argument_count > 1 && argument[1]) then return $aeaeae;

	switch(argument[0])
		{
		case 0: return $7f73f1; break;
		case 1: return $97611e; break;
		case 2: return $82d3e9; break;
		case 3: return $98a937; break;
		case 4: return $588aff; break;
		case 5: return $866cc0; break;
		case 6: return $805c6d; break;
		case 7: return $565656; break;
		}
}