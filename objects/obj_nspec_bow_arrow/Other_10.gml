/// @description
with(owner)
	{
	if (other.lifetime % 2 == 0)
		{
		var _fx = fx_create_color(other.overlay_sprite, 0, 0, 10, other.x, other.y, 2, other.overlay_angle, "FX_Layer_Below");
		_fx.fade = true;
		}
	}
//Change angle
overlay_angle = point_direction(0, 0, hsp, vsp);

event_inherited();