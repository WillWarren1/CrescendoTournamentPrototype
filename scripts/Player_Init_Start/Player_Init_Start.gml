///Initializes Player variables
function Player_Init_Start() {
	//Character
	character = 0;
	character_script = -1;

	//State
	state = PLAYER_STATE.idle;
	state_script = -1;
	state_frame = 0;
	state_time = 0;
	state_phase = 0;
	state_facing = 0;

	//Player attributes
	player_number = 0;
	player_color = 0;
	player_outline_color = c_black;
	player_profile = 0;
	player_rhythm_meter = 0;
	beat_modifier = 1;
	usingBeatBonus = false;

	//Other state variables
	jump_is_shorthop = false;
	jump_is_midair_jump = false;
	jump_is_dash_jump = false;
	can_fastfall = true;
	double_jumps = 1;
	airdodges_max = 1;
	airdodges = airdodges_max;
	airdodge_is_directional = false;
	airdodge_direction = 90;
	shield_shift_x = 0;
	shield_shift_y = 0;
	parry_stun_time = parry_default_stun_time;
	has_been_parried = false;
	magnet_goal_x = 0;
	magnet_goal_y = 0;
	tech_buffer = tech_lockout_time;
	ledge_id = 0;
	ledge_grab_timeout = 0;
	wall_cling_timeout = 0;
	wall_jump_timeout = 0;
	wall_jumps = 0;
	self_hitlag_frame = 0;
	attack_script = -1;
	attack_draw_script = -1;
	attack_frame = 0;
	attack_phase = 0;
	charge = 0;
	landing_lag = 0;
	grab_hold_x = 0;
	grab_hold_y = 0;
	grab_hold_enable = true;
	grab_hold_id = noone;
	grabbed_id = noone;
	throw_stick_has_reset = false;

	//Controller cached values
	is_cpu = false;
	cpu_type = CPU_TYPE.attack;
	device = -1;
	device_type = DEVICE.controller;
	custom_controls = [];
	control_states_l = [];
	control_states_r = [];
	control_tilted_l = 0;
	control_tilted_r = 0;
	control_flicked_l = 0;
	control_flicked_r = 0;

	//Fill array for stick buffer
	for(var m = 0; m < max_buffer_length; m++)
		{
		//Add in a new entry
		var _new_l = [];
		_new_l[@ CONTROL_STICK.xval] = 0;
		_new_l[@ CONTROL_STICK.yval] = 0;
		_new_l[@ CONTROL_STICK.dir] = 90;
		_new_l[@ CONTROL_STICK.dist] = 0;
		_new_l[@ CONTROL_STICK.spd] = 0;
		control_states_l[@ m] = _new_l;
		var _new_r = [];
		_new_r[@ CONTROL_STICK.xval] = 0;
		_new_r[@ CONTROL_STICK.yval] = 0;
		_new_r[@ CONTROL_STICK.dir] = 90;
		_new_r[@ CONTROL_STICK.dist] = 0;
		_new_r[@ CONTROL_STICK.spd] = 0;
		control_states_r[@ m] = _new_r;
		}
	
	//Special control settings
	scs_short_hop_aerial = false;
	scs_tap_jump = false;
	scs_AB_smash = false;
	scs_smash_stick = false;
	scs_switch_sticks = false;
	scs_auto_walk = false;
	scs_right_stick_input = INPUT.attack;

	//Make a ds_list to store the last few frames of input (input buffer)
	input_buffer = ds_list_create();
	input_buffer_paused = ds_list_create();
	for(var i = 0; i < (INPUT.length * 2); i++) //Multiply by 2 for press / hold
		{
		input_buffer[| i] = max_buffer_length;
		input_buffer_paused[| i] = false;
		}
	has_paused_inputs = false;
	
	//Speeds
	Speed_Init();

	facing = (x != room_width div 2 ? sign(room_width div 2 - x) : 1); //Face the center of the stage

	//Damage / Knockback
	damage = 0;
	knockback_dir = 0;
	knockback_spd = 0;
	stored_hitstun = 0;
	stored_state = PLAYER_STATE.in_hitstun;
	asdi_multiplier = 1;
	drift_di_multiplier = 1;
	di_angle = DI_max;
	ko_property = noone; //Determines SD's / normal KO's
	stock = setting().match_stock;
	points = 0; //time no-stock match
	stamina = setting().match_stamina;
	any_hitbox_has_hit = false;
	any_hitbox_has_been_blocked = false;
	can_hitfall = false;
	can_tech = true;

	//My Hitboxes List - Keeps track of all of the user's hitboxes
	my_hitboxes = ds_list_create();
	//Hitbox Groups - Each group has an array that stores what has been hit
	//Two hitboxes in the same group cannot hit the same target
	//Prevents multi-hitbox moves from dealing massive damage
	hitbox_groups = array_create(hitbox_groups_max, undefined);
	for(var i = 0; i < hitbox_groups_max; i++)
		{
		hitbox_groups[@ i] = [];
		}
	
	//Animation
	anim_current = -1 //Array of current animation, if any
	anim_sprite = -1;
	anim_frame = anim_frame_normal;
	anim_speed = anim_speed_normal;
	anim_angle = anim_angle_normal;
	anim_scale = anim_scale_normal;
	anim_color = anim_color_normal;
	anim_alpha = anim_alpha_normal;
	anim_offsetx = anim_offset_normal;
	anim_offsety = anim_offset_normal;
	anim_loop = anim_loop_normal;
	anim_finish = anim_finish_normal;
	renderer = obj_player_renderer;
	fade_value = 1;
	damage_text_random = 0;
	damage_text_x = 0;
	damage_text_y = 0;

	//The state log is for debug use.
	//It keeps track of the states the object has been in.
	state_log = ds_list_create();
	ds_list_add(state_log, state);

	//Attacks and sprites
	my_states = ds_list_create();
	my_attacks = ds_map_create();
	my_sprites = ds_map_create();
	attack_cooldown = ds_map_create();

	//Color palettes
	palette_shader_init();
	
	//Custom Variables in Attacks & the Custom Script
	custom_attack_struct = { };
	custom_script_struct = { };
	custom_ids_struct = { };
}