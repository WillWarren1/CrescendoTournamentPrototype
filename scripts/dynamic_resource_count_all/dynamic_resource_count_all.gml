///@func dynamic_resource_count_all()
///@desc Returns a struct containing the number of all data structures, buffers, and surfaces
function dynamic_resource_count_all() {
	return {
		grid : dynamic_resource_count(DR.grid),
		list : dynamic_resource_count(DR.list),
		map : dynamic_resource_count(DR.map),
		priority : dynamic_resource_count(DR.priority),
		queue : dynamic_resource_count(DR.queue),
		stack : dynamic_resource_count(DR.stack),
		buffer : dynamic_resource_count(DR.buffer),
		surface : dynamic_resource_count(DR.surface),
		instance : instance_count,
	};
}