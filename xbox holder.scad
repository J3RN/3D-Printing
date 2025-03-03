module holder(height, width, depth) {
    translate([0,0,height-20])
      cube([width, 3, 20]);
    //cube([width, depth, 3]);

    let(hyp = sqrt(depth^2 + height^2)){
        let(foot_length = 15){
            translate([0, depth, 0]){
                rotate([acos(height/hyp)]) {
                    cube([width, 3, hyp]);
                    cube([width, foot_length + 3, 3]);
                    translate([0, foot_length + 3, 0])
                        cube([width, 3, 10]);
                }
            }
        }
    }
}

module hook() {
    translate([0,4,0])
        let(rad = 5) {
        translate([0,rad,rad])
            cylinder(h=5,r=2,$fn=100);

        rotate([90,0,0])
            cylinder(h=5,r=2,$fn=100);

        translate([0,0,rad])
            rotate([0,90,0])
            rotate_extrude(angle=90, $fn=100)

            translate([rad,0,0])
            circle(r=2);
    }
}

module holder_with_hooks(height, width, depth) {
    holder(height, width, depth);

    translate([(width - 25)/2,0,height - 5]) {
        rotate([0,0,180])
            hook();

        translate([25,0,0])
            rotate([0,0,180])
            hook();
    }
}

holder_with_hooks(90, 80, 30);
