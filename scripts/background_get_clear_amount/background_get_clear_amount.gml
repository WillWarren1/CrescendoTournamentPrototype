///@func background_get_clear_amount()
///@desc Returns a number from 0 (fully cleared) to 1 (normal)
function background_get_clear_amount() {
	return (instance_exists(obj_stage_manager))
		? (1 - obj_stage_manager.background_clear_amount)
		: 0.0;
}