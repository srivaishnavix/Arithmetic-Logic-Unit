module Sub(
    output [3:0] s2,
    output ctrl,
    input [3:0] a,
    input [3:0] b
);
  //first Full Adder
  wire [3:0] s;
  wire c1, c2, c3;
  wire cout1;
  wire b3, b2, b1, b0;

  //for second full adder
  wire [3:0] s1;
  wire ctrl;
  wire k1,k2,k3,k0;
  wire cout2;

  //negation of b 
  xor #(1) NOT3 (b3, 1'b1, b[3]);
  xor #(1) NOT2 (b2, 1'b1, b[2]);
  xor #(1) NOT1 (b1, 1'b1, b[1]);
  xor #(1) NOT0 (b0, 1'b1, b[0]);

  //Full Adder 1
  FullAdder Ad10 (s[0], c1, a[0], b0, 1'b1);
  FullAdder Ad11 (s[1], c2, a[1], b1, c1);
  FullAdder Ad12 (s[2], c3, a[2], b2, c2);
  FullAdder Ad13 (s[3], cout1, a[3], b3, c3);

  //Negate of cout

  not #(1) NOTCout (ctrl, cout1);

  //XOR GAtes for the second full adder
  xor #(1) NOT4 (s1[3], ctrl, s[3]);
  xor #(1) NOT5 (s1[2], ctrl, s[2]);
  xor #(1) NOT6 (s1[1], ctrl, s[1]);
  xor #(1) NOT7 (s1[0], ctrl, s[0]);

  //Full Adder 2

  FullAdder Ad20 (s2[0], k0, 1'b0, s1[0], ctrl);
  FullAdder Ad21 (s2[1], k1, 1'b0, s1[1], k0);
  FullAdder Ad22 (s2[2], k2, 1'b0, s1[2], k1);
  FullAdder Ad23 (s2[3], cout2, 1'b0, s1[3], k2);


endmodule


