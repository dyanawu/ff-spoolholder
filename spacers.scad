$fn = 100;

difference() {
	cylinder(r = 10, h = 10, center = true);
	cylinder(r = 5, h = 11, center = true);
}

translate([30,0,0]) {
	difference() {
		cylinder(r = 10, h = 5, center = true);
		cylinder(r = 5, h = 6, center = true);
	}
}
