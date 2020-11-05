//  Case for USB-Jtag cable
//    2015/2/11 Yutaka Usui

// ver2:2015/5  幅に余裕を持たせる(25->27)。背を少し低く、底面の底上げをなくす。USB穴大きく(9,6=>10,8)


//d=64;
//w=24;
d=65;
w=27;
t=2;
h=16;

module wall_usbcn()   // USBコネクタ穴つきの板
{
	translate([t/2,w/2,h/2])
	rotate([90,0,90])
	
	difference() {
		cube([w,h, t], center = true);
		translate([0,-1,0]) cube([10,8,2], center=true);
		}
	

}
module wall_cable()      // ケーブル用切り欠きつきの板
{
	translate([t/2,w/2,h/2])

	difference() {
		cube([t,w,h], center = true);
		translate([0,0,7]) cube([t,5,6], center = true);
	}
}


module bottom() {
	translate([d/2,w/2,t/2])
	union() {
		cube([d,w,t], center = true);      //底板
		//translate([0,0,  5]) cube([50,12,1], center = true);  // 底板内側
	}
}

module wall() {
   //manifoldを避けるためt(板の厚み)分のがして、隣接させる
	translate([t,   0, t]) { cube([d-2*t,t,h], center = false); } 
	translate([t, w-t, t]) { cube([d-2*t,t,h], center = false); }

	translate([0,    0, t]) { wall_cable(); }
	translate([d-t, 0, t])  { wall_usbcn(); }

}


module topcover() {

	cube([d-2*t,w-2*t,t], center=true);           //メインふた
	translate([0,0,t/2]) {
		cube([d-t*4,w-t*2,t*2], center=true); //2重重ねふた
		translate([-d/2+t*4+1,0,t*2])  cube([6,8,3], center=true);  //ふたの角をつける
   }
}

//

union() {
	bottom();
	wall();
}

translate([d/2,40,0])
rotate(180,0,0)
topcover();



