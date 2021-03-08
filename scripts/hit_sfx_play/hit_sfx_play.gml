///@func hit_sfx_play(sounds,[pitch_shift])
///@param sounds
///@param [pitch_shift]
function hit_sfx_play() {
	var _index = argument[0],
		_pitch = argument_count > 1 ? argument[1] : hit_sound_pitch_variance;
	
	if (_index != -1)
		{
		if (is_array(_index))
			{
			_index = _index[irandom(array_length(_index) - 1)];
			}
		var _snd = audio_play_sound(_index, 10, false);
		audio_sound_pitch(_snd, 1 + random_range(-_pitch, _pitch));
		}


}
