///@func palette_shader_simple_set([palette_sprite], [color])
///@desc Sets up the palette swapper shader
///@param [palette_sprite]
///@param [color]
function palette_shader_simple_set(argument0, argument1) {
	var _palette = argument0;
	var _col = argument1;
	//Set shader and uniforms
	var _pal = sprite_get_texture(_palette, 0);
	var _tw = texture_get_texel_width(_pal);
	var _th = texture_get_texel_height(_pal);
	var _uv = texture_get_uvs(_pal);
	
	shader_set(shd_palette_simple);

	texture_set_stage(smp_p, _pal);
	shader_set_uniform_f(uni_c, _col);
	shader_set_uniform_f(uni_t, _tw, _th);
	shader_set_uniform_f(uni_uv, _uv[0], _uv[1], _uv[2], _uv[3]);


}
