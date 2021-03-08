///@func check_landing()
///@desc Transition to lag state when landing on platforms or solid blocks
function check_landing() {
	//If you are not holding down on the control stick
	if (!stick_tilted(Lstick, DIR.down))
		{
		//If there is a block below you and you're not in a platform and you are falling / still
		if (on_ground() && vsp >= 0)
			{
			//Stop speed and change state
			vsp = 0;
			vsp_frac = 0;
			state_set(PLAYER_STATE.in_lag);
			state_frame = land_time;
			jump_is_dash_jump = false;
			//VFX
			fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
			return true;
			}
		}
	else
		{
		//If there is a solid block below you and you are falling / still
		if (on_solid(x, y) && vsp >= 0)
			{
			//Stop speed and change state
			vsp = 0;
			vsp_frac = 0;
			state_set(PLAYER_STATE.in_lag);
			state_frame = land_time;
			jump_is_dash_jump = false;
			//VFX
			fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
			return true;
			}
		}
	return false;


}
