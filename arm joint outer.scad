include <bearingtrack.scad>
include <gearboxsocket.scad>
include <tubeadapter.scad>

$fn = 100;

difference() {
    cylinder(h=60, r=35);
    small_socket();
    translate([0,0,3.5])
        bearing_track();
    translate([0,0,25.5])
        bearing_track();
    translate([-10,0,45])
        rotate([0,90,0])
            tube_interior(60);
}