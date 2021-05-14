pinWidth = 0.79;
pinColor = "lightgrey";
plasticColor = [72/255, 72/255, 72/255];

module pin() {
  rotate(a=[0, 0, 180]) {
    color(pinColor)
      cube([pinWidth, 3, 0.2]);
    color(pinColor)
      cube([pinWidth, 0.2, 5]);
  }
}

// Soldering pins
module pins() {
  for (_i = [0:31]) {
    translate([(0.7 + pinWidth) * _i, 1, 0]) pin();
  }
}

module attachPin() {
  difference() {
    translate([0, -2, 0])
      color(pinColor)
      cube([4, 5, 0.2]);

    translate([0, -2, -1])
      cube([1, 2, 1]);

    translate([3, -2, -1])
      cube([1, 2, 1]);

    translate([0.75, 1.25, -0.1])
      color(pinColor)
      cube([2.5, 1, 0.4]);
  }
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

module notch() {
  color(plasticColor)
    cube([8, 1, 3]);

  translate([3, -2, 0.5])
    color(plasticColor)
    cube([2, 2, 1]);
}

module connector() {
  difference() {
    difference() {
      color(plasticColor)
        cube([57, 18, 7]);

      // For the soldering pins.
      translate([5, -1, -1])
        color(plasticColor)
        cube([47.4, 1.5, 6]);

      // Left hole on the back.
      translate([1.5, -1, 1])
        color(plasticColor)
        cube([2, 5, 4.5]);

      // Right hole on the back.
      translate([53.5, -1, 1])
        color(plasticColor)
        cube([2, 5, 4.5]);

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
    translate([11.6, 17, -1])
      notch();

    // Right notch
    translate([37.4, 17, -1])
      notch();
  }

  translate([6, -0.5, 0]) {
    pins();
  }

  translate([11.6 + 2, 17, 0]) {
    attachPin();
  }

  translate([37.4 + 2, 17, 0]) {
    attachPin();
  }

  translate([5.5, 5, 3.9]) {
    cartridgePins();
  }

  translate([15.5, 6.5, -1]) {
    color(plasticColor)
      cylinder(1, 1);
  }

  translate([41.5, 6.5, -1]) {
    color(plasticColor)
      cylinder(1, 1);
  }
}

translate([-28, -9, 0]) {
  connector();
}
