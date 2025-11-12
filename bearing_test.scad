include <gearboxsocket.scad>
include <bearingtrack.scad>

difference() {
    cylinder(h=8, r=35);
    small_socket();
    translate([0,0,4])
        bearing_track();
}

difference() {
    cylinder(h=8, r=40);
    cylinder(h=8, r=37);
    translate([0,0,4])
        bearing_track();
    translate([36, 0, 4])
        rotate([0, 90, 0])
            cylinder(h=8, r=3.2);
}