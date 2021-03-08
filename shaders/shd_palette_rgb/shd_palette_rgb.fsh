//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette;
uniform float current;
uniform vec2 texel;
uniform vec4 UV;

uniform float fade_value;
uniform float light_value;
uniform float alpha_value;
uniform int outline;
uniform vec2 outline_texel;
uniform vec4 outline_color;

void main()
	{
	//Check if the color is any of the colors at the start of the palette
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float column = UV.x;
	for(float row = UV.y; row < UV.w; row += texel.y)
		{
		if (gl_FragColor.a != 0. && gl_FragColor.rgb == texture2D(palette, vec2(column, row)).rgb)
			{
			//Replace it with the correct color
			gl_FragColor = v_vColour * texture2D(palette, vec2(column + (current * texel.x), row));
			break;
			}
		}
		
	//Values
	gl_FragColor.rgb += light_value;
	gl_FragColor.rgb *= fade_value;
	gl_FragColor.a	 *= alpha_value;
	
	//Outline
	if (outline == 1 && gl_FragColor.a == 0.)
		{
		if (texture2D(gm_BaseTexture, v_vTexcoord + vec2( outline_texel.x, 0.)).a > 0. ||
			texture2D(gm_BaseTexture, v_vTexcoord + vec2(-outline_texel.x, 0.)).a > 0. ||
			texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.,  outline_texel.y)).a > 0. ||
			texture2D(gm_BaseTexture, v_vTexcoord + vec2(0., -outline_texel.y)).a > 0.)
			{
			gl_FragColor = outline_color;
			}
		}
		/*
		//Find the outline color based on the color of the pixel it is closest to
		float max_row = UV.y;
		for(float check = UV.y; check < UV.w; check += texel.y)
			{
			if (texture2D(gm_BaseTexture, v_vTexcoord + vec2( outline_texel.x, 0)) == texture2D(palette, vec2(UV.x, check)))
				{
				max_row = max(max_row, check);
				}
			if (texture2D(gm_BaseTexture, v_vTexcoord + vec2(-outline_texel.x, 0)) == texture2D(palette, vec2(UV.x, check)))
				{
				max_row = max(max_row, check);
				}
			if (texture2D(gm_BaseTexture, v_vTexcoord + vec2(0,  outline_texel.y)) == texture2D(palette, vec2(UV.x, check)))
				{
				max_row = max(max_row, check);
				}
			if (texture2D(gm_BaseTexture, v_vTexcoord + vec2(0, -outline_texel.y)) == texture2D(palette, vec2(UV.x, check)))
				{
				max_row = max(max_row, check);
				}
			}
		gl_FragColor = texture2D(palette, vec2(outline_last, max_row));
		}
		//*/
	}