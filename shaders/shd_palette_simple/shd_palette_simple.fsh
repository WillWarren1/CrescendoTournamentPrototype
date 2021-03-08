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
		if (gl_FragColor == texture2D(palette, vec2(column, row)))
			{
			//Replace it with the correct color
			gl_FragColor = v_vColour * texture2D(palette, vec2(column + (current * texel.x), row));
			break;
			}
		}
	}