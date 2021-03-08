///Standard_Star_KO
function Standard_Star_KO() {
	//Contains the standard actions for the Star KO state
	var run = true;
#region Renderer
	Player_Set_Renderer(obj_player_renderer_back);
#endregion
#region No values while dead
	speed_set(0, 0, false, false);
	hurtbox_inv_set(hurtbox, INV.invincible, 1);
#endregion
#region Fall at the top of the screen
	var _percent = (1 - state_frame / star_ko_base_time);
	x = round(lerp(x, room_width div 2, 0.01));
	y = round(_percent * star_ko_distance);
	anim_scale = (1 - _percent);
#endregion
#region Knock Out
	if (run && state_frame == 0)
		{
		//Change state
		state_set(PLAYER_STATE.knocked_out);
	
		//VFX
		fx_create(spr_shine_fastfall, 1, 0, 13, x + irandom_range(-5, 5), y + irandom_range(-5, 5), 2, 0);
	
		//Stock matches
		stock--;

		//Reset damage
		damage = 0;
	
		//Lose if no stocks left
		if (match_has_stock_set() && stock <= 0)
			{
			state_frame = -1;
			stock = 0;
			state_set(PLAYER_STATE.lost);
			}
		else if (!match_has_stock_set() && match_has_time_set())
			{
			with(ko_property)
				{
				points++;
				}
			ko_property = noone;
			points--;
			}
		run = false;
		}
#endregion
	//No movement


}
