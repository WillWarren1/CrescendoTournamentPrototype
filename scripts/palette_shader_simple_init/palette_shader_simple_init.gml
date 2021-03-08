///@func palette_shader_simple_init()
///@desc Cache all of the shader uniforms to be used later
function palette_shader_simple_init() {

	uni_t = shader_get_uniform(shd_palette_simple_rgb, "texel");
	uni_c = shader_get_uniform(shd_palette_simple_rgb, "current");
	uni_uv = shader_get_uniform(shd_palette_simple_rgb, "UV");
	smp_p = shader_get_sampler_index(shd_palette_simple_rgb, "palette");


}
