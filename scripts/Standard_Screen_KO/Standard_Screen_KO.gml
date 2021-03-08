///Standard_Screen_KO
function Standard_Screen_KO() {
	//Contains the standard actions for the Screen KO state
	var run = true;
#region Renderer
	Player_Set_Renderer(obj_player_renderer_front);                                                                
#endregion
#region No values while dead
	speed_set(0, 0, false, false);
	hurtbox_inv_set(hurtbox, INV.invincible, 1);
#endregion
#region Hit the screen
	var _percent = 1 - (state_frame / screen_ko_base_time);
	if (_percent < 0.3)
		{
		y = 0;
		x = round(room_width div 2);
		}
	else if (_percent < 0.4)
		{
		y = round(lerp(0, room_height div 2, ((_percent - 0.3) / 0.1)));
		anim_scale = ((_percent - 0.3) / 0.1) * screen_ko_scale_multiplier;
		}
	else if (_percent < 0.6)
		{
		}
	else if (_percent < 1.0)
		{
		y = round(lerp(room_height div 2, room_height + (sprite_get_height(anim_sprite) * anim_scale), ((_percent - 0.6) / 0.4)));
		}
#endregion
#region Knock Out
	if (run && state_frame == 0)
		{
		//Change state
		state_set(PLAYER_STATE.knocked_out);
	
		//VFX
		var _col = palette_color_get(palette, 0);
		var _fx = fx_create(spr_hit_ko_explosion, 1, 0, 47, x, y, 4, point_direction(x, y, room_width / 2, room_height / 2));
		_fx.fx_blend = _col;
		var _fx = fx_create(spr_hit_ko_explosion, 1, 0, 47, x, y, 3, point_direction(x, y, room_width / 2, room_height / 2));
		_fx.fx_yscale *= -1;
		_fx.fx_blend = _col;
	
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
