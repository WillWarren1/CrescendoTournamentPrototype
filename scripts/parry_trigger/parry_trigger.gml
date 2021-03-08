///@func parry_trigger(hitbox,stun_attacker,target)
///@param hitbox
///@param stun_attacker
///@param target
function parry_trigger() {
	var _hit = argument[0],
		_atk = argument[1],
		_tar = argument[2];
	
	if (_hit.can_be_parried)
		{
		if (_atk)
			{
			with(_hit.owner)
				{
				has_been_parried = true;
				self_hitlag_frame = parry_hitlag;
				}
			}
		}

	with(_tar)
		{
		state_phase = PHASE.parry;
		state_frame = parry_trigger_time;
		self_hitlag_frame = parry_hitlag;
		}
	
	audio_play_sound(snd_parry, 0, false);


}
