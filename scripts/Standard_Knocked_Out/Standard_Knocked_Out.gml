///Standard_Knocked_Out
function Standard_Knocked_Out() {
	//Contains the standard actions for the knocked out state.
	var run = true;
#region No values while dead
	speed_set(0, 0, false, false);
	hurtbox_inv_set(hurtbox, INV.invincible, 1);
	knockback_dir = 0;
	knockback_spd = 0;
	damage = 0;
	stamina = setting().match_stamina;
	ko_property = noone;
#endregion
#region Respawn
	if (run && state_frame == 0)
		{
		//Find the first open respawn platform
		if (instance_number(obj_respawn_platform) > 0)
			{
			var _current_respawning = 0;
			with(obj_player)
				{
				if (state == PLAYER_STATE.respawning)
					{
					_current_respawning++;
					}
				}
			var _platform = instance_find(obj_respawn_platform, _current_respawning);
			x = _platform.x;
			y = _platform.y - sprite_height;
			}
		else
			{
			x = xstart;
			y = ystart;
			}
		//Change state
		state_set(PLAYER_STATE.respawning);
		run = false;
		}
#endregion
	//No movement


}
