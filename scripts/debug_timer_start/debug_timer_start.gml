function debug_timer_start() {
	ds_stack_push(Debug_Timerstack(), get_timer());
}

function Debug_Timerstack() {
	static _stack = ds_stack_create();
	return _stack;
}

/*
- 16666 Microseconds per frame
- 2083 Microseconds per 8th frame
*/