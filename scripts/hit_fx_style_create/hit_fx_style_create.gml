///@func hit_fx_style_create(fx_style, angle, hitbox, knockback, [layer])
///@param fx_style
///@param angle
///@param hitbox
///@param knockback
///@param [layer]
function hit_fx_style_create() {
	var _style = argument[0],
		_angle = argument[1],
		_hitbox = argument[2],
		_knock = argument[3],
		_layer = argument_count > 4 ? argument[4] : "FX_Layer";
	
	//If the user passes an array as the style, it runs each one in turn
	var _styles = [];
	if (is_array(_style))
		{
		_styles = _style;
		}
	else
		{
		_styles = [_style];
		}

	for(var i = 0; i < array_length(_styles); i++)
		{
		switch(_styles[i])
			{
			#region Normal Weak
			case HIT_FX.normal_weak:
				var _fx = fx_create(spr_hit_normal_weak, 1, 0, 13, x, y, 1, _angle, _layer);
				_fx.fx_blend = make_color_hsv(irandom_range(25, 40), 217, 255);
				_fx.fx_yscale *= choose(-1, 1);

				//Powerful Knockback
				if (_knock > 16)
					{
					fx_create_action_lines(15, x, y, irandom(10), _layer);
					}
						
				//Camera shake
				camera_shake(_knock div 2);
		
				//Hit fade
				fade_value = 0.3;
				break;
			#endregion
			#region Normal Medium
			case HIT_FX.normal_medium:
				var _fx = fx_create(spr_hit_normal_weak, 1, 0, 13, x, y, 1, _angle, _layer);
				_fx.fx_yscale *= choose(-1, 1);
				_fx.fx_blend = $338bff;
				var _fx = fx_create(spr_hit_normal_medium, 1, 0, 14, x, y, 2, _angle, _layer);
				_fx.fx_yscale *= choose(-1, 1);
				_fx.fx_blend = $66e0ff;
			
				//Powerful Knockback
				if (_knock > 16)
					{
					fx_create_action_lines(15, x, y, irandom(10), _layer);
					}
					
				//Camera shake
				camera_shake(_knock div 2);
		
				//Hit fade
				fade_value = 0.4;
				break;
			#endregion
			#region Normal Strong
			case HIT_FX.normal_strong:
				var _fx = fx_create(spr_hit_strong_initial_hit, 1, 0, 4, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 1.5, irandom(360), _layer);
				_fx.fx_blend = $457dff;
				var _fx = fx_create(spr_hit_normal_strong, 1, 0, 13, x, y, 1, _angle - 30, _layer);
				_fx.fx_blend = make_color_hsv(irandom_range(25, 40), 217, 255);
		
				//Powerful Knockback
				if (_knock > 16)
					{
					fx_create_action_lines(15, x, y, irandom(10), _layer);
					var _fx = fx_create(spr_hit_strong_lightning, 1, 0, 7, x, y, 2, _angle, _layer);
					_fx.fx_blend = $457dff;
					}
			
				//Camera shake
				camera_shake(_knock div 2);
		
				//Hit fade
				fade_value = 0.5;
				break;
			#endregion
			#region Slash Weak
			case HIT_FX.slash_weak:
				var _fx = fx_create(spr_hit_normal_weak, 1, 0, 13, x, y, 1, _angle, _layer);
				_fx.fx_blend = $26ff64;
				_fx.fx_yscale *= choose(-1, 1);
				var _fx = fx_create(spr_hit_slash, 1, 0, 11, x, y, 1.5, _angle, _layer);
				_fx.fx_yscale = choose(-1, 1);
				_fx.fx_alpha = 0.5;
				
				//Powerful Knockback
				if (_knock > 16)
					{
					fx_create_action_lines(15, x, y, irandom(10), _layer);
					}	
					
				//Camera shake
				camera_shake(_knock div 2);
		
				//Hit fade
				fade_value = 0.5;
				break;
			#endregion
			#region Slash Medium
			case HIT_FX.slash_medium:
				var _fx = fx_create(spr_hit_normal_medium, 1, 0, 14, x, y, 2, _angle, _layer);
				_fx.fx_yscale *= choose(-1, 1);
				_fx.fx_blend = $42f5b0;
				var _fx = fx_create(spr_hit_slash2, 1, 0, 15, x, y, 1.5, _angle, _layer);
				_fx.fx_blend = $26ff64;
				var _fx = fx_create(spr_hit_slash, 1, 0, 11, x, y, 1.5, _angle, _layer);
				_fx.fx_yscale = choose(-1, 1);
				_fx.fx_alpha = 0.5;
				
				//Powerful Knockback
				if (_knock > 16)
					{
					fx_create_action_lines(15, x, y, irandom(10), _layer);
					}
				
				//Camera shake
				camera_shake(_knock div 2);
		
				//Hit fade
				fade_value = 0.5;
				break;
			#endregion
			#region Slash Strong
			case HIT_FX.slash_strong:
				var _fx = fx_create(spr_hit_normal_strong, 1, 0, 13, x, y, 1, _angle - 30, _layer);
				_fx.fx_blend = $42f5b0;
				var _fx = fx_create(spr_hit_slash2, 1, 0, 15, x, y, 1.5, _angle + 5, _layer);
				_fx.fx_blend = $26ff64;
				var _fx = fx_create(spr_hit_slash2, 1, 0, 15, x, y, 1.5, _angle - 5, _layer);
				_fx.fx_blend = $26ff64;

				//Powerful Knockback
				if (_knock > 16)
					{
					fx_create_action_lines(15, x, y, irandom(10), _layer);
					}

				//Camera shake
				camera_shake(_knock div 2);
		
				//Hit fade
				fade_value = 0.5;
				break;
			#endregion
			
			#region Magic
			case HIT_FX.magic:
				var _fx = fx_create(spr_hit_magic, 1, 0, 13, x, y, 1, _angle, _layer);
				_fx.fx_yscale *= choose(-1, 1);
				_fx.fx_blend = make_color_hsv(irandom_range(180, 255), 87, 255);
				var _fx = fx_create(spr_hit_darkness, 1, 0, 28, x, y, 2, _angle, _layer);
				_fx.fx_yscale *= choose(-1, 1);

				//Camera shake
				camera_shake(_knock div 2);
		
				//Hit fade
				fade_value = 0.5;
				break;
			#endregion
			#region Grab
			case HIT_FX.grab:
				//With the target
				var _dir = irandom(360);
				var _fx = fx_create(spr_hit_grab, 0, 0, 15, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 3, _dir, "FX_Layer_Below");
				_fx.shrink = 0.88;
				_fx.spin = 9;
				_fx.fade = true;
				var _fx = fx_create(spr_hit_grab, 0, 0, 15, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 3, _dir + 180, "FX_Layer_Below");
				_fx.shrink = 0.88;
				_fx.spin = 9;
				_fx.fade = true;

				//Camera shake
				var _shake = (2 + ((damage / 20) * weight_multiplier) div 2);
				camera_shake(_shake);
				break;
			#endregion
			#region Explosion
			case HIT_FX.explosion:
				fx_create(spr_hit_explosion, 1, 0, 17, x, y, 1, irandom(360), _layer);
				fx_create_action_lines(15, x, y, irandom(10), _layer);

				//Camera shake
				camera_shake(clamp(_knock div 1.8, 1, 15));
				break;
			#endregion
			#region Splash
			case HIT_FX.splash:
				var _fx = fx_create(spr_hit_water, 1, 0, 24, x, y, 2, _angle, _layer);
				_fx.fx_yscale *= choose(-1, 1);
				_fx.fx_blend = $fab387;

				//Camera shake
				camera_shake(clamp(_knock div 1.8, 1, 15));
				break;
			#endregion
			#region Shield
			case HIT_FX.shield:
				fx_create(spr_hit_shield, 1, 0, 11, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 1, irandom(360));
				break;
			#endregion
			#region Shield Projectile
			case HIT_FX.shield_projectile:
				fx_create(spr_hit_shield, 1, 0, 11, x, y, 1, irandom(360));
				break;
			#endregion
			#region Spin
			case HIT_FX.spin:
				var _fx = fx_create(spr_hit_spin, 1, 0, 27, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 1.5, _angle - 30, _layer);
				break;
			#endregion
			#region Lines
			case HIT_FX.lines:
				fx_create_action_lines(15, x, y, irandom(10), _layer);
				break;
			#endregion
			#region Emphasis
			case HIT_FX.emphasis:
				//Background clear
				background_clear_activate(20, palette_color_get(_hitbox.owner.palette, 0));
				//Hit fade
				fade_value = 0;
				break;
			#endregion
			#region Shine
			case HIT_FX.shine:
				var _fx = fx_create(spr_shine_attack_long, 1, 0, 15, _hitbox.x, _hitbox.y, 2, _angle, _layer);
				_fx.spin = 1;
				break;
			#endregion
	
			#region None
			case HIT_FX.none:
			default: break;
			#endregion
			}
		}
}