///@func hitbox_set_shape(hitbox,shape)
///@param hitbox
///@param shape
function hitbox_set_shape() {
	with(argument[0])
		{
		var _value = argument[1];
		if (_value == HITBOX_SHAPE.square || _value == HITBOX_SHAPE.circle || _value == HITBOX_SHAPE.rotation)
			{
			shape = _value;
			//Sprite
			switch(shape)
				{
				case HITBOX_SHAPE.square:
					sprite_index = spr_hitbox_square;
					break;
				case HITBOX_SHAPE.circle:
					sprite_index = spr_hitbox_circle;
					break;
				case HITBOX_SHAPE.rotation:
					sprite_index = spr_hitbox_rotation;
					if (argument_count > 3) image_angle = argument[3];
					break;
				}
			}
		else if (sprite_exists(_value))
			{
			shape = _value;
			sprite_index = _value;
			image_xscale *= owner.facing;
			}
		}
}