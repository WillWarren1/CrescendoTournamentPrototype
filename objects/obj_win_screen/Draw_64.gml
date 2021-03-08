/// @description
//Alpha
draw_set_alpha((100 - offset) / 100);

	//Player render
	palette_shader_simple_set(palette, color_index);
	
	draw_sprite_ext(render, 0, -offset + (room_width / 1.5), room_height / 2, 2, 2, 0, c_white, 1);
	
	shader_reset();

	//Transformations
	shader_set(shd_position);

	draw_set_font(fnt_win);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(50 + offset, room_height / 3, name);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(55 + offset, room_height / 3 - 4, name);

	shader_reset();

//Reset
draw_set_alpha(1);

//Extra Text
if (setting().replay_record)
	{
	draw_set_font(fnt_consolas);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(room_width - 8, 8, "Press X / Backspace to save a replay");
	}