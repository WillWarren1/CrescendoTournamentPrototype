/// @description
event_inherited();
instance_set_flag(id, FLAG.solid, true);
instance_set_flag(id, FLAG.slope, true);
slope_angle = modulo(point_direction(0, 0, image_xscale, -image_yscale), 360);