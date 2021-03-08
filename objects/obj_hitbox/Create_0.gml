/// @description
 

 

/*GENERAL HITBOX VARIBLES*/
lifetime = 10;
owner = noone;
facing = 1;
shape = HITBOX_SHAPE.square;
has_hit = false;
has_been_blocked = false;
can_be_parried = true;
priority = 0;
hit_fx_style = HIT_FX.normal_weak;
hit_sfx = hit_sound_default;
list = ds_list_create();
destroy = false;

/*OVERLAY VARIABLES*/
overlay_sprite = -1;
overlay_frame = 0;
overlay_speed = image_speed;
overlay_scale = 2;
overlay_angle = 0;
overlay_color = c_white;
overlay_alpha = 1.0;
overlay_facing = 1;