module tube_adapter(h) {
    difference() {
        cylinder(h, r = 13.75);
        tube_interior(h);
    }
}

module tube_interior(h) {
    cylinder(h, r = 11);
}