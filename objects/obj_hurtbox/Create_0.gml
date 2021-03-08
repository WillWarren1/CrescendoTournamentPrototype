/// @description
 

 

/*GENERAL HURTBOX VARIABLES*/
image_blend = hurtbox_draw_color;
image_speed = 0;
owner = noone;
inv_type = INV.normal;
inv_frame = 0;
inv_override = true;

/*ON-HIT SCRIPTS*/
hurtbox_setup
	(
	hurtbox_melee_hit_player,
	hurtbox_magnetbox_hit_player,
	hurtbox_grab_hit_player,
	hurtbox_targetbox_hit_player,
	hurtbox_detectbox_hit_player,
	hurtbox_windbox_hit_player,
	hurtbox_projectile_hit_player,
	);