///Defines all of the values needed for things like the CSS, win screen, etc. for every character
///@func character_data_get_all()
///@desc Returns an array with the data for all characters
function character_data_get_all() {
	static _data =
		[
		Character_Define
			(
			"Blocky",
			character_init0,
			spr_render0,
			spr_css0,
			spr_palette0,
			spr_portrait0,
			spr_stock0,
			song_victory0,
			["texture_character0"],
			),
		Character_Define
			(
			"Polygon",
			character_init1,
			spr_render0,
			spr_css1,
			spr_palette1,
			spr_portrait0,
			spr_stock0,
			song_victory0,
			["texture_character1", "texture_character0"],
			),
		Character_Define
			(
			"Vertex",
			character_init2,
			spr_render0,
			spr_css2,
			spr_palette2,
			spr_portrait0,
			spr_stock0,
			song_victory0,
			["texture_character2", "texture_character0"],
			),
		Character_Define
			(
			"Random",
			-1,
			spr_render0,
			spr_css_random,
			spr_palette_random,
			palette_colors_get_from_sprite(spr_palette0),
			spr_portrait0,
			spr_stock0,
			song_victory0,
			undefined,
			),
		];
	return _data;
}