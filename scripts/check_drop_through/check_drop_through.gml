///@func check_drop_through()
///@desc Allows players to drop through platforms and restricts fastfalling
function check_drop_through() {
	//Drops through a platform
	//If there's a platform under you but not a solid
	if (!on_solid(x, y) && on_plat(x, y))
		{
		//If the stick was flicked
		if (stick_flicked(Lstick, DIR.down))
			{
			//Move a pixel down so gravity will take effect
			if (!collision(x, y + 1, flags_create(FLAG.solid)))
				{
				y += 1;
				}
			state_set(PLAYER_STATE.aerial);
			//Set variable to restrict fastfalling
			can_fastfall = false;
		
			//-->Standard_Extra
			return true;
			}
		}
	return false;


}
