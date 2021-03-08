///@func parry_trigger_ult(hitbox,stun_attacker,target)
///@param hitbox
///@param stun_attacker
///@param target
function parry_trigger_ult() {
	var _hit = argument[0],
		_atk = argument[1],
		_tar = argument[2];
	
	if (_hit.can_be_parried)
		{
		if (_atk)
			{
			with(_hit.owner)
				{
				self_hitlag_frame = _tar.parry_ult_freeze_time;
				}
			}
		}

	with(_tar)
		{
		self_hitlag_frame = parry_ult_self_freeze_time;
		hurtbox_inv_set(hurtbox, INV.invincible, parry_ult_self_freeze_time);
		state_frame = 0;
		anim_set(parry_ult_sprite);
		//Parry VFX
		var _fx = fx_create(spr_hit_parry, 1, 0, 16, x, bbox_bottom, 1, choose(-1, 1), "FX_Layer_Below");
		_fx.fx_allow_fade = false;
		fx_create_action_lines(parry_ult_self_freeze_time, x, y, irandom(10));
		}
		
	camera_shake(4);
	background_clear_activate(6, c_black, 0.05);
	audio_play_sound(snd_parry, 0, false);


}
