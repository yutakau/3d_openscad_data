//
// Motorbike smartphone holder adapter
//
// converts 30mm to 24mm
// 2021/9/25
//
//


outer_diameter = 30;
inner_diameter = 24;
h = 14;


module base_ring(outer_diameter, inner_diameter, h) {
    difference(){
        cylinder(h , outer_diameter/2, outer_diameter/2);
        translate([0,0,-1]) { cylinder(h+2 , inner_diameter/2, inner_diameter/2); }
    }
}

// dekoboko
module dekoboko_ring(count, r) {
    for (a = [0 : count - 1]) {
        rotate(a*360/count) {
            translate([r/2,0,0]) {
                cylinder(h, 0.3, 0.3, $fa=2);
            }
        }
    }
}



// zentai
module zentai(outer_diameter, inner_diameter, h) {
    difference() {
        union() {
            base_ring(outer_diameter, inner_diameter, h);
            dekoboko_ring(60, outer_diameter);
        }
        dekoboko_ring(47, inner_diameter);    
    }

    // hat-trim
    base_ring(outer_diameter+3, inner_diameter+2, 1);
    translate([0,0,h-1]) base_ring(outer_diameter+3, inner_diameter+2, 1);
}




// Split whole part to half, to easy to assemble.

// Part A
difference() {
    zentai(outer_diameter, inner_diameter, h);
    translate([0,-20,-1]) cube([40,40,40]);
}

// Part B


translate([20,0,0])  difference() {
    zentai(outer_diameter, inner_diameter, h);
    translate([-40,-20,-1]) cube([40,40,40]);
}







