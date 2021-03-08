/// @description
var _cursor = 0;
var _frame = UI_Cursor_Held_Time(_cursor) > 0 ? 1 : 0;
draw_sprite_ext(spr_css_cursor, _frame, UI_Cursor_X(_cursor), UI_Cursor_Y(_cursor), 1, 1, 0, c_white, 1);