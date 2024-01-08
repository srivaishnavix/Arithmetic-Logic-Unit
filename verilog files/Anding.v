module Anding(
  output [3:0] s,
  input [3:0] a,
  input [3:0] b
);


  and #2 AND0 (s[0], a[0], b[0]);
  and #2 AND1 (s[1], a[1], b[1]);
  and #2 AND2 (s[2], a[2], b[2]);
  and #2 AND3 (s[3], a[3], b[3]);

endmodule