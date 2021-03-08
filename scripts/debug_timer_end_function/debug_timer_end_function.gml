function debug_timer_end_function(_func) {
	var _time = (get_timer() - ds_stack_pop(Debug_Timerstack()));
	_func(_time);
}