function Standard_Custom() {
	//This runs the custom script for the character every step
	if (custom_script != -1 && script_exists(custom_script))
		{
		script_execute(custom_script);
		}


}
