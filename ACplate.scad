// Plate for AC outlet cover, 2021/2/10
//
// ** 1st Prototype **
//

t=2;


plate(t);


module acplate()
{
    //cube([48,110,  ,4]);  -- full base
    translate([(48-29)/2, (110-70)/2,0]  )  cube([29,70,  ,4]);
    
    translate([(48-2)/2, 5,0]  )  cylinder(4 ,2,2);
    translate([(48-2)/2, (110-5),0]  )  cylinder(4 ,2,2);
}

module plate(r)
{

    difference() {
        cube([120, 120, t]);
            translate([5, 5  ,-1] )  acplate();
            translate([(120-5-48), 5  ,-1] )  acplate();
    }

}

