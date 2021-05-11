// Ese
//    2017/5/31 Yutaka Usui


d=50.0;
w=40.0;
height=45;

motorhole_d=17;   // motor biss distance


gear_d=16;        // gear shaft to motor shart distance

t=3;


// Base
difference() {
    translate([0,0,0]) {
      cube([d,w,t], center = true);
   }

    // shaft hole
	translate([   gear_d/2, 0,0]) { cylinder(10, 1.5, 1.5, center=true); }
    translate([  -gear_d/2, 0,0]) { cylinder(10, 5, 5, center=true); }
    
    // motor hole
	translate([  -gear_d/2,  motorhole_d/2,0]) { cylinder(10, 1.2, 1.2, center=true); }
	translate([  -gear_d/2, -(motorhole_d/2),0]) { cylinder(10, 1.2, 1.2, center=true); }
	
}

// 
translate([d/2-t/2, 0, height/2]) {
    cube([3,w,height], center = true);
}

//
translate([-d/2+t/2,0, height/2]) {
    cube([3,w,height], center = true);
}

translate([  0, w/2-t/2, 2]) {
    cube([d,t,4], center = true);
}

translate([  0, -w/2+t/2, 2]) {
    cube([d,t,4], center = true);
}


// main-shaft uke
translate([   gear_d/2 , 0, 3]) {
    difference() {
      cylinder(5, 3, 3, center=true);
      translate([0 , 0, -3]) {
        cylinder(5, 1.5, 1.5, center=true);
      }
    }
}



