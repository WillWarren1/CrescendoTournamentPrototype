/// @description <Run by obj_game>
if (destroy || lifetime == 0)
	{
	instance_destroy();
	exit;
	}
	
//Overlay Sprite
overlay_frame = (overlay_frame + overlay_speed) % sprite_get_number(overlay_sprite);

//Nothing happens if the owner is somehow destroyed
if (instance_exists(owner))
	{
	//Move with the player
	x = xstart + (owner.x - owner_xstart);
	y = ystart + (owner.y - owner_ystart);
	
	//Check for sprite Collision
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
			var _array = owner.hitbox_groups[@ hitbox_group];
			var _already_hit = array_contains(_array, _hurtbox.owner);
			//Run the melee hit script
			if (!_already_hit)
				{
				var _grabbed = false;
				with(_hurtbox.owner)
					{
					_grabbed = script_execute(_hurtbox.grab_hit, other.id, _hurtbox);
					}
				//If you grabbed someone, you cannot grab another player
				//The event is exited because grabbing destroys the grab hitbox
				if (_grabbed) then exit;
				}
			}
		}
	//Clear the DS
	ds_list_clear(list);
	}
	
//Timer
lifetime--;

//Destroy if the player was hit
if (owner.state != PLAYER_STATE.attacking)
	{
	destroy = true;
	}
	
image_blend = grab_draw_color;