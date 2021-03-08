///Checks for pummel attacks (attack while grabbing)
function check_pummel() {
	//If the attack, grab, or special buttons are pressed
	if (button(INPUT.attack, buff) || button(INPUT.grab, buff) || button(INPUT.special, buff))
		{
		attack_start(my_attacks[? "Pummel"]);
		return true;
		}
	return false;


}
