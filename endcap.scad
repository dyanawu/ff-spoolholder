/*
  Project: Spool-kun v2
  Part: End Cap

  Revision:
  2018-09-23: creation

  dwu <dyanawu@gmail.com>
  
*/

use <MCAD/fasteners/nuts_and_bolts.scad>

$fn = 128;

module body() {
	difference() {
		cylinder(r = 10, h = 25);
		translate([0,0,5]) {
			cylinder(r = 5, h = 21);
		}
	}
}

difference() {
	body();

	translate([0,0,17]) {
		rotate([90,0,0]) {
			mcad_bolt_hole_with_nut(size = 3,
															length = 15,
															align_with = "center");
		}
	}
}
