module Comparator(
    output [3:0] y,
    input [3:0] a,
    input [3:0] b
    
);

wire x3, x2, x1, x0, e, b1, ga, gb, ya3, ya2, ya1, ya0, yb3, yb2, yb1, yb0;
wire bn1,bn2,bn3,bn0;
wire an1,an2,an3,an0;


//equality check
xnor(x3,a[3],b[3]);
xnor(x2,a[2],b[2]);
xnor(x1,a[1],b[1]);
xnor(x0,a[0],b[0]);

//checking for equality condition

and(e,x3,x2,x1,x0);

//checking for A greater than B 
//negating b
not(bn3,b[3]);
not(bn2,b[2]);
not(bn1,b[1]);
not(bn0,b[0]);

//using and to check the bits of a and b
and(ya3,a[3],bn3);
and(ya2,a[2],bn2,x3);
and(ya1,a[1],bn1,x3,x2);
and(ya0,a[0],bn0,x3,x2,x1);

//or gate
or(ga,ya3,ya2,ya1,ya0);

//chcking for B greater than A
//negating the value of a
not(an3,a[3]);
not(an2,a[2]);
not(an1,a[1]);
not(an0,a[0]);

//using and to check every bit of the a and b
and(yb3,b[3],an3);
and(yb2,b[2],an2,x3);
and(yb1,b[1],an1,x3,x2);
and(yb0,b[0],an0,x3,x2,x1);

//to check if b is greater
or(gb,yb3,yb2,yb1,yb0);

    assign y = {1'b0,ga,gb,e};


endmodule