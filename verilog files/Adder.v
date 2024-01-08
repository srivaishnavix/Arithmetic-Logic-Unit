module Adder(
    output [3:0] s,
    output cout,
    input [3:0] a,
    input [3:0] b
);

  wire c1, c2, c3;
  FullAdder A0 (s[0], c1, a[0], b[0], 1'b0);
  FullAdder A1 (s[1], c2, a[1], b[1], c1);
  FullAdder A2 (s[2], c3, a[2], b[2], c2);
  FullAdder A3 (s[3], cout, a[3], b[3], c3);

endmodule



