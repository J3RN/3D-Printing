include <gearboxsocket.scad>
include <tubeadapter.scad>

$fn = 100;

module base_ring() {
    linear_extrude(3) {
        difference() {
            circle(d = 190);
            circle(d = 145);
            for(i = [1:4]) {
                rotate([0,0,90 * i])
                    translate([78.75,0,0])
                        screw_hole(5);
            }
        }
    }
}

module screw_hole(d) {
    circle(d=d);
}

base_ring();

// Cone
translate([0,0,3])
    difference() {
        cylinder(78, 95, 40);
        cylinder(78, 92, 37);
    }

// Gear drive
translate([0,0,68])
    difference() {
        cylinder(10, r=40);
        socket();
    }
    
// Platform
translate([0,0,78])
    cylinder(3, r=40);

// Tube adapter
translate([0,0,81]) {
    difference() {
        cylinder(20, 40, 26);
        cylinder(h = 20, r = 12);
    }
    tube_adapter(20);
}