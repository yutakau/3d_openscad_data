// Spacer for toilet-tank
// 202011212


w = 100;
d = 80;
h = 4;

t = 2;

rotate([0,0,90]) top();

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
    translate([-t,-t,0]) cube([w+2*t,t,h+3]);
    //translate([-t,-t,0]) cube([w+2*t,t,h+1.5]);
    translate([0,d,0]) cube([w+t,t,h+3]);
    translate([-t,0,0]) cube([t,d+t,h+3]);
    translate([w,0,0]) cube([t,d+t,h+3]);


    //screw spacer 
    translate([3,17,0]) spacer(h);
    translate([3,75,0]) spacer(h);
    translate([90,17,0]) spacer(h);
    translate([90,75,0]) spacer(h);
    
    // baseplate
    translate([w/3-4,0,0]) cube([8,d,t]);
    translate([(w/3*2)-4,0,0]) cube([8,d,t]);
    translate([91,0,0]) cube([10,d,t]);
    
    //camera holder
    translate([-15,d/2-12,0]) {
        cube([15,25,t+1]);
        cube([t,25,35]);
        translate([t,0,0]) cube([t,25,58]);
    }
}



