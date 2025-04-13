include <hook.scad>

module hookset(num_hooks) {
    for (i = [0:1:num_hooks - 1])
        translate([i*25, 0, 0])
            hook();
}
