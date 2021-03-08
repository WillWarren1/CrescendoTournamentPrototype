///@func Character_Define(name,script,render,CSS,palette,portrait,sprite_sprite,music,texture_groups)
///@param name
///@param script
///@param render
///@param CSS
///@param palette
///@param portrait
///@param stock_sprite
///@param music
///@param texture_groups
///@desc Creates all of the data needed for characters outside of the game (CSS, win screen, etc.)
function Character_Define() {
	assert(sprite_exists(argument[4]), "Palette sprite does not exist!");
	var _new = [];
	_new[CHARACTER_DATA.name			] = argument[0];
	_new[CHARACTER_DATA.script			] = argument[1];
	_new[CHARACTER_DATA.render			] = argument[2];
	_new[CHARACTER_DATA.CSS				] = argument[3];
	_new[CHARACTER_DATA.palette			] = argument[4];
	_new[CHARACTER_DATA.palette_data	] = palette_colors_get_from_sprite(argument[4]);
	_new[CHARACTER_DATA.portrait		] = argument[5];
	_new[CHARACTER_DATA.stock_sprite	] = argument[6];
	_new[CHARACTER_DATA.music			] = argument[7];
	_new[CHARACTER_DATA.texture_groups	] = argument[8];
	return _new;


}
