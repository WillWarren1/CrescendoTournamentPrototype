///@func Player_State_Name_Get(PLAYER_STATE)
///@param PLAYER_STATE
function Player_State_Name_Get(argument0) {
	var _names = 
		[
		"Idle",
		"Crouch",
		"Walk",
		"Walk Turn",
		"Dash",
		"Run",
		"Run Turn",
		"Run Stop",
	
		"Jumpsquat",
		"Aerial",
	
		"Airdodge",
		"Waveland",
		"Roll",
		"Shield",
		"Shield Release",
		"Shield Break",
		"Parry",
		"Parry Stun",
		"Spot Dodge",
	
		"Hitlag",
		"Hitstun",
		"Tumble",
		"Helpless",
		"Magnetized",
		"Flinch",
		"Balloon",
		"Lag",
		"Knockdown",
	
		"Tech Roll",
		"Tech",
		"Tech Wall Jump",
	
		"Ledge Snap",
		"Ledge Hang",
		"Ledge Getup",
		"Ledge Jump",
		"Ledge Roll",
		"Ledge Attack",
		"Ledge Tether",
		"Ledge Trump",
		"Wall Cling",
		"Wall Jump",
	
		"KO",
		"Star KO",
		"Screen KO",
		"Respawn",
	
		"Attacking",
		"Grabbing",
		"Grabbed",
		"Grab Release",
	
		"Lost",
		"Entrance",
		];

	return _names[argument0];


}
