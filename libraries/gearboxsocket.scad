$fn = 100;

module socket(h = 14) {
    cylinder(h, r = 34);

    for (i = [1:8]) {
        rotate([0, 0, 45 * i])
            translate([33.5, 0, h/2])
                cube([4.5, 4.5, h], center=true);
    }
}

module small_socket(h = 17) {
    cylinder(h, r = 30.8);

    for (i = [1:8]) {
        rotate([0, 0, 45 * i])
            translate([30.8, 0, h/2])
                cube([2.5, 2.5, h], center=true);
    }
}