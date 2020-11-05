
module topcase(w,d,h,t) {

cube([w,t,h]);
cube([t,d,h]);
translate([w-t,0,0])  cube([t,d,h]);
translate([0,d-t,0])  cube([w,t,h]);

// top
difference(){
    translate([0,0,h-t]) difference() {
        cube([w,d,t]);
        translate([4,3,-1]) cube([52,40,3]);
    }
}

}


module bottomcase(w,d,h,t) {
    difference() {
        bottomcase_base(w,d,h,t);
        translate([-1,15,3])  cube([12,15,5]);
    }
}

module bottomcase_base(w,d,h,t) {
cube([w,t,h]);
cube([t,d,h]);
translate([w-t,0,0])  cube([t,d,h]);
translate([0,d-t,0])  cube([w,t,h]);

//inner wall
translate([t,t,t]) { cube([w-t*2,t,h+2]);  
                     cube([t,d-t*2,h+2]); 
}
translate([w-t*2,t,t])  cube([t,d-t*2,h+2]);
translate([t,d-t*2,t])  cube([w-t*3,t,h+2]);   

// bottom
difference(){
    translate([0,0,0]) difference() {
        cube([w,d,t]);
        translate([22,13,-1])  cylinder(h=5,r= 5);
    }
}


translate([t,t,t])     cube([55,2.5,5]);  
translate([t,t+40,t])  cube([55,3, 5]);
translate([t,t,t])     cube([4,40, 3]);
  

//board-osae
translate([w-14-t,t,t])     cube([15,20, 6]);
}


h1=8;
h2=10;
w=75;
d=46;
t=1;

translate([0,60,10]) mirror([0,0,1]) topcase(w,d,h1,t);
//bottomcase(w,d,h2,t);