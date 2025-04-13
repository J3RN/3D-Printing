include <hookset.scad>

module holder(height, width, depth) {
    cube([width, 3, height]);
    cube([width, depth, 3]);

    let(hyp = sqrt(depth^2 + height^2)){
        let(foot_length = 30){
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

module holder_with_hooks(height, width, depth, num_hooks) {
    holder(height, width, depth);

    translate([(width - ((num_hooks - 1) * 25))/2, -10, height-5])
        rotate([-90,0,0])
            hookset(5);
}

holder_with_hooks(130, 130, 50, 5);
