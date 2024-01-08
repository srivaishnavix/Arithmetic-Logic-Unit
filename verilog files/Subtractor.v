module Subtractor(
    output [3:0] s1,
    output ctrl,
    input [3:0] a,
    input [3:0] b
);

  wire c1, c2, c3, ctrl;
  wire [3:0] s;
  wire b1,b2,b3,b0;
  //negation of b 
  not #(1) NOT3 (b3, b[3]);
  not #(1) NOT2 (b2, b[2]);
  not #(1) NOT1 (b1, b[1]);
  not #(1) NOT0 (b0, b[0]);

  FullAdder Ad0 (s[0], c1, a[0], b0, 1'b1);
  FullAdder Ad1 (s[1], c2, a[1], b1, c1);
  FullAdder Ad2 (s[2], c3, a[2], b2, c2);
  FullAdder Ad3 (s[3], cout, a[3], b3, c3);
  
  // Negation of Cout
  not #(1) NOT2 (ctrl, cout); 
  
    //for second full adder
  wire b23, b22,b21,b20;
  wire c20,c21,c22,c23;
  //Xor gate for the input for the second FUll adder
  xor #(1) XOR3 (b23, ctrl, s[3]);
  xor #(1) XOR2 (b22, ctrl, s[2]);
  xor #(1) XOR1 (b21, ctrl, s[1]);
  xor #(1) XOR0 (b20, ctrl, s[0]);

  //Second Full Adder to remove from the two's form when the output is negative
  //               op  ,carry, A, B

  FullAdder Ad10 (s1[0], c20, 1'b0, b20, ctrl);
  FullAdder Ad12 (s1[1], c21, 1'b0, b21, c20);
  FullAdder Ad13 (s1[2], c22, 1'b0, b22, c21);
  FullAdder Ad14 (s1[3], c23, 1'b0, b23, c22);

endmodule


