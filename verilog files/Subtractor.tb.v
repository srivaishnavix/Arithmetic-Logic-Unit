
module testbench;
  reg [3:0] a, b;
  wire [3:0] s1;
  wire ctrl;
  
  Subtractor uut (
    .a(a),
    .b(b),
    .s1(s1),
    .ctrl(ctrl)
  );

  initial begin
    //$display("Starting");
    $dumpfile("Subtractor.vcd");
    //$dumpvars(0, Subtractor.tb);
    #20;
    a = 4'b1010; // Example input values (change as needed)
    b = 4'b0110; // Example input values (change as needed)
    #20;
    $display("%b - %b = %b %b", a, b, ctrl, s1);
    $finish;
  end

endmodule
