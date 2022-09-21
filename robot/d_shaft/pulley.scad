// Customizable pulley generator
//
// Copy 

// Distance between teeth on belt (2.0 for GT2 belt)
belt_pitch = 2.0;

// Number of grooves on pulley
grooves = 20;

// Diameter of each groove (1.5 for GT2 belt)
groove_diameter = 1.5;

// Pulley width (typically 6.5 for 6 mm belt)
width = 6.5;

// Bore diameter
bore = 5.2;

// Difference between pitch radius and outside radius (0.254 is a good value for GT2 belts)
pitch_radius_delta = 0.254;

/* [Secondary/large pulley] */
// Enable/disable secondary/large pulley
include_secondary = false;

// Number of grooves on secondary (larger) pulley
secondary_grooves = 80;

/* [Hub section] */
// Enable/disable hub section
include_hub_section = true;

// Number of grub screw holes
grub_screw_holes = 1; // [0, 1, 2, 3, 4]

// Option to make grub hole tear shaped for easier printing
grub_bore_tear_shaped = false;

// Maximum diameter of grub screw section 
hub_max_diameter = 16;

// Height of hub section (will be 1 less than this if same size as pulley)
hub_width = 4;

// Diameter of hole for grub screws
grub_bore = 2.6;


/* [Internals] */
ext = 1.0; // [0.0:0.1:2.0]
tau = 6.28318530717958647693;
function pulley_radius(grooves) = belt_pitch * grooves / tau - pitch_radius_delta;
pulley_radius = pulley_radius(grooves);
secondary_radius = pulley_radius(secondary_grooves);
e = 1e-3;

$fn = 64;
module grooved(width, radius, grooves) {
    difference() {
        cylinder(width, r=radius);
        for (i = [1:grooves]) {
            rotate(i*360/grooves, [0,0,1])
            translate([radius, 0, -e])
            cylinder(width+2*e, d=groove_diameter, $fn=24);
        }
    }
}

module pulley(grooves) {
    union() {
        radius = pulley_radius(grooves);
        cylinder(h=ext, r=radius+ext);

        translate([0,0,1*ext])
        cylinder(h=ext, r1=radius+ext, r2=radius);

        translate([0,0,2*ext])
        grooved(width, radius, grooves);

        translate([0,0,2*ext+width])
        cylinder(h=ext, r1=radius, r2=radius+ext);

        translate([0,0,3*ext+width])
        cylinder(h=ext, r=radius+ext);
    }
}

module grub_holes() {
    if (grub_screw_holes > 0) {
        for (i = [1:grub_screw_holes]) {
            rotate(90 * i, [0, 0, 1])
            rotate(90, [1,0,0])
            rotate(45, [0,0,1])
            union() {
                cylinder(h=100, d=grub_bore);
                if (grub_bore_tear_shaped) {
                    cube([grub_bore/2, grub_bore/2, 100]);
                }
            }
        }
    }
}

difference() {
    hub_radius = min(hub_max_diameter/2, pulley_radius+1);
    hub_reuse = (hub_radius < (pulley_radius(grooves) + 1)) ? 0 : 1;
    hub_build_height = hub_width - hub_reuse;
    union() {
        translate([0,0,width+4*ext])
        pulley(grooves);

        if (include_secondary) {
            pulley(secondary_grooves);
        }
        if (include_hub_section) {
            translate([0,0,2*width+8*ext])
            difference() {
                union() {
                    cylinder(h=hub_build_height, r=hub_radius);
                    translate([0,0,hub_build_height])
                        cylinder(h=1, r1=hub_radius, r2=hub_radius-1);
                }
            }
        }
    }
    translate([0,0,-1]) 
        cylinder(h=100, d=bore);
    if (include_hub_section) {
        translate([0,0,2*width+8*ext+hub_build_height/2-hub_reuse/2]) 
            grub_holes();
    }
}
