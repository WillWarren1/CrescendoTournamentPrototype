/// @description

event_inherited();

image_speed = 0;

var _s = custom_entity_struct;
var _ids = custom_ids_struct;

_s.lifetime = 300;
_s.pushed_players = false;

//Create solid block
instance_set_flag(id, FLAG.solid, true);

//Hurtbox object
_ids.hurtbox = hurtbox_create(sprite_index);
with(_ids.hurtbox)
	{
	//Scale needs to be larger so projectiles can hit it through the solid block
	image_xscale = 1.1;
	image_yscale = 1.1;
				
	hurtbox_setup
		(
		nspec_build_melee_hit,
		-1,
		-1,
		nspec_build_melee_hit,
		-1,
		-1,
		nspec_build_projectile_hit,
		);
	}