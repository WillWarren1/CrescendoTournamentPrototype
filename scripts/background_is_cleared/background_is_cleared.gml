///@func background_is_cleared()
function background_is_cleared() {

	return (instance_exists(obj_stage_manager))
		? (obj_stage_manager.background_clear_frame != 0)
		: false;


}
