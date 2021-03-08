///@func Player_Shader_Set()
///@desc Set up the player shader to draw the player with
function Player_Shader_Set() {

	//Light change and alpha change
	var _light = 0.0, _alpha = 1.0;
	
	if (hurtbox.inv_type == INV.invincible && !is_dead())
		{
		_light = 0.2;
		_alpha = 0.5;
		}

	//Set up the shader
	palette_shader_set(palette_sprite, player_color, _light, _alpha, fade_value, player_outline, player_outline_color, anim_sprite, anim_frame);


}
