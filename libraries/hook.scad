module hook(r = 2, rad = 5) {
    translate([0, rad, rad])
        cylinder(h=5, r=r, $fn=100);

    rotate([90, 0, 0])
        cylinder(h=5, r=r, $fn=100);

    translate([0, 0, rad])
        rotate([0, 90, 0])
            rotate_extrude(angle=90, $fn=100)
                translate([rad, 0, 0])
                    circle(r=r);
}
