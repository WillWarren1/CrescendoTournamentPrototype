///@func anim_set(sprite/defined_animation,[frame/is_finish],[speed],[scale],[angle],[color],[alpha],[offsetx],[offsety],[loop],[finish_anim])
///@param sprite/defined_animation
///@param [frame/is_finish]
///@param [speed]
///@param [scale]
///@param [angle]
///@param [color]
///@param [alpha]
///@param [offsetx]
///@param [offsety]
///@param [loop]
///@param [finish_anim]
function anim_set() {
	//Set predefined animation
	if (is_array(argument[0]))
		{
		var _array = argument[0];
	
		//Check if it is a single animation or an array of animations
		if (_array[ANIMATION._FLAG_] == undefined)
			{
			//Single animation
			var _a = _array;
			}
		else
			{
			//Array of animations - choose a random one
			var _a = _array[irandom(array_length(_array) - 1)];
		
			//If it is a single sprite and not an animation, simply set the sprite
			if (!is_array(_a))
				{
				anim_current = -1;
				anim_sprite = _a;
				return;
				}
			}
		
		//If it is NOT transitioning to a finish animation, set the current anim
		if (argument_count > 1 && !argument[1]) then anim_current = _a;
	
		//Set all of the properties from the animation
		anim_sprite =	_a[ANIMATION.sprite];
		anim_frame =	_a[ANIMATION.frame];
		anim_speed =	_a[ANIMATION.speed];
		anim_scale =	_a[ANIMATION.scale];
		anim_angle =	_a[ANIMATION.angle] * facing; //The facing modification is *only* applied when setting it this way - other animations may have their own facing modifications
		anim_color =	_a[ANIMATION.color];
		anim_alpha =	_a[ANIMATION.alpha];
		anim_offsetx =	_a[ANIMATION.offsetx];
		anim_offsety =	_a[ANIMATION.offsety];
		anim_loop =		_a[ANIMATION.loop];
		anim_finish =	_a[ANIMATION.finish];
		return;
		}
	else if (sprite_exists(argument[0]))
		{
		//Sprite
		anim_current = -1;
		anim_sprite = argument[0];

		//Frame
		anim_frame = argument_count > 1 ? argument[1] : anim_frame_normal;
	
		//Speed
		anim_speed = argument_count > 2 ? argument[2] : anim_speed_normal;

		//Scale
		anim_scale = argument_count > 3 ? argument[3] : anim_scale_normal;
	
		//Angle
		anim_angle = argument_count > 4 ? argument[4] : anim_angle_normal;
	
		//Color
		anim_color = argument_count > 5 ? argument[5] : anim_color_normal;
	
		//Alpha
		anim_alpha = argument_count > 6 ? argument[6] : anim_alpha_normal;
	
		//Offset X
		anim_offsetx = argument_count > 7 ? argument[7] : anim_offset_normal;
	
		//Offset Y
		anim_offsety = argument_count > 8 ? argument[8] : anim_offset_normal;
	
		//Loop
		anim_loop = argument_count > 9 ? argument[9] : anim_loop_normal;
	
		//Finish Animation
		anim_finish = argument_count > 10 ? argument[10] : anim_finish_normal;
		}


}
