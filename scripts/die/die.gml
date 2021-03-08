///@func die()
///@desc Knocks out a player and destroys their hitboxes
function die() {
	attack_stop();
	hitboxes_destroy_attached_all();
	camera_shake(death_cam_shake);
	hit_sfx_play(snd_hit_explosion);

	//Knockout state
	//* Star KO / Screen KO
	var _ko = true;
	if (y < 0)
		{
		if (obj_game.current_frame % star_ko_chance == 0)
			{
			state_set(PLAYER_STATE.star_ko);
			_ko = false;
			}
		else
		if (obj_game.current_frame % screen_ko_chance == 0)
			{
			state_set(PLAYER_STATE.screen_ko);
			_ko = false;
			}
		}
	if (_ko)
		{
		state_set(PLAYER_STATE.knocked_out);
	
		//VFX
		if (!match_has_stamina_set() && check_blastzones(0, 0, room_width, room_height))
			{
			var _col = palette_color_get(palette, 0);
			var _fx = fx_create(spr_hit_ko_explosion, 1, 0, 47, x, y, 4, point_direction(x, y, room_width / 2, room_height / 2));
			_fx.fx_blend = _col;
			var _fx = fx_create(spr_hit_ko_explosion, 1, 0, 47, x, y, 3, point_direction(x, y, room_width / 2, room_height / 2));
			_fx.fx_yscale *= -1;
			_fx.fx_blend = _col;
			}
		else
			{
			var _col = palette_color_get(palette, 0);
			var _fx = fx_create(spr_hit_final_hit, 1, 0, 34, x, y, 2, irandom(360));
			_fx.fx_blend = _col;
			}
	
		//Stock matches
		if (match_has_stock_set())
			{
			stock--;
			}

		//Reset damage
		damage = 0;
	
		//Reset stamina
		stamina = setting().match_stamina;
	
		//Lose if no stamina left
		/*
		if (match_has_stamina_set() && !match_has_stock_set() && !match_has_time_set())
			{
			state_frame = -1;
			state_set(PLAYER_STATE.lost);
			}
		*/

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
		}
	//*/
	//Variable reset
	jump_is_dash_jump = false;
	jump_is_midair_jump = false;

	//Invulnerability
	hurtbox_inv_set(hurtbox, INV.invincible, state_frame);


}
