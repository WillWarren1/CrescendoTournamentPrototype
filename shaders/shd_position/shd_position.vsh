//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

/*
uniform vec2 xy1;
uniform vec2 xy2;
uniform vec2 xy3;
uniform vec2 xy4;
//*/

void main()
	{
    vec4 object_space_pos = vec4( in_Position.x / 4., in_Position.y, in_Position.z, 1.0);
    gl_Position = (gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos) + vec4(in_Position.x / 1000., in_Position.x / -1000., 0.0, in_Position.x / 750.);
	
	//Distort vertices
	/*
	if (in_TextureCoord.xy == vec2(0.))
		{
		object_space_pos.xy = xy1;
		}
	if (in_TextureCoord.xy == vec2(1., 0.))
		{
		object_space_pos.xy = xy2;
		}
	if (in_TextureCoord.xy == vec2(0., 1.))
		{
		object_space_pos.xy = xy3;
		}
	if (in_TextureCoord.xy == vec2(1., 1.))
		{
		object_space_pos.xy = xy4;
		}
	//*/
	//Position
    //gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	v_vPosition = in_Position.xy;
	}