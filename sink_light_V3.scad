
// Kitchen Sink Light - USB battery version.

h=20;
w=30;
d=80;

t=2;


module ledhold(t)
{   
    rotate([0,90,0])
    difference() {
        cube([10,10,t]);
        //translate([5, 5, -1]) rotate([ 0,0,90]) cylinder(h=4+t,r=3);
        translate([5, 5, -1]) rotate([ 0,0,90]) cylinder(h=4+t,r=3.5);
    }
}


module baseplate(h,w,d,t) {
// plate with hole
difference() {
  cube([d,t,w]);
  translate([d/2, -2, 15/2 + 25]) rotate([ -90,0,0]) cylinder(h=4,r=1.6);

    
  //screw hole
  translate([20, -4, 15]) rotate([ -90,0,0]) cylinder(h=7,r=2);
  translate([40, -4, 15]) rotate([ -90,0,0]) cylinder(h=7,r=2);
  translate([60, -4, 15]) rotate([ -90,0,0]) cylinder(h=7,r=2);
}

// Switch guide
translate([10,-8+t,w-7-t]) cube([t+1,5+t, 8]);
translate([10+22,-8+t,w-7-t]) cube([t+1,5+t, 8]);

// LEDtube hold
translate([0,0,0]) ledhold(t);
translate([(d-t)/2,0,0]) ledhold(t);
translate([d-t,0,0]) ledhold(t);

// DC-jack hold
translate([d-t-16,-13,0]) 
    difference() {
        cube([4,12+t, 15]);
        //translate([-2,2,2]) cube([6, 11, 11]);
        translate([-2,-1,2]) cube([7, 14, 11]);
    }
}


module sinklight(h,w,d,t) {
  cube([d,h,t]);
  translate([0,0,0]) baseplate(h,w,d,t);
}



rotate([90,0,0])  sinklight(h,w,d,t);
//rotate([90,0,180])  sinklight(h,w,d,t);