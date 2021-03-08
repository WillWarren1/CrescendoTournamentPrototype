function check_dash_attack() {
	//Checks for Dash Attack
	if (button(INPUT.attack, buff))
		{
		//No direction change
		attack_start(my_attacks[? "DashA"]);
		return true;
		}
	return false;


}
