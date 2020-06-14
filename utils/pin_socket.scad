module pin_socket(cols=1, rows=1, pin_height=5, spacing=2.54) {
  socket_height = 7;
  pin_width = 0.64;

  translate([
      -(rows * spacing / 2) + spacing / 2,
      -(cols * spacing / 2) + spacing / 2,
      0
  ]) {
    for (col = [0:cols - 1]) {
      for (row = [0:rows - 1]) {
        translate([spacing * row, spacing * col, 0]) {
          translate([0, 0, socket_height / 2]) {
            difference() {
              color("dimgray")
                cube([spacing, spacing, socket_height], center=true);

              translate([0, 0, 1]) {
                cube([pin_width, pin_width, socket_height], center=true);
              }

              translate([0, 0, 0.01 + socket_height / 2]) {
                rotate([180, 0, 0]) pin_tip("dimgray");
              }
            }

            translate([0, 0, -(pin_height / 2) + 1]) {
              color("gold")
                cube([pin_width, pin_width, pin_height], center=true);

              translate([0, 0, -(pin_height / 2)]) {
                scale(pin_width) rotate([180, 0, 0]) pin_tip();
              }
            }
          }
        }
      }
    }
  }

  module pin_tip(c="gold") {
    translate([-0.5, -0.5, 0]) {
      color(c)
        polyhedron(
          [
            [0,  0,  0],
            [1,  0,  0],
            [0,  1,  0],
            [1,  1,  0],
            [0.5, 0.5, 0.5]
          ],
          [
            [4, 1, 0],
            [4, 3, 1],
            [4, 2, 3],
            [4, 0, 2],
            [0, 1, 2],
            [2, 1, 3]
          ]
        );
    }
  }
}
