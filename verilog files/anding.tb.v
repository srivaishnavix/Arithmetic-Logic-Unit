module Anding_tb;

  reg [3:0] a, b;
  wire [3:0]s;

  Anding comp (
    .a(a),
    .b(b),
    .s(s)
  );
// b3*2^3 + b2*2^2 + b1*2^1 + b0*2^0 = 0011 & 0100 = 
// 
  initial begin
    a = 4'b0011;
    b = 4'b0100;
    #10; 
    $display("%b & %b = %b", a, b, s);

    $finish; 
  end

endmodule
