///Standard_Aerial
function Standard_Aerial() {
	//Contains the standard actions for the aerial state.
	var run = true;
	#region Animation
	anim_speed = anim_speed_normal;
	if (!jump_is_midair_jump)
		{
		//Peak of jump
		if (abs(vsp) < 1)
			{
			anim_loop_continue(my_sprites[? "JumpMid"]);
			}
		//Falling
		else if (vsp >= 1)
			{
			anim_loop_continue(my_sprites[? "JumpFall"]);
			}
		//Rising
		else if (vsp <= 1)
			{
			anim_loop_continue(my_sprites[? "JumpRise"]);
			}
		//Fastfalling
		if (vsp >= fast_fall_speed)
			{
			anim_loop_continue(my_sprites[? "Fastfall"]);
			}
		}
	else
		{
		//Peak of jump
		if (abs(vsp) < 1)
			{
			anim_loop_continue(my_sprites[? "DJumpMid"]);
			}
		//Falling
		else if (vsp >= 1)
			{
			anim_loop_continue(my_sprites[? "DJumpFall"]);
			}
		//Rising
		else if (vsp <= 1)
			{
			anim_loop_continue(my_sprites[? "DJumpRise"]);
			}
		//Fastfalling
		if (vsp >= fast_fall_speed)
			{
			anim_loop_continue(my_sprites[? "DFastfall"]);
			}
		}
	#endregion
	#region Friction and Gravity
	//No air friction if you are tilting the stick
	var _friction = air_friction;
	if (stick_tilted(Lstick, DIR.horizontal) && !aerial_state_use_momentum_drift)
		{
		_friction = 0;
		}
	friction_gravity(_friction, grav, max_fall_speed);
	#endregion
	#region Horizontal Movement
	if (run) 
		{
		if (aerial_state_use_momentum_drift)
			{
			aerial_drift_momentum();
			}
		else
			{
			aerial_drift();
			}
		}
	#endregion
	#region Landing
	if check_landing() run = false;
	#endregion
	#region Ledge
	if run && check_ledge_grab_falling() run = false;
	#endregion
	#region Airdodging
	if run && check_airdodge() run = false;
	#endregion
	#region Wall Jumping
	if (run)
		{
		if run && check_wall_cling() run = false;
		if run && check_wall_jump() run = false;
		}
	#endregion
	#region Double Jumping
	//If you have enough jumps
	if (run && double_jumps > 0)
		{
		//If jump is being pressed
		if (button(INPUT.jump, buff))
			{
			double_jump();
			run = false;
			}
		}
	#endregion
	#region Attacking
	if run && check_aerials() run = false;
	if run && check_smashes() run = false;
	if run && check_specials() run = false;
	#endregion
	#region Fastfalling
	if (run) fastfall_try();
	#endregion
	move();
}