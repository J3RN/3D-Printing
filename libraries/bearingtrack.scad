$fn = 100;

module bearing_track() {
    rotate_extrude(angle = 360) {
        translate([36,0,0])
            circle(r=3.2);
    }
}