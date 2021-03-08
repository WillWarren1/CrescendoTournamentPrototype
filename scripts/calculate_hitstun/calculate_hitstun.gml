///@func calculate_hitstun(base_knockback,weight,damage,knockback_scaling,hitstun_multiplier,[custom_hitstun])
///@param base_knockback
///@param weight
///@param damage
///@param knockback_scaling
///@param hitstun_multiplier
///@param [custom_hitstun]
function calculate_hitstun() {
	var _b, _w, _d, _s, _m, _c;
	_b = argument[0];
	_w = argument[1];
	_d = argument[2];
	_s = argument[3];
	_m = argument[4];
	_c = argument_count > 5 ? argument[5] : -1;
	//Rivals of Aether Formula
	//First: return b*4*((w-1)*0.6+1)+d*0.12*s*4*m*w;
	//Current:
	return _c == -1
		? ceil(_b * hitstun_base_multiplier * ((_w - 1) * hitstun_weight_multiplier + 1) + _d * hitstun_damage_multiplier * _s * hitstun_knockback_multiplier * _m * _w)
		: _c;


}
