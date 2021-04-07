// 
// toilet paper role core size cylinder

r = 40;
h = 115;

difference() {
    cylinder(h ,r,r);
    translate(0,0,-2) cylinder(h+4 ,r-2,r-2);
}