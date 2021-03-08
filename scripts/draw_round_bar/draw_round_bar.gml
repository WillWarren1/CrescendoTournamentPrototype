///@func draw_round_bar(x,y,width,maximum,amount,angle,color,center_size,sections)
///@desc Draws a circular bar
///@param x
///@param y
///@param width
///@param maximum
///@param amount
///@param angle
///@param color
///@param center_size
///@param sections
function draw_round_bar(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	/*
	Info:
	The x and y determine where the bar is drawn
	The width of the bar
	Maximum and amount decide how much of the bar is drawn
	The angle is the angle of the starting point
	The color is the color of the bar
	The center size is the space from the x and y
	The number of sections is how many 'parts' are in the bar (Higher = Less chunky; Normal is 360)
	*/
	//Variable Setting
	var xx,yy,w,m,a,ang,c,center,s;
	xx=argument0;
	yy=argument1;
	w=argument2;
	m=argument3;
	a=argument4;
	ang=argument5;
	c=argument6;
	center=argument7;
	s=argument8;

	//Drawing loop
	draw_primitive_begin(pr_trianglestrip);
	for(var i=ang;i<=((a / m)*s)+ang;i+=1)
		{
		//Draw 2 vertexes for each part
		draw_vertex_color(xx+lengthdir_x(center,i*(360/s)),yy+lengthdir_y(center,i*(360/s)),c,1);
		draw_vertex_color(xx+lengthdir_x(center+w,i*(360/s)),yy+lengthdir_y(center+w,i*(360/s)),c,1);
		}
	draw_primitive_end();


}
