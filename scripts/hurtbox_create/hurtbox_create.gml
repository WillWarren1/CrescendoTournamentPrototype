///@func hurtbox_create([sprite])
///@param [sprite]
///@desc Creates a new hurtbox object, ties it to the creator, and returns the index
function hurtbox_create() {
	var _hurtbox = instance_create_layer(x, y, layer, obj_hurtbox);
	with(_hurtbox)
		{
		owner = other.id;
		if (argument_count > 0)
			{
			sprite_index = argument[0];
			}
		}
	return _hurtbox;
}