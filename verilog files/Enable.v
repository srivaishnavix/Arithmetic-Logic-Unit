module Enable(
    output [3:0] c,
    output [3:0] d,
    input e,
    input [3:0] a,
    input [3:0] b
);

and #(1) EnableAND1 (c[0], e, a[0]);
and #(1) EnableAND2 (c[1], e, a[1]);
and #(1) EnableAND3 (c[2], e, a[2]);
and #(1) EnableAND4 (c[3], e, a[3]);

and #(1) EnableAND5 (d[0], e, b[0]);
and #(1) EnableAND6 (d[1], e, b[1]);
and #(1) EnableAND7 (d[2], e, b[2]);
and #(1) EnableAND8 (d[3], e, b[3]);
endmodule 
