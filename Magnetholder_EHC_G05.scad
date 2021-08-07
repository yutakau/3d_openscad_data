//
// Magnet holder for ELECOM EHC-G05PA-W-K
//
// 1st version

module holder_base()
{
    difference() {
        cube([33, 14.5, 5]);
        translate([-1,-1,2.5]) cube([3, 17, 3]);
    }
}

module holder()
{
    difference() {
        holder_base();
        
        // hole for magnet
        translate([11,14.5/2, 3]) cylinder(h=7,r=2.5);
        translate([25,14.5/2, 3]) cylinder(h=7,r=2.5);
    }
}





holder();


