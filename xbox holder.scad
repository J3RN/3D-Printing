include <hookset.scad>

module holder(height, width, depth) {
    cube([width, 3, height]);
    cube([width, depth, 3]);

    let(hyp = sqrt(depth^2 + height^2)){
        let(foot_length = 17){
            translate([0, depth, 0]){
                rotate([acos(height/hyp)]) {
                    cube([width, 3, hyp]);
                    cube([width, foot_length + 3, 3]);
                }
            }
        }
    }
}

module holder_with_hooks(height, width, depth) {
    holder(height, width, depth);

    translate([(width - 25)/2, -10, height - 5])
        rotate([-90,0,0])
            hookset(2);
}

holder_with_hooks(57, 50, 57);
