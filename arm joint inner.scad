include <gearboxsocket.scad>
include <bearingtrack.scad>
include <tubeadapter.scad>

$fn = 100;

module screw_hole() {
    cylinder(h=7, r=1.5);
    translate([0,0,7])
        cylinder(h=2, r1=6, r2=3);
}

difference() {
    union() {
        // Skinnier bottom
        cylinder(h=25, r=35);
        // Wider top
        translate([0,0,22])
            cylinder(h=36, r=40);
        // Tube adapter
        translate([0,0,29])
            rotate([0,90,0])
                tube_adapter(h=60);
    }
    translate([0,0,9])
        small_socket(); 
    // Rim
    translate([0,0,9])
        cylinder(h=1, r=30);
    // Drive shaft hole
    cylinder(h=20, r=3);
    // NEMA 17 bumpout
    cylinder(h=3, r=11.5);
    // Screw holes
    translate([-15.5, -15.5, 0])
        screw_hole();
    translate([-15.5, 15.5, 0])
        screw_hole();
    translate([15.5, -15.5, 0])
        screw_hole();
    translate([15.5, 15.5, 0])
        screw_hole();
    translate([0,0,25]) {
        // bore
        cylinder(h=33, r=37);
        // bearing track #1
        translate([0,0,4])
            bearing_track();
        // feed port
        translate([-40,0,4])
            rotate([0,90,0])
                cylinder(h=3, r=3.2);
        // bearing track #2
        translate([0,0,26])
            bearing_track();
        // feed port
        translate([-40,0,26])
            rotate([0,90,0])
                cylinder(h=3, r=3.2);
    }
}