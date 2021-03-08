///@func Player_Draw_Self([x],[y],[scale_multiplier])
///@param [x]
///@param [y]
///@param [scale_multiplier]
function Player_Draw_Self() {
	var _x = argument_count > 0 ? argument[0] : x,
		_y = argument_count > 1 ? argument[1] : y,
		_s = argument_count > 2 ? argument[2] : 1;
	
	if (anim_sprite != -1)
		{
		if (sprite_exists(anim_sprite))
			{
			//Draw the sprite
			draw_sprite_ext
				(
				anim_sprite,
				floor(anim_frame),
				_x + (anim_offsetx * facing),
				_y + anim_offsety,
				anim_scale * sprite_scale * _s * facing,
				anim_scale * sprite_scale * _s,
				anim_angle,
				anim_color,
				anim_alpha,
				);
				draw_text(_x, _y - 40, player_rhythm_meter);
				draw_text(_x, _y - 60, usingBeatBonus);
			}
		else
			{
			crash("Anim sprite ", anim_sprite, " does not exist!");
			}
		}
}