///@func apply_angle_flipper(base_angle,flipper,[attacking_player],[target_player],[knockback],[facing])
///@param base_angle
///@param flipper
///@param [attacking_player]
///@param [target_player]
///@param [knockback]
///@param [facing]
///Assumed to be run by the hit player
///Base angles should default to facing right
function apply_angle_flipper() {
	var _angle = argument[0];
	var _flipper = argument[1];
	var _player = argument_count > 2 ? argument[2] : noone;
	var _target = argument_count > 3 ? argument[3] : noone;
	var _knockback = argument_count > 4 ? argument[4] : 0;
	var _facing = argument_count > 5 ? argument[5] : _player.facing;
	switch(_flipper)
		{
		case FLIPPER.standard:
			//Flips the angle based on the direction the player was facing
			if (_facing == -1)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.from_player_center:
			//Hits away from the player's origin
			if (_player.x != _target.x || _player.y != _target.y)
				{
				_angle = point_direction(_player.x, _player.y, _target.x, _target.y);
				}
			else
				{
				_angle = default_knockback_angle;
				}
			break;
		case FLIPPER.toward_player_center:
			//Hits toward the player's origin
			if (_player.x != _target.x || _player.y != _target.y)
				{
				_angle = point_direction(_target.x, _target.y, _player.x, _player.y);
				}
			else
				{
				_angle = default_knockback_angle;
				}
			break;
		case FLIPPER.from_player_center_horizontal:
			//Flips based on the target's position relative to the player
			if (_target.x < _player.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.toward_player_center_horizontal:
			//Flips based on the target's position relative to the player
			if (_target.x >= _player.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.from_hitbox_center:
			//Hits away from the center of the hitbox
			if (other.x != _target.x || other.y != _target.y)
				{
				_angle = point_direction(other.x, other.y, _target.x, _target.y);
				}
			else
				{
				_angle = default_knockback_angle;
				}
			break;
		case FLIPPER.toward_hitbox_center:
			//Hits toward the center of the hitbox
			if (other.x != _target.x || other.y != _target.y)
				{
				_angle = point_direction(_target.x, _target.y, other.x, other.y);
				}
			else
				{
				_angle = default_knockback_angle;
				}
			break;
		case FLIPPER.from_hitbox_center_horizontal:
			//Flips based on the target's position relative to the player
			if (_target.x < other.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.toward_hitbox_center_horizontal:
			//Flips based on the target's position relative to the player
			if (_target.x >= other.x)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.sakurai:
			with(_target)
				{
				if (on_ground())
					{
					_angle = (_knockback >= s_angle_knockback_threshold) ? s_angle_high_angle : s_angle_low_angle;
					}
				else
					{
					_angle = s_angle_aerial_angle;
					}
				}
			//Flip the angle
			if (_facing == -1)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.sakurai_reverse:
			with(_target)
				{
				if (on_ground())
					{
					_angle = (_knockback > s_angle_knockback_threshold) ? s_angle_high_angle : s_angle_low_angle;
					}
				else
					{
					_angle = s_angle_aerial_angle;
					}
				}
			//Flip the angle (reversed)
			if (_facing == 1)
				{
				_angle = 180 - _angle;
				}
			break;
		case FLIPPER.autolink:
			//Find the angle that will send towards the player's next position
			var _new_x = _player.hsp * autolink_speed_multiplier;
			var _new_y = _player.vsp * autolink_speed_multiplier;
			_angle = point_direction(0, 0, _new_x, _new_y);
			break;
		case FLIPPER.autolink_center:
			//Find the angle that will send towards the player's next position
			var _new_x = _player.hsp * autolink_speed_multiplier;
			var _new_y = _player.vsp * autolink_speed_multiplier;
			_angle = point_direction(_target.x, _target.y, _player.x + _new_x, _player.y + _new_y);
			break;
		case FLIPPER.fixed:
			break;
		default: break;
		}
	return _angle;
}