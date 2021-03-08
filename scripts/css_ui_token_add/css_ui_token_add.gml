///@func css_ui_cpu_token_add
///@param index
///@param x
///@param y
///@param is_cpu
function css_ui_token_add(argument0, argument1, argument2, argument3) {

	var _new = [];
	_new[CSS_TOKEN.index] = argument0;
	_new[CSS_TOKEN.x] = argument1;
	_new[CSS_TOKEN.y] = argument2;
	_new[CSS_TOKEN.is_cpu] = argument3;
	ds_list_add(obj_css_ui.tokens, _new);
	return _new;


}
