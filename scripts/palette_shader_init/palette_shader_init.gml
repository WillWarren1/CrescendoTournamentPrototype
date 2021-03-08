///@func palette_shader_init()
///@desc Cache all of the shader uniforms to be used later
function palette_shader_init() {
	uni_l = shader_get_uniform(shd_palette, "light_value");
	uni_a = shader_get_uniform(shd_palette, "alpha_value");
	uni_f = shader_get_uniform(shd_palette, "fade_value");
	uni_o = shader_get_uniform(shd_palette, "outline");
	uni_t = shader_get_uniform(shd_palette, "texel");
	uni_c = shader_get_uniform(shd_palette, "current");
	uni_uv = shader_get_uniform(shd_palette, "UV");
	uni_ot = shader_get_uniform(shd_palette, "outline_texel");
	uni_oc = shader_get_uniform(shd_palette, "outline_color");
	smp_p = shader_get_sampler_index(shd_palette, "palette");
}