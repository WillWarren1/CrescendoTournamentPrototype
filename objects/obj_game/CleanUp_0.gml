/// @description Garbage collection
ds_priority_destroy(hitbox_priority_queue);
ds_list_destroy(player_depth_list);
ds_list_destroy(ordered_player_list);
surface_free(game_surface);
buffer_delete(game_state_buffer);

hitbox_priority_queue = noone;
player_depth_list = noone;
ordered_player_list = noone;
game_surface = noone;

view_camera[0] = -1;

draw_texture_flush();
gc_collect();