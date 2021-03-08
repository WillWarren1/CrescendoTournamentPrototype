///@func instance_save_all_vars_document(instance,buffer,[number_of_extra_variables])
///@param instance
///@param buffer
///@param [number_of_extra_variables]
function instance_save_all_vars_document() {
	var _inst = argument[0];
	var _b = argument[1];
	var _extra = argument_count > 2 ? argument[2] : 0;
	var _vars = variable_instance_get_names(_inst);
	var _val = 0;
	var _name = "";
	
	//with(_inst) { log("SAVE:\n" + string(self)); }
	//log("-------", object_get_name(_inst.object_index));
	
	//Number of vars
	var _num_builtins = 13;
	var _num = array_length(_vars) + _num_builtins + _extra;
	buffer_write(_b, buffer_u16, _num);
	
	//Loop through all variables
	for(var i = 0; i < array_length(_vars); i++)
		{
		_name = _vars[i];
		_val = variable_instance_get(_inst, _name);
		
		//Variable name
		buffer_write(_b, buffer_string, _name);
		
		//Type & Value
		buffer_write_auto_document(_b, _val, _name);
		}
		
	//Builtin variables
	buffer_write_var(_b, "x", buffer_f32, x);
	buffer_write_var(_b, "y", buffer_f32, y);
	buffer_write_var(_b, "xstart", buffer_f32, xstart);
	buffer_write_var(_b, "ystart", buffer_f32, ystart);
	buffer_write_var(_b, "mask_index", buffer_s16, mask_index);
	buffer_write_var(_b, "sprite_index", buffer_s16, sprite_index);
	buffer_write_var(_b, "image_index", buffer_f64, image_index);
	buffer_write_var(_b, "image_xscale", buffer_f64, image_xscale);
	buffer_write_var(_b, "image_yscale", buffer_f64, image_yscale);
	buffer_write_var(_b, "image_angle", buffer_f64, image_angle);
	buffer_write_var(_b, "image_blend", buffer_u32, image_blend);
	buffer_write_var(_b, "image_alpha", buffer_f64, image_alpha);
	buffer_write_var(_b, "layer", buffer_s32, layer);
	
	//log("Overall Buffer Position: " + string(buffer_tell(_b)));
}