/// @description Called by obj_game

var _s = custom_entity_struct;
var _ids = custom_ids_struct;

if (_s.explosion_time > 0)
	{
	_s.explosion_time--;
	if (_s.explosion_time <= 0)
		{
		instance_destroy();
		exit;
		}
	}
else if (_ids.attached == noone)
	{
	//Falling
	vsp = min(vsp + _s.grav, _s.max_fall_speed);
	
	repeat(abs(vsp))
		{
		if (!on_ground(x, y, vsp)) then y += sign(vsp);
		else
			{
			vsp = 0;
			_s.grounded = true;
			break;
			}
		}
		
	//Moving horizontally on moving blocks
	var _moving = instance_place(x, y + 1, obj_block_moving);
	if (_moving != noone)
		{
		var _hsp = (_moving.x - _moving.xprevious);
		entity_move(_hsp, 0, false, false, 0, false);
		}
		
	//Attach to players nearby
	if (!_s.grounded)
		{
		//Get collisions with nearby players
		ds_list_clear(get_temp_list());
		if (collision_circle_list(x, y, 20, obj_player, false, true, get_temp_list(), true))
			{
			for(var i = 0; i < ds_list_size(get_temp_list()); i++)
				{
				var _inst = get_temp_list()[| i];
				//Cannot attach to owner
				if (_inst != noone && _inst != owner)
					{
					//Cannot attach to dead or invincible players
					with(_inst)
						{
						if (!is_dead() && hurtbox.inv_type != INV.invincible)
							{
							_ids.attached = _inst;
							break;
							}
						}
					}
				}
			}
		}
	}
else
	{
	//Follow the player, unless it is already exploding
	if (_s.explosion_time == -1)
		{
		x = _ids.attached.x;
		y = _ids.attached.y;
		}
	}
	
//Animation
if (_s.explosion_time > 0)
	{
	visible = false;
	}
else if (_s.grounded)
	{
	image_index += 0.1;
	if (image_index >= 4 || image_index < 2) then image_index = 2;
	}
else
	{
	image_index += 0.1;
	if (image_index >= 2) then image_index = 0;
	}
	
//Destroy if the owner is dead or the attached player is dead
with(owner)
	{
	if (is_dead())
		{
		instance_destroy(other);
		exit;
		}
	}
with(_ids.attached)
	{
	if (is_dead())
		{
		instance_destroy(other);
		exit;
		}
	}
	
//Destroy if it falls under the stage
if (bbox_top > room_height)
	{
	instance_destroy();
	exit;
	}