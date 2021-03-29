
// Kitchen Sink Light - USB battery version.

h=50;
w=25;


t=1 ;




//translate([0,0,w]) rotate([-90,0,0]) cube([h,t,w]);

cube([h,w,t]);
translate([0,0,w]) cube([h,w,t]);

cube([h,t,w]);
translate([0,w,0]) cube([h,t,w+t]);