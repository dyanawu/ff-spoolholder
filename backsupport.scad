/*
	Project: Spool-kun 2.0
	Part: back wall support

	Revision:
	2018-09-04: creation

	dwu <dyanawu@gmail.com>
*/

include <MCAD/units/metric.scad>
use <MCAD/fasteners/threads.scad>
use <MCAD/shapes/cylinder.scad>

$fn = 128;

//from OpenSCAD Language Reference
module regular_polygon(order, r=1)
{
	angles=[ for (i = [0:order-1]) i*(360/order) ];
	coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
	polygon(coords);
}

module threaded_bit() {
	difference() {
		metric_thread(diameter = 30,
									pitch = 1.5,
									length = 20);
		translate(Z*-0.5) {
			cylinder(h = 21,
							 r = 10);
		}
	}
}

module flat_nut() {
	difference() {
		linear_extrude(height = 7.5,
									 center = true) {
			offset(r = 2) {
				regular_polygon(6, r=18);
			}
		}
		translate(Z*-4) {
			metric_thread(diameter = 30.5,
										pitch = 1.5,
										length = 8,
										internal = true,
										center = true);
		}
	}
}
	
module rod_mount() {
	difference() {
		mcad_tube(od = 34,
							id = 20,
							h = 45+0.01,
							center = true);
		translate(Z*15) {
			rotate(X*90) {
				cylinder(h = 40,
								 r = 5,
								 center = true);
			}
		}
	}
}

union() {
	translate(Z*45) {
		threaded_bit();
	}
	rod_mount();
}

translate((X*40)+(Z*2.5)) {
	flat_nut();
}
