/// @description Destroy resources
  

//Destory data structures to prevent memory leaks
ds_list_destroy(input_buffer);
ds_list_destroy(input_buffer_paused);
ds_list_destroy(my_hitboxes);
ds_list_destroy(state_log);
ds_list_destroy(my_states);
ds_map_destroy(my_attacks);
ds_map_destroy(my_sprites);
ds_map_destroy(attack_cooldown);

input_buffer = noone;
input_buffer_paused = noone;
my_hitboxes = noone;
state_log = noone;
my_states = noone;
my_attacks = noone;
my_sprites = noone;
attack_cooldown = noone;

//Setting to noone instead of undefined, because otherwise it causes a silent crash with ds_exists occasionally