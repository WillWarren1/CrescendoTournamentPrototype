varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette;
uniform float current;
uniform vec2 texel;
uniform vec4 UV;

void main()
	{
	//Check if the color is any of the colors at the start of the palette
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float column = UV.x;
	for(float row = UV.y; row < UV.w; row += texel.y)
		{
		vec4 col = texture2D(palette, vec2(column, row));
		//Ignore alpha in the color check
		if ( gl_FragColor.a != 0. && gl_FragColor.rgb == col.rgb)
			{
			//Replace it with the correct color
			gl_FragColor = v_vColour * texture2D(palette, vec2(column + (current * texel.x), row));
			break;
			}
		}
	}