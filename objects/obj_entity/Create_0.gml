/// @description
/*
- Entities are non-player objects that belong to players
- Entities can create their own hitboxes and hurtboxes
- Entities use the palette of the player that creates them
*/
 

 

Hitbox_Owner_Init();

palette_shader_init();

//When created, the player will pass their ID
owner = noone;

//Speeds
hsp = 0;
vsp = 0;

//Collision flag
flags = 0;

//Custom Entity Variables
custom_entity_struct = { };
custom_ids_struct = { };