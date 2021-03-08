/*
- This script does not need to be run
*/
#region Variable
/*
- These settings can be changed during gameplay
- Access using setting().property syntax
*/
function setting() {
	static _settings = {
		//Game
		replay_mode :						false,
		replay_record :						true,
		match_stage :						rm_Battlefield,
		match_stock :						3,
		match_time :						6,
		match_stamina :						0,
		match_teams :						[],
		match_team_attack :					false,
		debug_fps :							false,
		//Visibility					
		show_hitboxes :						false,
		show_hurtboxes :					false,
		show_collision_boxes :				false,
		show_launch_trajectories :			false,
		show_damage_numbers :				false,
		show_true_combos :					false,
		show_hud :							true,
		//Screen
		daynight_cycle_enable :				true,
		daynight_cycle_outline_change :		true,
		//Camera							
		camera_move_speed :					0.1,
		camera_y_offset :					-16,				
		camera_enable_zoom :				false,
		camera_zoom_speed_out :				0.02,
		camera_zoom_speed_in :				0.05,
		//Game Surface						
		//Outlines							
		//Player Status						
		//Countdown Time					
		//End Time							
		//Pausing							
		allow_pausing :						true,
		//VFX								
		knockback_cloud_trails_enable :		true,
		//Input Buffer
		//Control Stick
		//Menus
		//Knockback
		//DI
		//Angles
		//Landing
		//Smash Attacks
		//Grabs
		//Sound
		volume_music :						1,
		volume_sound_effects :				1,
		//Collisions
		slope_collisions_enable :			true,
		//Shielding
		//Parrying
		//Ledges
		//Wall Jumps
		//Airdodges
		//Knockouts
		//Hitbox Drawing
		//Animation
		//Aerial State
		//Character Select
	};
	return _settings;
}
#endregion

