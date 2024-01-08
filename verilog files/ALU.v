module ALU(
    input [1:0] s,
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
);
//wires for output for each select line
wire ga,gb,e;
wire [3:0] y0;
wire [3:0] y1;
wire [3:0] y2;
wire [3:0] y3;
//for decoder
//for negation 
wire s0n,s1n;
//for output of and block in decoder
wire d0,d1,d2,d3;
wire cout;
wire sign;

// for enable block
wire a0[3:0], a1[3:0], a2[3:0], a3[3:0];
wire b0[3:0], b1[3:0], b2[3:0], b3[3:0];


// Negation of Select lines
not #(1) NOT1 (s0n,s[0]);
not #(1) NOT2 (s1n,s[1]);

//And gates

and #(1) AND0 (d0,s0n,s1n);
and #(1) AND1 (d1,s1n,s[0]);
and #(1) AND1 (d2,s[1],s0n);
and #(1) AND1 (d3,s[1],s[0]);


// Enable Block

//For d0 (addition)

// for b

/and #(1) AND0B0 (b0[0],d0,b[0]);
/and #(1) AND0B1 (b0[1],d0,b[1]);
/and #(1) AND0B2 (b0[2],d0,b[2]);
/and #(1) AND0B3 (b0[3],d0,b[3]);
///for a

/and #(1) AND0A0 (a0[0],d0,a[0]);
/and #(1) AND0A1 (a0[1],d0,a[1]);
/and #(1) AND0A2 (a0[2],d0,a[2]);
/and #(1) AND0A3 (a0[3],d0,a[3]);

//calling module
Adder M0 (y0,cout,a0,b0);

//For d1 (subtraction)
// for b
and #(1) AND1B0 (b1[0],d1,b[0]);
and #(1) AND1B1 (b1[1],d1,b[1]);
and #(1) AND1B2 (b1[2],d1,b[2]);
and #(1) AND1B3 (b1[3],d1,b[3]);
//for a
and #(1) AND1A0 (a1[0],d1,a[0]);
and #(1) AND1A1 (a1[1],d1,a[1]);
and #(1) AND1A2 (a1[2],d1,a[2]);
and #(1) AND1A3 (a1[3],d1,a[3]);

//calling module
Subtractor M1 (y1,sign,a1,b1);


//For d2 (Comparator)
// for b

and #(1) AND2B0 (b2[0],d2,b[0]);
and #(1) AND2B1 (b2[1],d2,b[1]);
and #(1) AND2B2 (b2[2],d2,b[2]);
and #(1) AND2B3 (b2[3],d2,b[3]);
//for a

and #(1) AND2A0 (a2[0],d2,a[0]);
and #(1) AND2A1 (a2[1],d2,a[1]);
and #(1) AND2A2 (a2[2],d2,a[2]);
and #(1) AND2A3 (a2[3],d2,a[3]);
//calling module
Comparator M2 (a2,b2,ga,gb,e);

//For d3 (Anding)
// for b

and #(1) AND3B0 (b3[0],d3,b[0]);
and #(1) AND3B1 (b3[1],d3,b[1]);
and #(1) AND3B2 (b3[2],d3,b[2]);
and #(1) AND3B3 (b3[3],d3,b[3]);
//for a
and #(1) AND3A0 (a3[0],d3,a[0]);
and #(1) AND3A1 (a3[1],d3,a[1]);
and #(1) AND3A2 (a3[2],d3,a[2]);
and #(1) AND3A3 (a3[3],d3,a[3]);
//calling module
Anding M3 (y3,a3,b3);


//result
or #(1) ORRESULT (y,y0,y1,y3);

endmodule
