/// @description Called by obj_game
custom_entity_struct.lifetime -= 1;
if (custom_entity_struct.lifetime <= 0) then instance_destroy();

image_index += 0.3;

if (custom_entity_struct.mode == 0)
	{
	if (!collision(x + hsp, y, flags_create(FLAG.solid)))
		{
		x += hsp;
		}
	else
		{
		repeat(abs(hsp))
			{
			if (!collision(x + sign(hsp), y, flags_create(FLAG.solid)))
				{
				x += sign(hsp);
				}
			else
				{
				custom_entity_struct.mode = 1;
				break;
				}
			}
		}
		
	repeat(abs(vsp))
		{
		if (!collision(x, y + sign(vsp), flags_create(FLAG.solid)))
			{
			y += sign(vsp);
			}
		else
			{
			custom_entity_struct.mode = 1;
			break;
			}
		}
	}
else if (custom_entity_struct.mode == 1)
	{
	//Hitbox
	if (!custom_entity_struct.created_hitbox)
		{
		custom_entity_struct.created_hitbox = true;
		hitbox_create_windbox(0, 0, 1.5, 1.5, 0, 1, 90, custom_entity_struct.lifetime, HITBOX_SHAPE.circle, 0, FLIPPER.fixed, true, true, false, 20, false);
		}
	custom_entity_struct.scale = lerp(custom_entity_struct.scale, 2, 0.1);
	if (custom_entity_struct.lifetime <= 10)
		{
		custom_entity_struct.mode = 2;
		}
	}
else if (custom_entity_struct.mode == 2)
	{
	custom_entity_struct.scale = lerp(custom_entity_struct.scale, 0, 0.3);
	}
	
custom_entity_struct.frame += 0.3;