///@func is_finishing_blow(full_knockback,target_x,target_y,angle,hitstun_frames,target_id)
///@param full_knockback
///@param target_x
///@param target_y
///@param angle
///@param hitstun_frames
///@param target_id
///@desc Tries to calculate if the attack is a guaranteed finisher
///It checks 3 DI angles and walls (possible teching)
function is_finishing_blow(argument0, argument1, argument2, argument3, argument4, argument5) {
	var _kb, _tx, _ty, _angle, _stun, _t;
	_kb = argument0;
	_tx = argument1;
	_ty = argument2;
	_angle = argument3;
	_stun = argument4;
	_t = argument5;

	var _hsp, _vsp;
	var _ko_count = 0;

	if (setting().show_launch_trajectories)
		{
		with(obj_launch_trajectory_point)
			{
			instance_destroy();
			}
		}

	for(var i = 0; i < 3; i++)
		{
		//Change the angles to be checked
		if (i == 1) then _angle += di_angle;
		if (i == 2) then _angle -= di_angle * 2;
		_hsp = lengthdir_x(_kb, _angle);
		_vsp = lengthdir_y(_kb, _angle);
		_tx = argument1;
		_ty = argument2;
	
		//Checks until the hitstun would be over (since you can airdodge to cancel movement)
		for(var m = 0; m < _stun; m++)
			{
			var _loop = true;
		
			//"Gravity and Friction"
			_hsp = approach(_hsp, 0, _t.air_friction);
			if (_vsp < _t.max_fall_speed) then _vsp = min(_vsp + _t.hitstun_grav, _t.max_fall_speed);
		
			//"Movement"
			_tx += _hsp;
			_ty += _vsp;
		
			//Collide with blocks
			with(_t)
				{
				if (collision(_tx, _ty, flags_create(FLAG.solid)))
					{
					if (setting().show_launch_trajectories)
						{
						with(instance_create_layer(_tx, _ty, layer, obj_launch_trajectory_point))
							{
							image_index = 3;
							}
						_loop = false;
						}
					else
						{
						_loop = false;
						}
					}
				}
			
			//Out of room check
			if (_tx < 0 || _ty < 0 || _tx > room_width || _ty > room_height)
				{
				_ko_count++;
				break;
				}
			
			//Trajectory
			if (setting().show_launch_trajectories && (m % 2 == 0 || m == _stun - 1))
				{
				with(instance_create_layer(_tx, _ty, layer, obj_launch_trajectory_point))
					{
					if (m == 0)
						{
						image_index = 2;
						}
					else if (m == _stun - 1)
						{
						image_index = 1;
						}
					}
				}
			
			//Break out of loop
			if (!_loop) then break;
			}
		}
	
	if (_ko_count == 3) then return true;

	return false;


}
