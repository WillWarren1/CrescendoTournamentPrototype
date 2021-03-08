///@func Match_Begin()
///@desc Start a match using the previously set match settings
function Match_Begin() {
	//Check that the stage exists
	assert(room_exists(setting().match_stage), "The match stage ", setting().match_stage, " does not exist!");
	
	//Save profiles
	Profile_Save_All();

	//Stage
	room_goto(rm_MATCH_LOADING);
}