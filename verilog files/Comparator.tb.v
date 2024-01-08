module Comparator_tb;

  reg [3:0] a, b;
  wire [3:0]y;

  Comparator comp (
    .a(a),
    .b(b),
    .y(y)
    
  );

  initial begin
    a = 4'b0111;
    b = 4'b1111;
    #10; 
    $display("0 ga gb e %b", y);

    $finish; 
  end

endmodule
