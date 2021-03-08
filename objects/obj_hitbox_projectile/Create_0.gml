/// @description
 

event_inherited();

/*PROJECTILE VARIBLES*/
visible = true;
damage = 10;
base_knockback = 10;
angle = default_knockback_angle;
hitbox_group = -1;
base_hitlag = 5;
hitlag_scaling = 1;
hitstun_scaling = 1;
custom_hitstun = -1;
knockback_scaling = 1;
angle_flipper = FLIPPER.standard;
di_angle = DI_max;
grounded_angle = default_knockback_angle;
drawing_angle = default_knockback_angle;
knockback_state = PLAYER_STATE.in_hitstun;
knockback_formula = KNOCKBACK_FORMULA.standard;
techable = true;
asdi_multiplier = 1;
drift_di_multiplier = 1;
shieldstun_scaling = 1;
background_clear_allow = true;
hsp = 0;
vsp = 0;
fric = 0;
grav = 0;
hbounce = false;
vbounce = false;
bounce_multiplier = 1.0;
destroy_on_blocks = false;
pass_through_blocks = false;
destroy_outside_room = true;
destroy_on_hit = true;
destroy = false;
hitbox_group_array = [];
custom_projectile_struct = { };

//Color palette uniform cache
palette_shader_init();