module MUX(
output [3:0] y1,
output [3:0] y2,
output [3:0] y3,
output [3:0] y4,
input [1:0] s,
input [3:0] a,
input [3:0] b

);
wire cout;
 Adder  mod0 (y1, cout, a, b);
 Sub  mod1 (y2, cout, a, b);
 Comparator  mod2 (y3, a, b);
 Anding  mod3 (y4, a, b);

endmodule