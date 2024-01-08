module decoder(
output [3:0] y0,
output [3:0] y1,
output [3:0] y2,
output [3:0] y3,
output cout,
output sign,
input [1:0] s,
input [3:0] a,
input [3:0] b
);


wire cout;
wire sign;

//the Input signal from the output Decoder and block
wire [3:0] a0;
wire [3:0] b0;
wire [3:0] a1;
wire [3:0] b1;
wire [3:0] a2;
wire [3:0] b2;
wire [3:0] a3;
wire [3:0] b3;

//enabling signal
wire d0, d1, d2, d3;

//negating select lines
wire s1n, s0n;
not (s1n, s[1]);
not (s0n, s[0]);

//decoder and block 
and #(1) D0 (d0, s1n, s0n);
and #(1) D1 (d1, s1n, s[0]);
and #(1) D2 (d2, s[1], s0n);
and #(1) D3 (d3, s[1], s[0]);

//calling enable block with the input of decoder and block
Enable #(1) en0 (a0,b0,d0,a,b);
Enable #(1) en1 (a1,b1,d1,a,b);
Enable #(1) en2 (a2,b2,d2,a,b);
Enable #(1) en3 (a3,b3,d3,a,b);

//calling the the arthematic mdules
Adder  mod0 (y0, cout, a0, b0);
Sub  mod1 (y1, sign, a1, b1);
Comparator  mod2 (y2, a2, b2);
Anding  mod3 (y3, a3, b3);

    
endmodule