function css_ui_player_window_create() {
	//Window variables
	state = CSS_PLAYER_WINDOW_STATE.select_character;

	half_width = 0;
	half_height = 0; //--> css_ui_create_player

	custom_controls_current = 0;
	custom_controls_scroll = 0;
	custom_controls_map = -1; //--> css_ui_create_player
	custom_controls_choosing = false;
	custom_controls_array = [];

	profile_current = 0;
	profile_scroll = 0;

	profile_new_name = "";
	profile_new_letter = 0;
	profile_possible_chars = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];

	cursor_number = noone;

	palette_shader_simple_init();


}
