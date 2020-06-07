pinColor = "lightgrey";
plasticColor = [72/255, 72/255, 72/255];

module pin() {
  rotate(a=[0, 0, 180]) {
    color(pinColor)
      cube([0.5, 3, 0.2]);
    color(pinColor)
      cube([0.5, 0.2, 5]);
  }
}

// Soldering pins
module pins() {
  for (_i = [0:31]) {
    translate([1.47 * _i, 1, 0]) pin();
  }
}

module attachPin() {
  color(pinColor)
    cube([4, 3, 0.2]);
}

module cartridgePin() {
  color(pinColor)
    cube([0.5, 10, 0.2]);
  translate([0, 0, -1])
    color(pinColor)
    cube([0.5, 7.1, 1]);
}

module cartridgePins() {
  for (_i = [0:31]) {
    translate([1.47 * _i, 1, 0]) cartridgePin();
  }
}

module connector() {
  difference() {
    difference() {
      color(plasticColor)
        cube([57, 18, 7]);

      // For the soldering pins.
      translate([5, -1, -1])
        color(plasticColor)
        cube([47, 2, 6]);

      translate([-0.5, 17.8, 0.2])
        rotate([45, 0, 0])
        color(plasticColor)
        cube([58, 1, 2]);

      translate([-0.5, 17.8, 0.2])
        color(plasticColor)
        cube([58, 1, 2]);

      translate([-0.5, -0.1, 6.8])
        color(plasticColor)
        cube([58, 6, 0.3]);

      // Left corner
      translate([2, 15.5, 3])
        rotate([0, 0, 45])
        color(plasticColor)
        cube([1, 1, 4.1]);

      // Right corner
      translate([54.5, 16, 3])
        rotate([0, 0, -45])
        color(plasticColor)
        cube([1, 1, 4.1]);
    }

    translate([1, 16, 1])
      color(plasticColor)
      cube([55, 3, 17]);

    translate([-1, 4.5, 1])
      color(plasticColor)
      cube([3, 18, 17]);

    translate([0.5, 4.5, 1])
      color(plasticColor)
      cube([2, 18, 4.5]);

    translate([55, 4.5, 1])
      color(plasticColor)
      cube([3, 18, 17]);

    translate([54.5, 4.5, 1])
      color(plasticColor)
      cube([2, 18, 4.5]);

    translate([1, 6.5, 1])
      color(plasticColor)
      cube([55, 18, 2.1]);

    translate([1, 13, 1])
      color(plasticColor)
      cube([55, 3.1, 3]);

    // Left notch
    translate([12, 17, -1])
      color(plasticColor)
      cube([8, 18, 3]);

    // Right notch
    translate([37, 17, -1])
      color(plasticColor)
      cube([8, 18, 3]);
  }

  translate([6, 0, 0]) {
    pins();
  }

  translate([14, 17, 0]) {
    attachPin();
  }

  translate([39, 17, 0]) {
    attachPin();
  }

  translate([5.5, 5, 3.9]) {
    cartridgePins();
  }

  translate([16, 6.5, -1]) {
    color(plasticColor)
      cylinder(1, 1);
  }

  translate([41, 6.5, -1]) {
    color(plasticColor)
      cylinder(1, 1);
  }
}

translate([-28, -9, 0]) {
  connector();
}
