include <roundedcube.scad>

translate([75,0,3])
rotate([-90,0,90])
linear_extrude(155)
difference(){
    polygon([[0,0], [131, 0], [0, 24]]);
    translate([3, 3, 0])
    scale([.7,.7,1])
        polygon([[0,0], [131, 0], [0, 24]]);
}

// backplate
//translate([-80, 0, 0]){
//    let (length = 155) {
//        cube([length, 130, 3]);
//        // hanger
//        translate([0, .5, -23]) {
//            rotate([10, 0, 0]) {
//                cube([length, 131, 3]);
//            }
//            translate([0,-.5,.25])
//            cube([length, 3, 23]);
//        }
//    }
//}
//
// angled backplate
rotate([0,0,-155.5]) {
    translate([-10.75, -73, 0]) {
        let (r = 12, h = 3) {
            hull() {
                for (x = [r, 110-r])
                    for (y = [r, 72-r])
                        translate([x, y, 0])
                            cylinder(h = h, r = r, $fn=100);
            }
        }
    }
}


// Curvy bottom bit
let (height = 20) {
  cube([75, 3, height]);
  translate([-5.49, 1.78, 0])
    rotate([0,0,-155.5]) {
      cube([83, 3, height]);

      rotate([0,0,90])
        translate([-9,-83,0]) {
          rotate([0,0,270])
            rotate_extrude(angle=90, $fn=100)
              translate([9,0,0])
                square([3,height]);

          translate([-21,-12,0])
            cube([21,3,height]);
        }
  }

  translate([0,-10,0])
    rotate([0,0,90])
      rotate_extrude(angle=25.5, $fn=100)
        translate([10,0,0])
          square([3,height]);
}

module hook() {
    translate([0,4,0])
        let(rad = 5) {
        translate([0,rad,rad])
            cylinder(h=5,r=2,$fn=100);

        rotate([90,0,0])
            cylinder(h=5,r=2,$fn=100);

        translate([0,0,rad])
            rotate([0,90,0])
            rotate_extrude(angle=90, $fn=100)

            translate([rad,0,0])
            circle(r=2);
    }
}

let (num_hooks = 5) {
    rotate([10,0,0]){
        translate([-50,130,-29]) {
            rotate([0,0,180])
                hook();

            translate([25,0,0])
                rotate([0,0,180])
                hook();
            
            translate([50,0,0])
                rotate([0,0,180])
                hook();
            
            translate([75,0,0])
                rotate([0,0,180])
                hook();
            
            translate([100,0,0])
                rotate([0,0,180])
                hook();
        }
    }
}