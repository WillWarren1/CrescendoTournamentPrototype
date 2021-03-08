/// @description
if (destroy || lifetime <= 0)
	{
	instance_destroy();
	exit;
	}
	
//Overlay Sprite
overlay_frame = (overlay_frame + overlay_speed) % sprite_get_number(overlay_sprite);

//Friction and Gravity
hsp = approach(hsp, 0, fric);
vsp += grav;

//Move
if (!pass_through_blocks)
	{
	projectile_move_x(hbounce, bounce_multiplier);
	projectile_move_y(vbounce, bounce_multiplier);
	}
else
	{
	x += hsp;
	y += vsp;
	}
	
if (destroy_outside_room)
	{
	if (!point_in_rectangle(x, y, 0, 0, room_width, room_height))
		{
		destroy = true;
		}
	}

//Check for a collision with any hurtboxes
var _num = instance_place_list(x, y, obj_hurtbox, list, false);
if (_num > 0)
	{
	//Loop through all hit players, an execute a script for each
	for(var i = 0; i < _num; i++)
		{
		var _hurtbox = list[| i];
		//Hitboxes cannot hit their owners
		if (_hurtbox.owner == noone || _hurtbox.owner == owner) then continue;
		//Hitboxes cannot hit someone who has already been hit
		var _already_hit = false;
		for(var m = 0; m < array_length(hitbox_group_array); m++)
			{
			if (_hurtbox.owner == hitbox_group_array[@ m])
				{
				_already_hit = true;
				break;
				}
			}
		//Run the projectile hit script
		if (!_already_hit)
			{
			with(_hurtbox.owner)
				{
				script_execute(_hurtbox.projectile_hit, other.id, _hurtbox);
				}
			}
		}
	}
	
//Clear the DS
ds_list_clear(list);

//Timer
lifetime--;

image_blend = projectile_draw_color;