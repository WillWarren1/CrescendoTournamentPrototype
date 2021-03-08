///@func only_one()
function only_one() {
	//If there's more than one of the instance, destroy
	if (instance_number(object_index) > 1)
		{
		instance_destroy();
		log("There can only be 1 instance of " + object_get_name(object_index) + " at a time!");
		return true;
		}
	return false;
}