module cylinders(points, diameter, thickness) {
  for (p=points) {
    translate(p) {
      cylinder(d=diameter, h=thickness);
    }
  }
}

module crystal() {
  $fn = 50;
  translate([0, 0, 0]) {
    color("silver") {
      difference() {
        hull() {
          cylinders([[0, 0, 0], [10.9 - 4.5, 0, 0]], 4.5, 0.5);
        }
      }
    }
  }

  translate([0, 0, 0]) {
    color("silver") {
      difference() {
        hull() {
          cylinders([[0, 0, 0], [10.9 - 4.5, 0, 0]], 4, 3.5);
        }
      }
    }
  }

  translate([0, 0, -11.5]) {
    translate([0.6, 0, 0]) {
      color("silver") {
        cylinder(d=0.43, h=12.5);
      }
      translate([5, 0, 0]) {
        color("silver") {
          cylinder(d=0.43, h=12.5);
        }
      }
    }
  }
}

translate([-3.2, 0, 0]) {
  crystal();
}
