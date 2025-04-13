include <hookset.scad>

thickness = 3;

translate([-80, 0, 0]) {
    let (length = 155) {
        // backplate
        cube([length, 130, thickness]);

        // hanger
        translate([0, .5, -23])
            rotate([10, 0, 0])
                cube([length, 131, thickness]);

        // hanger support
        translate([0,0,-22.5])
            cube([length, thickness, 22.5]);

        // hooks
        translate([length-125, 122, -5])
            rotate([-80,0,0])
                hookset(5);
    }
}

// angled thumb cluster backplate
rotate([0,0,-155.5])
    translate([-10.75, -73, 0])
        let (r = 12)
            hull()
                for (x = [r, 110-r], y = [r, 72-r])
                    translate([x, y, 0])
                        cylinder(h = thickness, r = r, $fn=100);

// Curvy bottom bit
let (height = 20) {
    cube([75, thickness, height]);

    // "inner" corner
    translate([0, -11.10, 0])
        rotate([0, 0, 90])
            rotate_extrude(angle=25.5, $fn=100)
                translate([11.10, 0, 0])
                    square([thickness, height]);

    translate([-79.83, -35.282, 0])
        rotate([0,0,24.5])
            cube([83, thickness, height]);

    // bottom corner
    translate([-84.8, -24.36, 0])
        rotate([0, 0, 204.5])
            rotate_extrude(angle=90, $fn=100)
                translate([12-thickness, 0, 0])
                    square([thickness, height]);

    translate([-104.409, -10.23, 0])
        rotate([0, 0, -65.5])
            cube([21,thickness,height]);
}
