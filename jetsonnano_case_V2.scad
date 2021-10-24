// Jetson Nano case, modified version
//
//  2021/10/23
// 
//  - Modified Camera holder.
//  - Updated: More space near the connecter.
//  - Modified Screw spacer position


w = 100;
d = 80;
h = 6;    //h-4
t = 2;

rotate([0,0,90]) top();
translate([20,0,0])  camera_holder();

module spacer(h){
    difference() {
        cylinder(h,4,4);
        cylinder(h+2,1.5,1.5);
    }
}

module top()
{
    //inner
    translate([0,0,0]) cube([w,t,h]);
    translate([0,d-t,0]) cube([w,t,h]);
    translate([0,0,0]) cube([t,d,h]);
    translate([w-t,0,0]) cube([t,d,h]);
    
    //outer
    translate([-t,-t,0]) cube([w+2*t,t,h]);
    translate([0,d,0]) cube([w+t,t,h+3]);
    translate([-t,0,0]) cube([t,d+t,h+3]);
    translate([w,0,0]) cube([t,d+t,h+3]);


    //screw spacer 
    translate([4,18,0]) spacer(h);   //([3,17,0])
    translate([4,76,0]) spacer(h);   //[3,75,0])
    translate([90,17,0]) spacer(h);
    translate([90,75,0]) spacer(h);
    
    // baseplate
    translate([w/3-4,0,0]) cube([8,d,t]);
    translate([(w/3*2)-4,0,0]) cube([8,d,t]);
    translate([91,0,0]) cube([10,d,t]);
    
    translate([0,0,0]) cube([10,d,t]);
    translate([0,d/2-5,0]) cube([w,10,t]);
    
    //camera holder
    translate([-15,d/2-12,0]) {
        cube([15,25,t+1]);
        cube([t,25,35]);
        translate([t,0,0]){
            difference() {
                cube([t,25,58]);
                translate([-2,6,45]) rotate([0,90,0]) cylinder(t+3,1.3,1.3);
                translate([-2,19,45]) rotate([0,90,0]) cylinder(t+3,1.3,1.3);
                }
        }
    }
}


module cameracase()
{
    difference() {
        cube([25,25,7]);
        translate([0.5,0.5,0]) cube([24,24,8]);
    }
    translate([0,0,3]) cube([24,9,1]);
    translate([0,16,3]) cube([24,9,1]);
}

module camera_holder()
{
    //hole part
    difference() {
        cube([25,23,t]);
        translate([25-6,(58-45),-1]) rotate([0,0,0]) cylinder(t+3,1.3,1.3);
        translate([25-19,(58-45),-1]) rotate([0,0,0]) cylinder(t+3,1.3,1.3);
    }

    //additional
    translate([0,23,0]) rotate([0,0,0])  cube([25,110-23,t+1]);

    //outer camera case
    translate([0,(115-30),0]) cameracase();



}




