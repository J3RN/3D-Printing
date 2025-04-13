include <hookset.scad>

// backplate
translate([-80, 0, 0]){
    let (length = 155) {
        cube([length, 130, 3]);
        // hanger
        translate([0, .5, -23]) {
            rotate([10, 0, 0]) {
                cube([length, 131, 3]);
            }
            translate([0,-.5,.25])
            cube([length, 3, 23]);
        }

        // hooks
        translate([length-125, 122, -5])
            rotate([-80,0,0])
                hookset(5);
    }
}

// angled thumb cluster backplate
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
