/// @description
var _x = gamepad_axis_value(0, gp_axislh);
var _y = gamepad_axis_value(0, gp_axislv)
kb_angle = point_direction(x, y, mouse_x, mouse_y);
stick_angle = point_direction(0, 0, _x, _y);
di_angle = di_direction(kb_angle, stick_angle, DI_max);