///@func palette_shader_set(palette_sprite,color_index,[light],[alpha],[fade],[outline],[outline_color],[sprite],[subimage])
///@param palette_sprite
///@param color_index
///@param [light]
///@param [alpha]
///@param [fade]
///@param [outline]
///@param [outline_color]
///@param [sprite]
///@param [subimage]
function palette_shader_set() {

	var _palette = argument[0];
	var _col = argument[1];
	var _light = argument_count > 2 ? argument[2] : 0.0;
	var _alpha = argument_count > 3 ? argument[3] : 1.0;
	var _fade = argument_count > 4 ? argument[4] : 0.0;
	var _outline = argument_count > 5 ? argument[5] : false;
	var _outline_color = argument_count > 6 ? argument[6] : c_white;
	var _sprite = argument_count > 7 ? argument[7] : sprite_index;
	var _subimage = argument_count > 8 ? argument[8] : image_index;
	
	//Set shader and uniforms
	var _pal = sprite_get_texture(_palette, 0);
	var _tw = texture_get_texel_width(_pal);
	var _th = texture_get_texel_height(_pal);
	var _uv = texture_get_uvs(_pal);
	var _tex = sprite_get_texture(_sprite, _subimage);
	var _ptw = texture_get_texel_width(_tex);
	var _pth = texture_get_texel_height(_tex);
	shader_set(shd_palette);
	
	texture_set_stage(smp_p, _pal);
	shader_set_uniform_f(uni_c, _col);
	shader_set_uniform_f(uni_t, _tw, _th);
	shader_set_uniform_f(uni_uv, _uv[0], _uv[1], _uv[2], _uv[3]);
	
	shader_set_uniform_f(uni_l, _light);
	shader_set_uniform_f(uni_a, _alpha);
	shader_set_uniform_f(uni_f, _fade);
	shader_set_uniform_i(uni_o, _outline);
	shader_set_uniform_f(uni_ot, _ptw, _pth);
	shader_set_uniform_f
		(
		uni_oc, 
		color_get_red  (_outline_color) / 255,
		color_get_green(_outline_color) / 255,
		color_get_blue (_outline_color) / 255,
		1.0
		);


}
