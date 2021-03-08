///@func check_waveland_script()
///@desc Allows wavelanding (including platform snap)
function check_waveland() {
	//Only waveland if you are colliding with a block from the top
	if (vsp >= 0)
		{
		//Snap landing onto platforms
		var _plat = collision(x, y, flags_create(FLAG.plat));
		if (_plat != noone && bbox_bottom - _plat.bbox_top <= platform_snap_threshold)
			{
			while(!on_plat(x, y) && !collision(x, y - 1, flags_create(FLAG.solid)))
				{
				y -= 1;
				}
			//Change state & set timer
			state_set(PLAYER_STATE.wavelanding);
			state_frame = waveland_time;
			//Set the speeds
			vsp = 0;
			vsp_frac = 0;
			//Do not set hsp because it carries over to wavelanding
			hsp += (waveland_speed_boost * sign(hsp));
			//VFX
			var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
			_fx.fx_xscale = 2 * sign(hsp);
			return true;
			}
		else
		//Normal landing
		if (on_ground())
			{
			//Change state & set timer
			state_set(PLAYER_STATE.wavelanding);
			state_frame = waveland_time;
			//Set the speeds
			vsp = 0;
			vsp_frac = 0;
			//Do not set hsp because it carries over to wavelanding
			hsp += (waveland_speed_boost * sign(hsp));
			//VFX
			var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
			_fx.fx_xscale = 2 * sign(hsp);
			return true;
			}
		}
	return false;


}
