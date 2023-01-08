    //As defined by Kailh's datasheet
    ////////////////////////////////////////////
    body_height=1.8;
    body_width=4;
    
    socket_radius = 1.45;
    socket_height= 1.25;
    socket_x_dist= 6.35;
    socket_y_dist=2.54;
    
    contact_height=1.85;
    contact_width=1.68;
    contact_length=1.6;
    ///////
    //Extras
    ///////
    outer_curve_rad=2;
    inner_curve_rad=2;

module kailh_socket(){
    
    union() {
        //Body
        /////////////////////////////////
        translate([body_width/2, 3.89/2, body_height/2])
            cube([body_width,3.89,body_height],center= true);
        translate([outer_curve_rad+(8.9/2),outer_curve_rad+(body_width/2),body_height/2])
            cube([8.9, body_width, body_height],center= true);
        //Inner Curve
        color("red",1)
        translate([body_width,-inner_curve_rad,0])
            difference(){
                translate([inner_curve_rad/2,3, body_height/2])
                    cube([inner_curve_rad,inner_curve_rad,body_height],center=true);
                translate([inner_curve_rad,inner_curve_rad,0])
                    cylinder(h=body_height+.01, r=inner_curve_rad,$fn=25);
            }
        //Outer curve
        translate([2,4,0])
            cylinder(h=body_height, r=outer_curve_rad, $fn=25);
        ///////////////////////////////////////////
        //Sockets
        socket_x_pos=2;
        socket_y_pos=1.75;
        color("purple",1.0){
            translate([socket_x_pos,socket_y_pos,body_height])
                cylinder(h=socket_height, r=socket_radius, $fn=25);
            translate([socket_x_pos+socket_x_dist,socket_y_pos+socket_y_dist,body_height])
                cylinder(h=socket_height, r=socket_radius, $fn=25);
        }
        //Contacts
        ////////////////////////////////////////////
        color("red", 1){
            translate([-contact_length,1,0])
                cube([contact_length,contact_width,contact_height]);
            translate([10.9,3.5,0])
                cube([contact_length*2,contact_width,contact_height]);
        }
        ////////////////////////////////////////////
    }
}

module kailh_socket_print(){
    /////////////////////////////////////////////
    //3D print tolerance
    /////////////////////////////////////////////
    tol = .3;
    body_height=body_height + tol;
    body_width=body_width + tol;
    
//    socket_radius =socket_radius + tol;
//    socket_height=socket_height + tol;
//    socket_x_dist=socket_x_dist + tol;
//    socket_y_dist=socket_y_dist + tol;
    
    contact_height=contact_height + tol;
    contact_width=contact_width + tol;
    contact_length=contact_length + tol;
    ///////
    //Extras
    ///////
    outer_curve_rad=outer_curve_rad + tol/2;
    inner_curve_rad=inner_curve_rad + tol/2;
    union() {
        //Body
        /////////////////////////////////
        translate([body_width/2, 3.89/2, body_height/2])
            cube([body_width+.05, 3.89, body_height],center= true);
        translate([outer_curve_rad+(8.9/2),outer_curve_rad+(body_width/2),body_height/2])
            cube([8.9, body_width, body_height],center= true);
        //Inner Curve
        color("red",1)
        translate([body_width, -inner_curve_rad+0.1, 0])
            difference(){
                translate([inner_curve_rad/2,3.25, body_height/2])
                    cube([inner_curve_rad,inner_curve_rad,body_height],center=true);
                translate([inner_curve_rad,inner_curve_rad,0])
                    cylinder(h=body_height, r=inner_curve_rad,$fn=25);
            }
        //Outer curve
        color("green",1)
            translate([2+tol/2,4+tol,0])
                cylinder(h=body_height, r=outer_curve_rad, $fn=25);
        ///////////////////////////////////////////
        //Sockets
        socket_x_pos=2;
        socket_y_pos=1.75;
        color("purple",1.0){
            translate([socket_x_pos,socket_y_pos,body_height])
                cylinder(h=socket_height, r=socket_radius, $fn=25);
            translate([socket_x_pos+socket_x_dist,socket_y_pos+socket_y_dist,body_height])
                cylinder(h=socket_height, r=socket_radius, $fn=25);
        }
        //Contacts
        ////////////////////////////////////////////
        color("red", 1){
            translate([-contact_length-1,1,0])
                cube([contact_length*2,contact_width,contact_height]);
            translate([10.9,3.5,0])
                cube([contact_length*2,contact_width,contact_height]);
        }
        ////////////////////////////////////////////
    }
}
//translate([0, 2, 0])
//    kailh_socket();

//translate([0, -8, 0])
//    kailh_socket_print();