///@func entity_create(x, y, obj, [layer])
///@param x
///@param y
///@param obj
///@param [layer]
function entity_create() {

	var _layer = argument_count > 3 ? argument[3] : layer;
	var _entity = instance_create_layer(argument[0], argument[1], _layer, argument[2]);
	with(_entity)
		{
		owner = other.id;
		//Pass the owner's color palette
		palette = owner.palette;
		palette_sprite = owner.palette_sprite;
		player_color = owner.player_color;
		}
	return _entity;


}
