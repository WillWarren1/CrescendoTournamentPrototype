/*
- This script does not need to be run
*/
enum GAME_STATE
	{
	startup,
	normal,
	paused,
	ending,
	}
enum PLAYER_STATE
	{
	idle,
	crouching,
	walking,
	walk_turnaround,
	dashing,
	running,
	run_turnaround,
	run_stop,
	
	jumpsquat,
	aerial,
	
	airdodging,
	wavelanding,
	rolling,
	shielding,
	shield_release,
	shield_break,
	parrying,
	parry_stun,
	spot_dodging,
	
	in_hitlag,
	in_hitstun,
	in_tumble,
	helpless,
	magnetized,
	in_flinch,
	in_balloon,
	in_lag,
	knockdown,
	
	techrolling,
	teching,
	tech_wall_jump,
	
	ledge_snap,
	ledge_hang,
	ledge_getup,
	ledge_jump,
	ledge_roll,
	ledge_attack,
	ledge_tether,
	ledge_trump,
	wall_cling,
	wall_jump,
	
	knocked_out,
	star_ko,
	screen_ko,
	respawning,
	
	attacking,
	grabbing,
	is_grabbed,
	in_grab_release,
	
	lost,
	entrance,
	}
//Gameplay Inputs
enum INPUT
	{
	attack,
	special,
	jump,
	shield,
	grab,
	smash,
	taunt,
	pause,
	
	length,
	}
//Custom Control Inputs for the different device types
enum CC_INPUT_CONTROLLER
	{
	attack,
	special,
	jump,
	shield,
	grab,
	smash,
	taunt,
	beat_boost,
	pause,
	
	short_hop,
	run,
	length,
	}
enum CC_INPUT_KEYBOARD
	{
	attack,
	special,
	jump,
	shield,
	grab,
	smash,
	taunt,
	beat_boost,
	pause,
	
	short_hop,
	run,
	LR,
	LL,
	LU,
	LD,
	RR,
	RL,
	RU,
	RD,
	length,
	}
//(Xbox layout)
enum CONTROLLER
	{
	A,
	B,
	X,
	Y,
	LB,
	RB,
	LT,
	RT,
	START,
	SELECT,
	DPAD,
	}
//Control Stick Directions
enum DIR
	{
	//Cardinal
	right,
	left,
	up,
	down,
	//Diagonal
	up_right,
	up_left,
	down_right,
	down_left,
	//Axis
	horizontal,
	vertical,
	any,
	none,
	}
//Player Invulnerability
enum INV
	{
	normal,
	invincible,
	superarmor,
	shielding,
	powershielding,
	parry,
	parry_ult,
	counter,
	}
enum AIRDODGE_TYPE
	{
	rivals,
	brawl,
	ultimate,
	}
enum WALL_JUMP_TYPE
	{
	rivals,
	smash,
	}
enum SHIELD_TYPE
	{
	melee,
	ultimate,
	rivals,
	}
enum HITBOX_SHAPE
	{
	square = -1,
	circle = -2,
	rotation = -3,
	}
//Angle Flippers
enum FLIPPER
	{
	fixed,
	standard,
	from_player_center,
	toward_player_center,
	from_player_center_horizontal,
	toward_player_center_horizontal,
	from_hitbox_center,
	toward_hitbox_center,
	from_hitbox_center_horizontal,
	toward_hitbox_center_horizontal,
	sakurai,
	sakurai_reverse,
	autolink,
	autolink_center,
	}
//Special Attack Phases (incomplete)
enum PHASE
	{
	//init = -1,
	start = -2,
	//stop = -3,
	//interrupt = -4,
	//on_hit = -5,
	parry = -6,
	detection = -7,
	counter = -8,
	}
//Background Layer Properties
enum BACK
	{
	sprite,
	x,
	y,
	scale,
	parallax_x,
	parallax_y,
	xspd,
	yspd,
	frame,
	length,
	absolute,
	imgspeed,
	script,
	}
enum PROFILE
	{
	name,
	wins,
	games_played,
	custom_controls,
	favorite_skins,
	color,
	autogenerated,
	}
enum HIT_FX
	{
	//Standard
	normal_weak,
	normal_medium,
	normal_strong,
	slash_weak,
	slash_medium,
	slash_strong,
	
	//Single effects
	magic,
	grab,
	explosion,
	splash,
	shield,
	shield_projectile,
	spin,
	lines,
	emphasis,
	shine,
	
	//None
	none,
	
	//Enum end
	length,
	}
enum CPU_TYPE
	{
	idle,
	attack,
	shield_grab,
	shield_attack,
	di_in,
	di_out,
	di_random,
	parry_ult,
	airdodge,
	}
enum PLAYER_DATA
	{
	character,
	color,
	device,
	device_type,
	profile,
	is_random,
	is_cpu,
	cpu_type,
	}
//Character Data
enum CHARACTER_DATA
	{
	name,
	script,
	render,
	CSS,
	palette,
	palette_data,
	portrait,
	stock_sprite,
	music,
	texture_groups,
	}
//Control Stick Properties
enum CONTROL_STICK
	{
	xval,
	yval,
	dir,
	spd,
	dist,
	}
enum STICK_CHECK_TYPE
	{
	current,
	backwards,
	}
enum DEVICE
	{
	controller,
	keyboard,
	none,
	}
enum CSS_PLAYER
	{
	index,
	device,
	device_type,
	character,
	color,
	profile,
	is_cpu,
	cpu_type,
	ready,
	}
enum CSS_CURSOR
	{
	index,
	device,
	device_type,
	holding,
	is_cpu,
	active,
	}
enum CSS_TOKEN 
	{
	index,
	x,
	y,
	is_cpu,
	}
enum UI_CURSOR
	{
	index,
	x,
	y,
	clicked,
	held_time,
	}
enum CSS_STATE
	{
	normal,
	match_settings,
	replays,
	start_match,
	cpu_settings,
	}
enum CSS_PLAYER_WINDOW_STATE
	{
	select_character,
	select_profile,
	create_profile,
	controls,
	control_set,
	playtesting,
	ready,
	}
//Animation Properties
enum ANIMATION
	{
	_FLAG_,
	sprite,
	frame,
	speed,
	scale,
	angle,
	color,
	alpha,
	offsetx,
	offsety,
	loop,
	finish,
	}
//Menu Virtual Button Properties
enum VB
	{
	confirm,
	cancel,
	erase,
	option,
	sticklh,
	sticklv,
	length,
	}
//Collision Flags
enum FLAG
	{
	block,
	solid,
	plat,
	moving,
	slope,
	}
enum TECH_RESULT
	{
	success,
	slide,
	bounce,
	}
enum JOSTLE_TYPE
	{
	gradual,
	instant,
	}
enum PLATFORM_CHECK_TYPE
	{
	quick,
	precise,
	}
//Types of Dynamic Resources for dynamic_resource_count
enum DR 
	{
	grid,
	list,
	map,
	priority,
	queue,
	stack,
	buffer,
	surface,
	}
enum KNOCKBACK_FORMULA
	{
	standard,
	stronger,
	}