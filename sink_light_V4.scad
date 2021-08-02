
// Kitchen Sink Light - USB battery version.

h=20;
w=30;
d=80;

t=2;


module ledhold(t)
{   
    rotate([0,90,0])
    difference() {
        //cube([10,10,t]);
        //translate([5, 5, -1]) rotate([ 0,0,90]) cylinder(h=4+t,r=3.5);
        cube([11,11,t]);
        translate([5.5, 5.5, -1]) rotate([ 0,0,90]) cylinder(h=4+t,r=3.8);

    }
}


module baseplate(h,w,d,t) {
// plate with hole
difference() {

  //mainboard with kirikaki
  difference() {
    cube([d,t,w]);
    translate([40,t-3,w-3]) cube([25,5, 4]);
  }

  translate([d/2, -2, 15/2 + 25]) rotate([ -90,0,0]) cylinder(h=4,r=1.6);
    
  //screw hole
  translate([14, -4, 15]) rotate([ -90,0,0]) cylinder(h=7,r=2);
  translate([40, -4, 15]) rotate([ -90,0,0]) cylinder(h=7,r=2);
  translate([72, -4, 15]) rotate([ -90,0,0]) cylinder(h=7,r=2);
}
//wire hold
translate([d-8,-2,28]) cube([8,3,2]);
translate([d-8,-2,24]) cube([8,3,2]);

// Switch guide
translate([10,-9+t,w-7-t]) cube([t+1,5+t, 8]);
translate([10+23,-9+t,w-7-t]) cube([t+1,5+t, 8]);
translate([10+7,-9+t,w-7-t-4]) cube([t+3,5+t, 4]);

// LEDtube hold
translate([0,0,0]) ledhold(2.5);
translate([(d-t)/2,0,0]) ledhold(2.5);
translate([d-t,0,0]) ledhold(2.5);

// DC-jack hold
translate([d-t-26,-13,0]) 
    difference() {
        cube([6,12+t, 16]);
        translate([-1,-1,2]) cube([8, 14, 11]);        
    }
    
}
translate([d-t-32, -2,-13]) cube([30,2,20]);


// DC-jack hold (V3)
//translate([d-t-16,-13,0]) 
//    difference() {
//        cube([4,12+t, 15]);
//        //translate([-2,2,2]) cube([6, 11, 11]);
//        translate([-2,-1,2]) cube([7, 14, 11]);
//    }
//}

module sinklight(h,w,d,t) {
  cube([d,h,t]);
  translate([0,0,0]) baseplate(h,w,d,t);
}



rotate([90,0,0])  sinklight(h,w,d,t);
//rotate([90,0,180])  sinklight(h,w,d,t);