#region Constant
/*
- These settings cannot be changed during gameplay
*/
//Game
#macro debug								true
#macro show_debug_logs						false
#macro max_players							8
#macro airdodge_type						AIRDODGE_TYPE.rivals
#macro shield_type							SHIELD_TYPE.melee
#macro wall_jump_type						WALL_JUMP_TYPE.rivals
//Visibility								
//Screen									
#macro screen_width							960
#macro screen_height						544
//Camera
#macro camera_start_width					960
#macro camera_start_height					544
#macro camera_boundary						120
#macro camera_ratio							(camera_start_width / camera_start_height)
#macro camera_zoom_pad_scale				1.7
#macro camera_zoom_pad_xscale				0.0
#macro camera_zoom_pad_yscale				0.1
#macro camera_max_width						(room_width)
#macro camera_max_height					(room_width / camera_ratio)
#macro camera_min_width						480
#macro camera_min_height					272
#macro camera_enable_special_zoom			false //Whether the finishing blow effect causes the camera to zoom
#macro camera_special_zoom_speed_out		0.15
#macro camera_special_zoom_speed_in			0.4
#macro camera_special_zoom_width			480
#macro camera_special_zoom_height			272
#macro death_cam_shake						15
//Game Surface								
#macro game_surface_enable					true //Allows you to use screen effects, such as the daynight cycle
//Outlines									
#macro player_outline						true
#macro projectile_outline					false
#macro entity_outline						true
//Player Status								
#macro player_status_padding_bottom			54
//Countdown Time							
#macro count_time							50
//End Time
#macro end_time								180
//Pausing
//VFX
//Input Buffer
#macro buff									6
#macro max_buffer_length					60
#macro tech_buffer_time						20
#macro tech_lockout_time					40
#macro tech_buffer_before_hitstun			true //Controls if you can buffer a tech before hitstun begins
#macro fastfall_buffer						12
//Control Stick								
#macro stick_check_type						STICK_CHECK_TYPE.current
#macro stick_check_frames					3 //To check the stick speed, there has to be a value a certain number of frames before to compare with
#macro stick_tilt_amount					0.4
#macro stick_flick_speed					0.50
#macro stick_flick_amount					0.75
#macro stick_flick_buff						6
#macro stick_flick_cooldown					1
#macro stick_direction_sensitivity			65
#macro rstick_tilt_amount					0.4
#macro rstick_flick_speed					0.4
#macro rstick_flick_amount					0.7
//Menus
#macro menu_confirm_button					gp_face2
#macro menu_cancel_button					gp_face1
#macro menu_delete_button					gp_face4
#macro menu_option_button					gp_face3
#macro menu_ready_button					gp_start
#macro menu_frame_advance_step_button		gp_start
#macro menu_frame_advance_cancel_button		gp_select
#macro menu_confirm_key						vk_enter
#macro menu_cancel_key						vk_backspace
#macro menu_delete_key						vk_control
#macro menu_option_key						vk_shift
#macro menu_left_key						vk_left
#macro menu_right_key						vk_right
#macro menu_up_key							vk_up
#macro menu_down_key						vk_down
#macro menu_ready_key						vk_space
#macro menu_frame_advance_step_key			vk_enter
#macro menu_frame_advance_cancel_key		vk_backspace 
#macro VB_inital_time						13
#macro VB_loop_time							5
//Knockback
#macro knockback_scaling_multiplier			0.12
#macro hitstun_multiplier					0.85
#macro hitstun_base_multiplier				4
#macro hitstun_weight_multiplier			0.6
#macro hitstun_damage_multiplier			0.24
#macro hitstun_knockback_multiplier			4
#macro hitlag_multiplier					0.7
#macro hitlag_damage_multiplier				0.02
#macro maximum_hitlag						120
#macro finishing_blow_hitlag_increase		40
#macro balloon_speed_threshold				13
#macro balloon_lower_frame					28
#macro balloon_upper_frame					4
#macro balloon_end_speed_multiplier			0.75
#macro autolink_speed_multiplier			3
#macro magnetbox_snap_speed					10
#macro crouch_cancel_multiplier				0.65
#macro hit_turnaround						true
#macro max_damage							999
//DI										
#macro default_knockback_angle				90
#macro ASDI									4
#macro DI_max								15
#macro DI_correction_max					10
#macro drift_DI_accel						0.15
#macro drift_DI_max							1
//Angles
#macro s_angle_knockback_threshold			10
#macro s_angle_low_angle					0
#macro s_angle_high_angle					40
#macro s_angle_aerial_angle					45
//Landing									
#macro hard_landing_lag						20
#macro default_attack_landing_lag			5
#macro knockdown_lag_multiplier				0.5
#macro landing_buffer_jumpsquat				true //Whether players start jumpsquat before landing lag finishes
//Smash Attacks								
#macro smash_attack_max_charge				100
#macro smash_attack_multiplier				0.65
//Grabs
#macro base_grab_time						30
#macro grab_time_multiplier					0.5
#macro grab_snap_speed						20
#macro grab_release_hsp						4
#macro grab_release_vsp						-8
#macro grab_release_hitstun					20
#macro grab_release_damage					3
//Sound							
#macro hit_sound_default					snd_hit_weak
#macro hit_sound_pitch_variance				0.2
//Collisions								
#macro platform_check_type					PLATFORM_CHECK_TYPE.precise
#macro platform_snap_threshold				24 //Allows characters to snap to platforms with a waveland
#macro bounce_minimum_speed					12 //characters only bounce while in hitstun if they have enough speed
#macro bounce_speed_multiplier				0.6
#macro slope_change_speed					true
#macro slope_horizontal_pushes_down			false
#macro jostle_default_type					JOSTLE_TYPE.gradual
#macro jostle_default_strength				1 //Default for Instant: 0.3
#macro jostle_states						[PLAYER_STATE.idle, PLAYER_STATE.walking, PLAYER_STATE.walk_turnaround, PLAYER_STATE.crouching, PLAYER_STATE.run_stop, PLAYER_STATE.shielding, PLAYER_STATE.jumpsquat, PLAYER_STATE.shield_break]	
	//Default for Instant:
	//#macro jostle_states					[PLAYER_STATE.idle, PLAYER_STATE.walking, PLAYER_STATE.walk_turnaround, PLAYER_STATE.crouching, PLAYER_STATE.run_stop, PLAYER_STATE.shielding, PLAYER_STATE.jumpsquat, PLAYER_STATE.running, PLAYER_STATE.run_turnaround, PLAYER_STATE.dashing, PLAYER_STATE.knockdown, PLAYER_STATE.parry_stun, PLAYER_STATE.parry_stun, PLAYER_STATE.shield_break, PLAYER_STATE.wavelanding]
