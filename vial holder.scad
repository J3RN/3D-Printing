module base() {
    translate([0,0,16]) {
        rotate([0, 180, 0]){
            difference() {
                cylinder(36, 36, 0);
                translate([0, 0, -1]){
                cylinder(35, 35, 0);
                }
                translate([-25,-25,16]) {
                    cube(50);
                }
            }
        }
    }
}

module round_roof(depth = 10, radius = 10) {
    difference() {
        linear_extrude(depth){
            circle(radius);
        }
        cubeSize = max(depth, 2*radius) + 1;
        translate([0, -cubeSize/2, -1]) {
        cube(cubeSize);
        }
    }
}

module leg_part() {
    difference () {
        scale([1,2,1]) {
            round_roof();
        }
        translate([0,0,-0.1]){
            scale([1,2,1.1]) {
                round_roof(radius=8);
            }
        }
    }
}

module leg() {
    translate([-5, 32, -10]){
    rotate([-60, 0, 0]){
        rotate([0, 90, 0]) {
    leg_part();
    translate([0,36,0]) {
        rotate([0, 0, 180]){
            leg_part();
        }
    }
}
}
}
}

module legs() {
    leg();

rotate([0, 0, 120]){
    leg();
}

rotate([0, 0, 240]){
    leg();
}
}

base();
difference() {
    legs();
    translate([0, 0, -1]){
        rotate([0, 180, 0]){
        cylinder(35, 35, 0);
        }
    }
}