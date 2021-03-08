///@func hurtbox_inv_update()
function hurtbox_inv_update() {

	if (inv_type != INV.normal && inv_frame <= 0)
		{
		inv_type = INV.normal;
		inv_override = true;
		}	
	inv_frame = max(--inv_frame, 0);


}
