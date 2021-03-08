function debug_timer_end() {
	var _time = (get_timer() - ds_stack_pop(Debug_Timerstack()));
	log("Time: " + string(_time));
}