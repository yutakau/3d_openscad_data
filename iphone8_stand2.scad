

base_w=88;
base_h=18;
base_t=6;

t=2;
clamp_h=52;
clamp_t2=2;

back_l = 74;

bhole_l = 66;
bhole_h = 11;
            
module main(){
  difference(){
    cube([base_h,base_w,base_t]);   // base
    translate([base_h/2,base_w/2,0])  cylinder(h=10,r=3.6);
  }
  translate([base_h-t, 0, 0]){
      //cube([t,base_w,back_l]);   // back plate
      backplate();   // back plate
  }
  
clamp_l();
clamp_r();
}

module backplate(){
    //cube([t,base_w,back_l]);
    difference(){
        cube([t,base_w,back_l]);
        translate([ 0, (base_w-t-bhole_l)/2, 16 ]) {
          cube([t, bhole_l, bhole_h ]);      // hole
        }
        translate([ 0, (base_w-t-bhole_l)/2, 36 ]) {
          cube([t, bhole_l, bhole_h ]);      // hole
        }
        translate([ 0, (base_w-t-bhole_l)/2, 56 ]) {
          cube([t, bhole_l, bhole_h ]);      // hole
        }        
    }
}


module clamp_l(){
    cube([base_h, clamp_t2, clamp_h]);
    translate([0, clamp_t2-t, clamp_h-8 ]) {
        //cube([t, base_w-t, 8]);
        cube([t, 12, 8]);
    }
    
}

module clamp_r(){
    translate([0,base_w-clamp_t2,0]) {    
        cube([base_h, clamp_t2, clamp_h]);
        translate([0, clamp_t2, clamp_h-8 ]) {
            rotate([0,0,180]){
            cube([t, 12, 8]);}
        }
    }
}



main();