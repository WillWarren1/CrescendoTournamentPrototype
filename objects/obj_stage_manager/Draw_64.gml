/// @description Music Loop Debug
/*
draw_set_color(c_white);
draw_rectangle(10, screen_height - 20, screen_width - 10, screen_height - 10, false);
var _total = audio_sound_length(music);
var _percent = audio_sound_get_track_position(music) / _total;
draw_set_color(c_black);
draw_rectangle(10, screen_height - 20, 10 + ((screen_width - 20) * _percent), screen_height - 10, false);
var _loop = music_loop_pos / _total;
var _intro = music_intro_pos / _total;
draw_set_color(c_red);
draw_circle(10 + ((screen_width - 20) * _loop), screen_height - 15, 4, false);
draw_set_color(c_blue);
draw_circle(10 + ((screen_width - 20) * _intro), screen_height - 15, 4, false);
*/