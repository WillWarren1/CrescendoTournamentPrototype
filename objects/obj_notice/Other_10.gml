/// @description

// Inherit the parent event
event_inherited();

if (lifetime < 10)
	{
	image_alpha = lifetime / 10;
	}
	
y = lerp(y, ystart - 30, 0.1);