module ALU_tb;

  reg [1:0] s;
  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] y;

  ALU comp (
    .s(s),
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    // Test Case 1: Addition
    s = 2'b01;
    a = 4'b1011;
    b = 4'b0011;
    #10; //delay
    $display(" s = %b y = %b, a = %b, b = %b", s, y, a, b);



    $finish; 
  end

endmodule
