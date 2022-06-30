$fa = 1;
$fs = 0.4;

disc_offset = 18;
disc_thickness = 6;
disc_internal_diameter = 64;
overlap = 1;
bolt_hole_diameter = 8.5;
number_of_bolts = 6;
bolt_hole_pcd = 80;

// spacer_hole_diameter = 58;
// step_height = 8;

spacer_hole_diameter = 50;
step_height = 16;

difference() {
    union() {
        cylinder(h = disc_offset, r = 100 / 2);
        translate([0, 0, disc_offset - overlap]) {
            cylinder(h = disc_thickness + overlap,r = disc_internal_diameter / 2);
        }
    }
    translate([0, 0, -overlap]) {
        cylinder(h = step_height + overlap, r = disc_internal_diameter / 2);
    }
    cylinder(h = disc_offset + disc_thickness + overlap, r = spacer_hole_diameter / 2);
    for (angle = [0:360 / number_of_bolts:360]) {
        translate([bolt_hole_pcd / 2 * cos(angle), bolt_hole_pcd / 2 * sin(angle), -overlap]) {
            cylinder(h = disc_offset + 2 * overlap, r = bolt_hole_diameter / 2);
        }
    }
}