//Shielding
#macro shield_min_time						3
#macro shield_into_wavedash					true //QoL; allows you to wavedash out of shield startup frames
#macro shield_break_base_time				300
#macro shield_break_multiplier				0.2
#macro shield_plat_drop_speed				0.3
#macro shield_plat_drop_amount				0.7
#macro default_shieldstun_multiplier		1.0 //1.0
#macro base_shieldstun						3
#macro shield_pushback_enable				true
#macro shield_pushback_multiplier			0.4
#macro shield_hitlag_multiplier				0.75
//Parrying
#macro parry_grabs							true
#macro parry_default_stun_time				40
#macro parry_hitlag							10
#macro parry_invincible_time				30
#macro parry_reflect_speed_multiplier		1.5
//Ledges
#macro ledge_grab_timeout_standard			60
#macro ledge_snap_speed						16
#macro ledge_grab_distance					28
#macro ledge_snap_time						3
#macro ledge_hang_min_time					10
#macro ledge_hang_max_time					180
#macro ledge_invincible_time				60
#macro ledge_tether_snap_speed				15
#macro ledge_tether_snap_time				20
#macro ledge_trump_enable					true
#macro ledge_trump_stun_time				25
#macro ledge_trump_hsp						-6
#macro ledge_trump_vsp						-11
#macro ledge_getup_check_collision			false
//Wall Jumps
#macro wall_cling_max_time					60
#macro wall_cling_normal_timeout			120
#macro wall_jump_normal_timeout				15
#macro wall_jump_check_distance				1
#macro wall_cling_check_distance			1
//Airdodges
#macro airdodge_adjust_endlag				true //Whether the Ultimate type airdodge should scale endlag based on the direction or not
#macro airdodge_adjust_speed				true //Whether the Ultimate type airdodge should scale speed based on the direction or not
#macro airdodge_direction_limit				-1 //Set to -1 for no limit on the direction
#macro airdodge_restore_in_hitlag			false //Whether the player's airdodges are restored when they go into hitlag or not
//Knockouts
#macro ko_base_time							90
#macro star_ko_base_time					180
#macro star_ko_chance						5
#macro star_ko_distance						(room_height div 2)
#macro screen_ko_base_time					100
#macro screen_ko_chance						6
#macro screen_ko_scale_multiplier			3
#macro respawn_platform_max_time			300
#macro respawning_inv_time					90
#macro respawn_platform_change_facing		true
//Hitbox Drawing
#macro melee_draw_color						c_red
#macro magnetbox_draw_color					c_blue
#macro projectile_draw_color				c_yellow
#macro hurtbox_draw_color					c_lime
#macro collision_box_draw_color				c_purple
#macro grab_draw_color						c_blue
#macro windbox_draw_color					c_teal
#macro hitbox_draw_angle_multiplier			8
//Animation
#macro anim_multiplier						0.3
#macro anim_speed_normal					1
#macro anim_state_normal					"Idle"
#macro anim_frame_normal					0
#macro anim_angle_normal					0
#macro anim_alpha_normal					1.0
#macro anim_scale_normal					1
#macro anim_offset_normal					0
#macro anim_loop_normal						true
#macro anim_finish_normal					-1
#macro anim_color_normal					c_white
//Aerial State
#macro aerial_state_use_momentum_drift		false	//Whether the aerial state uses clamped speed drift or momentum based drift
														//Momentum based drift allows players to go over the max drift speed from external forces such as windboxes
#macro aerial_restrict_speed_instantly		false	//Whether the aerial state instantly clamps the speed when switched to
														//This should be true if aerial_state_use_momentum_drift is also true
//Character Select
#macro CSS_cursor_speed						8
#endregion