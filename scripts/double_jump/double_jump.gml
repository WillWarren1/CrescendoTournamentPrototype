///@func double_jump()
///@desc Executes a mid air jump, including the horizontal speed boost
function double_jump() {
	//State
	state_set(PLAYER_STATE.aerial);

	//Speeds
	vsp = -double_jump_speed;
	vsp_frac = 0;
	double_jumps--;
	jump_is_dash_jump = false;
	jump_is_midair_jump = true;

	//Horizontal Speed change
	if (stick_tilted(Lstick, DIR.horizontal))
		{
		//hsp = min(abs(hsp), max_air_speed) * sign(stick_get_value(Lstick, DIR.horizontal));
		hsp = clamp(hsp + (double_jump_horizontal_accel * sign(stick_get_value(Lstick, DIR.horizontal))), -max_air_speed, max_air_speed);
		hsp_frac = 0;
		}
	
	//VFX
	fx_create(spr_dust_air_jump, 1, 0, 7, x, y, 2, 0);

	//Peak of jump
	if (abs(vsp) < 1)
		{
		anim_set(my_sprites[? "DJumpMid"]);
		}
	//Falling
	else if (vsp >= 1)
		{
		anim_set(my_sprites[? "DJumpFall"]);
		}
	//Rising
	else if (vsp <= 1)
		{
		anim_set(my_sprites[? "DJumpRise"]);
		}
	//Fastfalling
	if (vsp >= fast_fall_speed)
		{
		anim_set(my_sprites[? "DFastfall"]);
		}

}
