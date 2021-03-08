varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float fade_amount;

void main()
	{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.r *= fade_amount;
	gl_FragColor.g *= fade_amount;
	gl_FragColor.b *= fade_amount;
	}