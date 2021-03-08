/// @description
if (lifetime % 2 == 0)
	{
	var _fx = fx_create(spr_projectile_trail_large, 2, 0, 14, x, y, overlay_scale, 1, "FX_Layer_Below");
	_fx.fx_xscale = sign(hsp) * overlay_scale;
	_fx.fx_yscale = choose(-1, 1) * overlay_scale;
	_fx.fx_blend = palette_color_get(owner.palette, 0);
	}
	
event_inherited();