
module FullAdder(
    output s,
    output cout,
    input a,
    input b,
    input c
);

  wire h1, h2, h3,b1;

  // Expression for Sum
  xor #(1) XOR1 (h1, a, b); 
  xor #(1) XOR2 ( s, h1, c);
  
  // Expression for Cout
  and #(1) AND1 (h3, h1, c);
  and #(1) AND2 (h2, a, b);
  or #(1) OR1 (cout, h3, h2);

endmodule