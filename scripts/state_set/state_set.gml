///@func state_set(state)
///@param state
///@desc Sets the state of the player and then performs initializing actions
function state_set() {

	state = argument[0];
	state_time = 0;
	state_frame = 0;
	state_phase = 0;
	state_facing = 1;
	state_script = my_states[| state];

	//Reset the animation
	anim_reset();

	//Reset the hurtbox
	hurtbox_reset();

	//Reset the collision box
	collision_box_change();

	//Reset the player renderer (layer)
	Player_Set_Renderer(obj_player_renderer);

	//Based on state
	switch(state)
		{
		case PLAYER_STATE.aerial:
			//Restrict speed
			if (aerial_restrict_speed_instantly)
				{
				var _max_speed = jump_is_dash_jump ? max_air_speed_dash : max_air_speed;
				hsp = clamp(hsp, -_max_speed, _max_speed);
				}
			//Jumping variables
			jump_is_midair_jump = false;
			//Animation
			anim_speed = anim_speed_normal;
			//Peak of jump
			if (abs(vsp) < 1)
				{
				anim_set(my_sprites[? "JumpMid"]);
				}
			//Falling
			else if (vsp >= 1)
				{
				anim_set(my_sprites[? "JumpFall"]);
				}
			//Rising
			else if (vsp <= 1)
				{
				anim_set(my_sprites[? "JumpRise"]);
				}
			//Fastfalling
			if (vsp >= fast_fall_speed)
				{
				anim_set(my_sprites[? "Fastfall"]);
				}
			break;
		case PLAYER_STATE.airdodging:
			//Animation
			anim_set(my_sprites[? "Airdodge"]);
			//Timers
			state_frame = airdodge_startup;
			state_phase = 0;
			switch(airdodge_type)
				{
				case AIRDODGE_TYPE.rivals:
					{
					//Speeds
					var _spd, _dir;
					
					//Choose a control stick to use
					var _stick = stick_choose_by_input(INPUT.shield);
					if (stick_tilted(_stick))
						{
						_spd = airdodge_speed;
						_dir = stick_get_direction(_stick);
						if (airdodge_direction_limit != -1)
							{
							var _d = (360 / airdodge_direction_limit);
							_dir = ((_dir + (_d / 2)) div _d) * _d;
							}
						airdodge_is_directional = true;
						}
					else
						{
						_spd = 0;
						_dir = 90;
						airdodge_is_directional = false;
						}
					airdodge_direction = _dir;
					
					//Speed
					speed_set(lengthdir_x(_spd, _dir), lengthdir_y(_spd, _dir), false, false);
					
					//Waveland cancel
					if (check_waveland())
						{
						//Reset invulnerability
						hurtbox_inv_set(hurtbox, INV.normal, 0);
						}
					else
						{
						//Visual effects
						if (_spd > 0)
							{
							var _fx = fx_create(spr_dust_airdodge, 1, 0, 12, x, y, 2, _dir - 180, "FX_Layer_Below");
							_fx.fx_yscale = choose(-2, 2);
							}
						}
					break;
					}
				case AIRDODGE_TYPE.brawl:
					{
					airdodge_is_directional = false;
					break;
					}
				case AIRDODGE_TYPE.ultimate:
					{
					//Choose a control stick to use
					var _stick = stick_choose_by_input(INPUT.shield);
					if (stick_tilted(_stick))
						{
						var _dir = stick_get_direction(_stick);
						airdodge_is_directional = true;
						if (airdodge_direction_limit != -1)
							{
							var _d = (360 / airdodge_direction_limit);
							_dir = ((_dir + (_d / 2)) div _d) * _d;
							}
						airdodge_direction = _dir;
						}
					else
						{
						airdodge_is_directional = false;
						}
					break;
					}
				}
			break;
		case PLAYER_STATE.attacking:
			break;
		case PLAYER_STATE.crouching:
			//Animation
			anim_set(my_sprites[? "Crouch"]);
			break;
		case PLAYER_STATE.dashing:
			//Animation
			anim_set(my_sprites[? "Dash"]);
			//Timers
			state_frame = dash_time;
			break;
		case PLAYER_STATE.entrance:
			//Animation
			anim_set(my_sprites[? "Entrance"]);
			//No speed
			speed_set(0, 0, false, false);
			break;
		case PLAYER_STATE.grabbing:
			//Animation
			anim_set(my_sprites[? "Grabbing"]);
			//Stick reset - the player must reset stick to neutral before a throw
			throw_stick_has_reset = false;
			break;
		case PLAYER_STATE.helpless:
			//Animation
			anim_set(my_sprites[? "Helpless"]);
			break;
		case PLAYER_STATE.idle:
			//Animation
			anim_set(my_sprites[? "Idle"]);
			break;
		case PLAYER_STATE.in_balloon:
			//Animation
			anim_set(my_sprites[? "Balloon"]);
			break;
		case PLAYER_STATE.in_flinch:
			//Cancel into hitstun in the air
			if (!on_ground())
				{
				state_set(PLAYER_STATE.in_hitstun);
				break;
				}
			//Animation
			anim_set(my_sprites[? "Flinch"]);
			break;
		case PLAYER_STATE.in_grab_release:
			//Animation
			anim_set(my_sprites[? "GrabRel"]);
			break;
		case PLAYER_STATE.in_hitlag:
			//Animation
			anim_set(my_sprites[? "Hitlag"]);
			break;
		case PLAYER_STATE.in_hitstun:
			//Animation
			anim_set(my_sprites[? "Hitstun"]);
			break;
		case PLAYER_STATE.in_lag:
			//Animation
			anim_set(my_sprites[? "Lag"]);
			break;
		case PLAYER_STATE.in_tumble:
			//Animation
			anim_set(my_sprites[? "Tumble"]);
			break;
		case PLAYER_STATE.is_grabbed:
			//Animation
			anim_set(my_sprites[? "IsGrabbed"]);
			break;
		case PLAYER_STATE.jumpsquat:
			//Animation
			anim_set(my_sprites[? "JumpSquat"]);
			break;
		case PLAYER_STATE.knockdown:
			//Animation
			anim_set(my_sprites[? "Knockdown"]);
			break;
		case PLAYER_STATE.knocked_out:
			//Animation
			anim_sprite = -1;
			//Timer
			state_frame = ko_base_time;
			break;
		case PLAYER_STATE.ledge_attack:
			//Animation
			anim_set(my_sprites[? "LedgeA"]);
			//Invincible
			hurtbox_inv_set(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_attack_time;
			break;
		case PLAYER_STATE.ledge_getup:
			//Animation
			anim_set(my_sprites[? "LedgeG"]);
			//Invincible
			hurtbox_inv_set(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_getup_time;
			break;
		case PLAYER_STATE.ledge_hang:
			//Animation
			anim_set(my_sprites[? "Ledge"]);
			//No speeds
			speed_set(0, 0, false, false);
			//Invincible
			hurtbox_inv_set(hurtbox, INV.invincible, ledge_invincible_time);
			break;
		case PLAYER_STATE.ledge_jump:
			//Animation
			anim_set(my_sprites[? "LedgeJ"]);
			//Invincible
			hurtbox_inv_set(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_jump_time;
			break;
		case PLAYER_STATE.ledge_roll:
			//Animation
			anim_set(my_sprites[? "LedgeR"]);
			//Invincible
			hurtbox_inv_set(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_roll_time;
			break;
		case PLAYER_STATE.ledge_snap:
			//Animation
			anim_set(my_sprites[? "LedgeS"]);
			//Allow for "2 frame" punish
			hurtbox_inv_set(hurtbox, INV.normal, 1);
			break;
		case PLAYER_STATE.ledge_tether:
			//Animation
			anim_set(my_sprites[? "LedgeT"]);
			break;
		case PLAYER_STATE.ledge_trump:
			//Animation
			anim_set(my_sprites[? "LedgeTr"]);
			//No invincibility
			hurtbox_inv_set(hurtbox, INV.normal, 1);
			break;
		case PLAYER_STATE.lost:
			//Animation
			anim_sprite = -1;
			//Invulnerability
			hurtbox_inv_set(hurtbox, INV.invincible, 1);
			//Settings
			speed_set(0, 0, false, false);
			x = room_width div 2;
			y = room_height div 2;
			break;
		case PLAYER_STATE.magnetized:
			//Animation
			anim_set(my_sprites[? "Magnet"]);
			break;
		case PLAYER_STATE.parry_stun:
			//Animation
			if (on_ground())
				{
				anim_set(my_sprites[? "ParryS"]);
				}
			else
				{
				anim_set(my_sprites[? "Tumble"]);
				}
			break;
		case PLAYER_STATE.parrying:
			//Run the start phase of the parry script, which handles animation
			if (script_exists(parry_script))
				{
				script_execute(parry_script, PHASE.start);
				}
			break;
		case PLAYER_STATE.respawning:
			//Animation
			anim_set(my_sprites[? "Idle"]);
			//Invulnerability
			hurtbox_inv_set(hurtbox, INV.invincible ,respawning_inv_time);
			//Timer
			state_frame = respawn_platform_max_time;
			break;
		case PLAYER_STATE.rolling:
			//Animation
			anim_set(my_sprites[? "Rolling"]);
			//Speeds
			speed_set(0, 0, false, false);
			//Timers
			state_frame = roll_startup;
			state_phase = 0;
			break;
		case PLAYER_STATE.run_stop:
			//Animation
			anim_set(my_sprites[? "Run_Stop"]);
			break;
		case PLAYER_STATE.run_turnaround:
			//Animation
			anim_set(my_sprites[? "Run_Turn"]);
			break;
		case PLAYER_STATE.running:
			//Animation
			anim_set(my_sprites[? "Run"]);
			break;
		case PLAYER_STATE.screen_ko:
			//Animation
			anim_set(my_sprites[? "ScreenKO"]);
			//Timer
			state_frame = screen_ko_base_time;
			break;
		case PLAYER_STATE.shielding:
			//Animation
			anim_set(my_sprites[? "Shield"]);
			//Shield type
			switch(shield_type)
				{
				case SHIELD_TYPE.melee:
					{
					hurtbox_inv_set(hurtbox, INV.powershielding, 1);
					shield_stun = 0; //Reset shieldstun
					break;
					}
				case SHIELD_TYPE.ultimate:
					{
					hurtbox_inv_set(hurtbox, INV.shielding, 1);
					shield_stun = 0; //Reset shieldstun
					break;
					}
				}
			break;
		case PLAYER_STATE.shield_break:
			//Animation
			anim_set(my_sprites[? "Tumble"]);
			//Invulnerable
			hurtbox_inv_set(hurtbox, INV.invincible, 1);
			break;
		case PLAYER_STATE.shield_release:
			//Animation
			anim_set(my_sprites[? "ShieldR"]);
			break;
		case PLAYER_STATE.spot_dodging:
			//Animation
			anim_set(my_sprites[? "SDodge"]);
			//No invulnerability
			hurtbox_inv_set(hurtbox, INV.normal, 0);
			break;
		case PLAYER_STATE.star_ko:
			//Animation
			anim_set(my_sprites[? "StarKO"]);
			//Timer
			state_frame = star_ko_base_time;
			break;
		case PLAYER_STATE.tech_wall_jump:
			//Animation
			anim_set(my_sprites[? "Techjump"]);
			//No speed
			speed_set(0, 0, false, false);
			//Invulnerable
			hurtbox_inv_set(hurtbox, INV.invincible, tech_active);
			break;
		case PLAYER_STATE.teching:
			//Animation
			anim_set(my_sprites[? "Teching"]);
			//No speed
			speed_set(0, 0, false, false);
			//Invulnerable
			hurtbox_inv_set(hurtbox, INV.invincible, tech_active);
			break;
		case PLAYER_STATE.techrolling:
			//Animation
			anim_set(my_sprites[? "Techroll"]);
			//No speed
			speed_set(0, 0, false, false);
			//Invulnerable
			hurtbox_inv_set(hurtbox, INV.invincible, techroll_startup);
			break;
		case PLAYER_STATE.walk_turnaround:
			//Animation
			anim_set(my_sprites[? "Walk_Turn"]);
			break;
		case PLAYER_STATE.walking:
			//Animation
			anim_set(my_sprites[? "Walk"]);
			break;
		case PLAYER_STATE.wall_cling:
			//Animation
			anim_set(my_sprites[? "WallC"]);
			break;
		case PLAYER_STATE.wall_jump:
			//Animation
			anim_set(my_sprites[? "WallJ"]);
			//Phase
			state_phase = 0;
			break;
		case PLAYER_STATE.wavelanding:
			//Animation
			anim_set(my_sprites[? "Waveland"]);
			break;
		default:
			crash("The player has been assigned a nonexistent state: ", state);
			break;
		}
	
	/* DEBUG */
	if (debug)
		{
		//Add states
		if (state_log[| ds_list_size(state_log) - 1] != state)
			{
			ds_list_add(state_log, state);
			}
		//Manage previous states - only 5 states
		while(ds_list_size(state_log) > 5)
			{
			ds_list_delete(state_log, 0);
			}
		}
}