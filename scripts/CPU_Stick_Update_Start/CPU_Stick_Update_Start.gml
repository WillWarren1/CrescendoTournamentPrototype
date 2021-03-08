///@func CPU_Stick_Update_Start(count)
///@param count
///Run in CPU_Input
function CPU_Stick_Update_Start(argument0) {

	Stick_Cache_Values(Lstick, 0, 0, argument0);
	Stick_Cache_Values(Rstick, 0, 0, argument0);

}
