///@func stage_set_music(song,[intro_length],[loop_position])
///@param song
///@param [intro_length]
///@param [loop_position]
function stage_set_music() {
	var _song = argument[0];
	var _intro = argument_count > 1 ? argument[1] : 0;
	var _loop = argument_count > 2 ? argument[2] : 0;

	with(obj_stage_manager)
		{
		music = audio_play_sound(_song, 0, true);
		music_intro_pos = _intro;
		music_loop_pos = _loop;
		}
}