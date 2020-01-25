/*
  Project: Spool-kun v2
  Part: Top Brace

  Revision:
  2018-09-23: creation

  dwu <dyanawu@gmail.com>
  
*/

use <MCAD/fasteners/nuts_and_bolts.scad>

$fn = 128;

brace_points = [[0,0],
								[44,0],
								[44,30],
								[96.5,30],
								[96.5,22],
								[84,22],
								[84,18],
								[100,18],
								[100,34],
								[40,34],
								[40,15],
								[0,15]];

module brace_body() {
	difference() {
		linear_extrude(height = 15) {
			polygon(points = brace_points, convexity = 10);
		}
		translate([14,17.5,7.5]) {
			rotate([90,0,0]) {
				cylinder(r = 5, h = 20);
			}
		}
	}
}

module brace_fasthole() {
	translate([5,7.5,7.5]) {
		rotate([0,90,0]) {
			mcad_bolt_hole_with_nut( size = 3,
															 length = 12,
															 align = "center",
															 nut_projection = "radial");
		}
	}
}

difference() {
  brace_body();
	brace_fasthole();
}
