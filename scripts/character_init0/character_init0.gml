///Sets all of the variables for a single character
function character_init0() {
	//Collision box
	collision_box = spr_collision_mask_medium;

	//Hurtbox
	hurtbox_sprite = spr_hurtbox_small;
	hurtbox_crouch_sprite = spr_hurtbox_small_crouch;
	hurtbox = hurtbox_create(hurtbox_sprite);

	//Weight
	weight_multiplier = 1;

	//Gravity
	grav = 0.5;
	hitstun_grav = 0.5;

	//Falling
	max_fall_speed = 10;
	fast_fall_speed = 14;

	//Jumping
	jumpsquat_time = 3;
	jump_speed = 11.5;
	jump_horizontal_accel = 3;
	shorthop_speed = 6.5;
	double_jump_speed = 10.5;
	double_jump_horizontal_accel = 2;
	max_double_jumps = 1;
	land_time = 4;

	//Aerial Movment
	air_accel = 0.3;
	max_air_speed = 5;
	max_air_speed_dash = 6.5;
	air_friction = 0.04;

	//Ground Movement
	ground_friction = 0.75;
	crouch_friction = 1;
	slide_friction = 0.35;
	hard_landing_friction = 0.6;
	jostle_strength = jostle_default_strength;

	//Walking
	walk_speed = 3.25;
	walk_accel = 0.5;
	walk_turn_time = 6;

	//Dashing
	dash_speed = 8;
	dash_time = 10;
	dash_accel = 4;

	//Running
	run_speed = 7;
	run_accel = 0.8;
	run_turn_time = 10;
	run_turn_accel = 1;
	run_stop_time = 4;

	//Ledges
	ledge_jump_vsp = 12;
	ledge_jump_hsp = 2;
	ledge_jump_time = 12;
	ledge_getup_time = 23;
	ledge_getup_finish_x = 40;
	ledge_getup_finish_y = -46;
	ledge_roll_time = 12;
	ledge_attack_time = 12;
	//Some characters would not appear to grab the ledge
	//at the right spot due to sprite origin, so these
	//variables allow you to add an offset.
	ledge_hang_relative_x = -18;
	ledge_hang_relative_y = 22;

	//Air Dodge Values
	if (airdodge_type == AIRDODGE_TYPE.rivals)
		{
		airdodge_speed = 9;
		airdodge_startup = 2;
		airdodge_active = 10;
		airdodge_endlag = 12;
		waveland_speed_boost = 1;
		waveland_time = 8;
		waveland_friction = 0.24;
		//Unused
		airdodge_land_time = -1;
		airdodge_dir_windup_speed = -1;
		airdodge_dir_speed_min = -1;
		airdodge_dir_speed_max = -1;
		airdodge_dir_active = -1;
		airdodge_dir_endlag_min = -1;
		airdodge_dir_endlag_max = -1;
		}
	else if (airdodge_type == AIRDODGE_TYPE.brawl)
		{
		airdodge_startup = 1;
		airdodge_active = 18;
		airdodge_endlag = 10;
		airdodge_land_time = 12;
		//Unused
		airdodge_speed = -1;
		waveland_speed_boost = -1;
		waveland_time = -1;
		waveland_friction = -1;
		airdodge_dir_windup_speed = -1;
		airdodge_dir_speed_min = -1;
		airdodge_dir_speed_max = -1;
		airdodge_dir_active = -1;
		airdodge_dir_endlag_min = -1;
		airdodge_dir_endlag_max = -1;
		}
	else if (airdodge_type == AIRDODGE_TYPE.ultimate)
		{
		airdodge_startup = 3;
		airdodge_active = 27;
		airdodge_endlag = 17;
		airdodge_land_time = 10;
		airdodge_dir_windup_speed = 9;
		airdodge_dir_speed_min = 6;
		airdodge_dir_speed_max = 11;
		airdodge_dir_active = 18;
		airdodge_dir_endlag_min = 20;
		airdodge_dir_endlag_max = 50;
		//Unused
		airdodge_speed = -1;
		waveland_speed_boost = -1;
		waveland_time = -1;
		waveland_friction = -1;
		}
	
	//Shield Values
	if (shield_type == SHIELD_TYPE.melee)
		{
		shield_max_hp = 55;
		shield_hp = shield_max_hp;
		shield_depeletion_rate = 0.14;
		shield_recover_rate = 0.14;
		shield_break_launch = 13;
		shield_break_reset_hp = 25;
		shield_stun = 0;
		shield_size_multiplier = 1;
		shield_shift_amount = 10;
		shield_release_time = 2;
		spot_dodge_startup = 3;
		spot_dodge_active = 14;
		spot_dodge_endlag = 14;
		//Unused
		parry_startup = -1;
		parry_active = -1;
		parry_endlag = -1;
		parry_trigger_time = -1;
		parry_script = -1;
		parry_ult_window = -1;
		parry_ult_freeze_time = -1;
		parry_ult_self_freeze_time = -1;
		parry_ult_sprite = -1;
		}
	else if (shield_type == SHIELD_TYPE.rivals)
		{
		parry_startup = 2;
		parry_active = 8;
		parry_endlag = 30;
		parry_trigger_time = 15;
		parry_script = parry0;
		//Unused
		shield_max_hp = -1;
		shield_hp = shield_max_hp;
		shield_depeletion_rate = -1;
		shield_recover_rate = -1;
		shield_break_launch = -1;
		shield_break_reset_hp = -1;
		shield_stun = -1;
		shield_size_multiplier = -1;
		shield_shift_amount = -1;
		shield_release_time = -1;
		spot_dodge_startup = -1;
		spot_dodge_active = -1;
		spot_dodge_endlag = -1;
		parry_ult_window = -1;
		parry_ult_freeze_time = -1;
		parry_ult_self_freeze_time = -1;
		parry_ult_sprite = -1;
		}
	else if (shield_type == SHIELD_TYPE.ultimate)
		{
		shield_max_hp = 55;
		shield_hp = shield_max_hp;
		shield_depeletion_rate = 0.14;
		shield_recover_rate = 0.12;
		shield_break_launch = 13;
		shield_break_reset_hp = 25;
		shield_stun = 0;
		shield_size_multiplier = 1;
		shield_shift_amount = 10;
		shield_release_time = 11;
		parry_ult_window = 5;
		parry_ult_freeze_time = 18;
		parry_ult_self_freeze_time = 10;
		parry_ult_sprite = spr_shield_release0;
		spot_dodge_startup = 3;
		spot_dodge_active = 14;
		spot_dodge_endlag = 14;
		//Unused
		parry_startup = -1;
		parry_active = -1;
		parry_endlag = -1;
		parry_trigger_time = -1;
		parry_script = -1;
		}
	
	//Wall jump Values
	if (wall_jump_type == WALL_JUMP_TYPE.rivals)
		{
		wall_jump_startup = 2;
		wall_jump_time = 8;
		wall_jump_hsp = 7;
		wall_jump_vsp = -8;
		max_wall_jumps = 1;
		can_wall_cling = false;
		//Unused
		can_wall_jump = -1;
		}
	else if (wall_jump_type == WALL_JUMP_TYPE.smash)
		{
		can_wall_jump = true;
		wall_jump_startup = 5;
		wall_jump_time = 8;
		wall_jump_hsp = 7;
		wall_jump_vsp = -9;
		can_wall_cling = false;
		//Unused
		max_wall_jumps = -1;
		}

	//Rolling
	roll_speed = 9;
	roll_startup = 3;
	roll_active = 14;
	roll_endlag = 8;

	//Teching
	tech_active = 16;
	tech_endlag = 6;
	techroll_speed = 10;
	techroll_startup = 8;
	techroll_active = 12;
	techroll_endlag = 16;

	//Helpless
	helpless_accel = 0.4;
	helpless_max_speed = 3;

	//States
	my_states[| PLAYER_STATE.idle			] =	Standard_Idle;		
	my_states[| PLAYER_STATE.crouching		] =	Standard_Crouching;
	my_states[| PLAYER_STATE.walking		] = Standard_Walking;		
	my_states[| PLAYER_STATE.walk_turnaround] =	Standard_Walk_Turnaround;
	my_states[| PLAYER_STATE.dashing		] = Standard_Dashing;		
	my_states[| PLAYER_STATE.running		] = Standard_Running;		
	my_states[| PLAYER_STATE.run_turnaround	] = Standard_Run_Turnaround;
	my_states[| PLAYER_STATE.run_stop		] = Standard_Run_Stop;

	my_states[| PLAYER_STATE.jumpsquat		] =	Standard_Jumpsquat;	
	my_states[| PLAYER_STATE.aerial			] = Standard_Aerial;		

	my_states[| PLAYER_STATE.airdodging		] =	Standard_Airdodge;
	my_states[| PLAYER_STATE.wavelanding	] = Standard_Waveland;
	my_states[| PLAYER_STATE.rolling		] = Standard_Rolling;		
	my_states[| PLAYER_STATE.shielding		] = Standard_Shielding;
	my_states[| PLAYER_STATE.shield_release	] = Standard_Shield_Release;
	my_states[| PLAYER_STATE.shield_break	] = Standard_Shield_Break;
	my_states[| PLAYER_STATE.parrying		] =	Standard_Parrying;	
	my_states[| PLAYER_STATE.parry_stun		] =	Standard_Parry_Stun;	
	my_states[| PLAYER_STATE.spot_dodging	] =	Standard_Spot_Dodge;

	my_states[| PLAYER_STATE.in_hitlag		] = Standard_Hitlag;		
	my_states[| PLAYER_STATE.in_hitstun		] = Standard_Hitstun;		
	my_states[| PLAYER_STATE.in_tumble		] = Standard_Tumble;
	my_states[| PLAYER_STATE.helpless		] =	Standard_Helpless;
	my_states[| PLAYER_STATE.magnetized		] =	Standard_Magnetized;	
	my_states[| PLAYER_STATE.in_flinch		] =	Standard_Flinch;
	my_states[| PLAYER_STATE.in_lag			] = Standard_Lag;			
	my_states[| PLAYER_STATE.in_balloon		] = Standard_Balloon;			
	my_states[| PLAYER_STATE.knockdown		] =	Standard_Knockdown;

	my_states[| PLAYER_STATE.techrolling	] = Standard_Techrolling;	
	my_states[| PLAYER_STATE.teching		] =	Standard_Teching;		
	my_states[| PLAYER_STATE.tech_wall_jump	] =	Standard_Tech_Wall_Jump;

	my_states[| PLAYER_STATE.ledge_snap		] =	Standard_Ledge_Snap;	
	my_states[| PLAYER_STATE.ledge_hang		] =	Standard_Ledge_Hang;	
	my_states[| PLAYER_STATE.ledge_getup	] =	Standard_Ledge_Getup;	
	my_states[| PLAYER_STATE.ledge_jump		] =	Standard_Ledge_Jump;	
	my_states[| PLAYER_STATE.ledge_roll		] =	Standard_Ledge_Roll;	
	my_states[| PLAYER_STATE.ledge_attack	] =	Standard_Ledge_Attack;
	my_states[| PLAYER_STATE.ledge_tether	] =	Standard_Ledge_Tether;
	my_states[| PLAYER_STATE.ledge_trump	] =	Standard_Ledge_Trump;	
	my_states[| PLAYER_STATE.wall_cling		] =	Standard_Wall_Cling;	
	my_states[| PLAYER_STATE.wall_jump		] =	Standard_Wall_Jump;		

	my_states[| PLAYER_STATE.knocked_out	] =	Standard_Knocked_Out;	
	my_states[| PLAYER_STATE.star_ko		] =	Standard_Star_KO;		
	my_states[| PLAYER_STATE.screen_ko		] =	Standard_Screen_KO;		
	my_states[| PLAYER_STATE.respawning		] =	Standard_Respawning;	

	my_states[| PLAYER_STATE.attacking		] =	Standard_Attacking;		
	my_states[| PLAYER_STATE.grabbing		] =	Standard_Grabbing;	
	my_states[| PLAYER_STATE.is_grabbed		] =	Standard_Is_Grabbed;	
	my_states[| PLAYER_STATE.in_grab_release] =	Standard_Grab_Release;

	my_states[| PLAYER_STATE.lost			] =	Standard_Lost;		
	my_states[| PLAYER_STATE.entrance		] =	Standard_Entrance;	

	//Attacks
	my_attacks[? "Jab"	 ] = jab_chrom;
	my_attacks[? "DashA" ] = dash_attack_claw;
	my_attacks[? "Ftilt" ] = ftilt_byleth;
	my_attacks[? "Utilt" ] = utilt_falcon;
	my_attacks[? "Dtilt" ] = dtilt0;
			 
	my_attacks[? "Fsmash"] = fsmash_link;
	my_attacks[? "Usmash"] = usmash0;
	my_attacks[? "Dsmash"] = dsmash0;
			 
	my_attacks[? "Nair"	 ] = nair_joker;
	my_attacks[? "Fair"	 ] = fair_bayonetta;
	my_attacks[? "Bair"	 ] = bair_joker;
	my_attacks[? "Uair"	 ] = uair_cloud;
	my_attacks[? "Dair"	 ] = dair_shulk;
			 
	my_attacks[? "Nspec" ] = fspec_eiha;
	my_attacks[? "Fspec" ] = fspec_afterburner_kick;
	my_attacks[? "Uspec" ] = uspec_zss;
	my_attacks[? "Dspec" ] = dspec_nosferatu;
			 
	my_attacks[? "Grab"	 ] = grab0;
	my_attacks[? "DashG" ] = dash_grab0;
	my_attacks[? "Pummel"] = pummel0;
	my_attacks[? "Zair"	 ] = -1;
			 
	my_attacks[? "FThrow"] = fthrow0;
	my_attacks[? "BThrow"] = bthrow0;
	my_attacks[? "UThrow"] = uthrow_combo;
	my_attacks[? "DThrow"] = dthrow_combo;
			 
	my_attacks[? "LedgeA"] = ledge_attack0;
	my_attacks[? "Taunt" ] = taunt0;

	//Animations / Sprites
	sprite_scale = 2;

	my_sprites[? "Entrance"	] = anim_define(spr_entrance0, anim_define(spr_idle0));
	my_sprites[? "Idle"		] = spr_idle0;
	my_sprites[? "Crouch"	] = anim_define(spr_crouch_begin0, anim_define(spr_crouch0));
	my_sprites[? "Walk"		] = spr_walk0;
	my_sprites[? "Walk_Turn"] = spr_walk0;
	my_sprites[? "Dash"		] = spr_run0;
	my_sprites[? "Run"		] = spr_run0;
	my_sprites[? "Run_Turn" ] = spr_run0;
	my_sprites[? "Run_Stop"	] = spr_run_stop0;
			 
	my_sprites[? "JumpSquat"] = spr_jumpsquat0;
	my_sprites[? "JumpRise"	] = spr_jump_rise0;
	my_sprites[? "JumpMid"	] = spr_jump_mid0;
	my_sprites[? "JumpFall"	] = spr_jump_fall0;
	my_sprites[? "Fastfall"	] = spr_fastfall0;
	my_sprites[? "DJumpRise"] = anim_define(spr_djump_rise0, anim_define(spr_jump_fall0));
	my_sprites[? "DJumpMid"	] = -1;
	my_sprites[? "DJumpFall"] = -1;
	my_sprites[? "DFastfall"] = -1;
			 
	my_sprites[? "Airdodge"	] = spr_airdodge0;
	my_sprites[? "Waveland"	] = spr_waveland0;
	my_sprites[? "Rolling"	] = spr_rolling0;
	my_sprites[? "Shield"	] = anim_define(spr_shield_start0, anim_define(spr_shield0));
	my_sprites[? "ShieldR"	] = spr_shield_release0;
	my_sprites[? "ShieldB"	] = anim_define_ext(spr_shield_break0, 0, 0.4, 1, 0, c_white, 1, 0, 0, true, -1);
	my_sprites[? "ParryS"	] = spr_parry_stun0;
	my_sprites[? "SDodge"	] = spr_spot_dodge0;
			 
	my_sprites[? "Hitlag"	] = spr_hitlag0;
	my_sprites[? "Hitstun"	] = spr_hitstun0;
	my_sprites[? "Tumble"	] = spr_tumble0;
	my_sprites[? "Helpless"	] = spr_helpless0;
	my_sprites[? "Magnet"	] = spr_hitstun0;
	my_sprites[? "Flinch"	] = spr_crouch0;
	my_sprites[? "Lag"		] = spr_crouch0;
	my_sprites[? "Balloon"	] = spr_balloon0;
	my_sprites[? "Knockdown"] = spr_knockdown0;

	my_sprites[? "Techroll"	] = spr_rolling0; 
	my_sprites[? "Teching"	] = spr_teching0;
	my_sprites[? "TechingW"	] = spr_teching0;
	my_sprites[? "TechingC"	] = spr_teching0;
	my_sprites[? "Techjump"	] = spr_wall_jump0;
			 
	my_sprites[? "LedgeS"	] = spr_ledge_snap0;
	my_sprites[? "Ledge"	] = spr_ledge_hang0;
	my_sprites[? "LedgeG"	] = spr_ledge_getup0;
	my_sprites[? "LedgeJ"	] = spr_ledge_jump0;
	my_sprites[? "LedgeR"	] = spr_ledge_jump0;
	my_sprites[? "LedgeA"	] = spr_ledge_attack_getup0;
	my_sprites[? "LedgeT"	] = spr_ledge_tether0;
	my_sprites[? "LedgeTr"	] = spr_ledge_trump0;
	my_sprites[? "WallC"	] = spr_wall_cling0;
	my_sprites[? "WallJ"	] = spr_wall_jump0;

	my_sprites[? "StarKO"	] = spr_star_ko0;
	my_sprites[? "ScreenKO"	] = spr_screen_ko0;
			 
	my_sprites[? "Grabbing"	] = spr_grabbing0;
	my_sprites[? "IsGrabbed"] = spr_hitstun0;
	my_sprites[? "GrabRel"	] = spr_crouch0;
			 
	//Custom Scripts
	custom_script = -1;
	hud_script = -1;
}