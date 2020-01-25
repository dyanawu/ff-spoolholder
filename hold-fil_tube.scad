/*
  Project: Spool-kun 2.0
  Part: filament tube holder

  Revision:
  2018-08-31: creation
	2018-09-23: add 

  dwu <dyanawu@gmail.com>
*/

use <MCAD/fasteners/nuts_and_bolts.scad>
use <ClothBotCreations/utilities/fillet.scad>

$fn = 128;

rad  = 0.25; // smoothing
it   = 1;
ot   = 1;
lip  = 2.5;
body = 12;
id   = 5.825;

holder_pts = [[0, 0],
              [it,-lip],
              [it+ot,-lip],
              [it+ot,(lip*2)+body],
              [it,(lip*2)+body],
              [0,lip+body]
	];

module guide_holder() {
	rotate_extrude(angle = 360, convexity = 4) {
		translate([(id/2)+rad,lip+rad,0]) {
			offset(r=rad) {
				polygon(points = holder_pts);
			}
		}
	}
}

module guide_arch() {
	rotate_extrude(angle = 90, convexity = 2) {
		translate([100,1]) {
			offset(r=1) {
				square([4,18]);
			}
		}
	}
}

module fil_guide() {
	difference(){
		union() {
			guide_arch();
			translate([102,-4,0]) {
				guide_holder();
			}
		}
		translate([0,102,10]) {
			rotate([90,0,0]) {
				cylinder(r = 9, h = 10, center = true);
			}
		}
	}
}

module holder_tjoint_outer() {
	fillet(r = 3, steps = 15) {
		cylinder(h = 30, r = 10);
		translate([0,30,30]) {
			rotate([90,0,0]) {
				cylinder(h = 60, r = 10);
			}
		}
	}
}

module holder_tjoint_inner() {
	union() {
		translate([0,0,-1]) {
			cylinder(h = 32, r = 5);
		}
		translate([0,31,30]) {
			rotate([90,0,0]) {
				cylinder(h = 62, r = 5);
			}
		}
	}
}

module holder_fasthole() {
	translate([0,-10,30]) {
		rotate([0,-90,0]) {
			mcad_bolt_hole_with_nut( size = 3,
															 length = 15,
															 align_with = "center");
		}
	}
}

module holder_tjoint() {
	difference() {
		holder_tjoint_outer();
		holder_tjoint_inner();
		holder_fasthole();
	}
}

union() {
	fil_guide();
	{
		translate([-30,102,10]) {
			rotate([0,90,0]) {
				holder_tjoint();
			}
		}
	}
}
