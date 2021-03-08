///Initializes Player variables
function Player_Init_End() {
	//Called by obj_game after the device is assigned to the player

	//Set up character specific variables
	script_execute(character_script);

	//Name
	name = character_data_get(character, CHARACTER_DATA.name);

	//Palette
	palette_sprite = character_data_get(character, CHARACTER_DATA.palette);
	palette = palette_slice(character_data_get(character, CHARACTER_DATA.palette_data), player_color);

	//Sprites
	portrait = character_data_get(character, CHARACTER_DATA.portrait);
	render = character_data_get(character, CHARACTER_DATA.render);
	stock_sprite = character_data_get(character, CHARACTER_DATA.stock_sprite);

	//Animation base
	anim_reset();

	//Entrance state
	state_set(PLAYER_STATE.entrance);

	//Collision box
	collision_box_change();

	//Move to the front
	Player_Move_To_Back();
}