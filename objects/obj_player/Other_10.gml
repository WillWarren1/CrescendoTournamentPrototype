/// @description STEP <Run by obj_game>
var frozen = false;
//Input buffer
if (!setting().replay_mode)
	{
	if (!is_cpu)
		{
		//Standard Input Update
		Input_Buffer_Update(true);
		//Get Inputs from Pause
		if (has_paused_inputs)
			{
			Input_Buffer_Paused_Load();
			}
		}
	else
		{
		//Standard CPU Update
		CPU_Input(true);
		}
		
	//Record Inputs
	if (setting().replay_record)
		{
		Input_Replay_Convert(get_game_replay_list()[| player_number], input_buffer);
		}
	}
else
	{
	//Play Back Inputs
	Input_Buffer_Update_Replay(input_buffer, true);
	}

//Teching
Register_Tech_Input(true);

//If in attacking hitlag (not defending), players are 'frozen'
if (self_hitlag_frame > 0)
	{
	self_hitlag_frame--;
	hitfall_try();
	frozen = true;
	}

//State Machine
if (!frozen)
	{
	if (script_exists(state_script))
		{
		state_frame = max(0, --state_frame);
		state_time++;
		script_execute(state_script);
		}
	else log("FATAL ERROR - Player object has a state that is not tied to a standard script.");
	}
	
//Custom script
Standard_Custom();

//Actions that happen regardless of state and/or being frozen
Standard_Extra();

//Animate sprite
anim_frame += anim_speed * anim_multiplier;
if (anim_frame > sprite_get_number(anim_sprite))
	{
	//Either loop or move onto the "finish" animation
	if (anim_loop)
		{
		anim_frame -= sprite_get_number(anim_sprite);
		}
	else if (is_array(anim_finish))
		{
		anim_set(anim_finish, true);
		}
	else
		{
		anim_frame = sprite_get_number(anim_sprite) - 1;
		}
	}

//Visual Effects
damage_text_random *= 0.9;
damage_text_x = irandom_range(-damage_text_random, damage_text_random);
damage_text_y = irandom_range(-damage_text_random, damage_text_random);

if (!background_is_cleared())
	{
	fade_value = min(fade_value + 0.1, 1);
	}

//Beat Bonus Handler
	//Check beat boost
var _boost_button = button(INPUT.beat_boost, buff)
if (_boost_button) then  usingBeatBonus = true;
if (usingBeatBonus) {
	beat_modifier = 1.5;
} else {
	beat_modifier = 1;
}