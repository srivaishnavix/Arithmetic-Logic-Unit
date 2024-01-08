
module testbench;
  reg [3:0] a, b;
  wire [3:0] s;
  wire cout;
  
  Adder uut (
    .a(a),
    .b(b),
    .s(s),
    .cout(cout)
  );

  initial begin
    $display("The simulation is starting");
    
    #10
    a = 4'b1010; // Example input values (change as needed)
    b = 4'b0110; // Example input values (change as needed)
    #10;
    $display("%b + %b = %b %b", a, b, cout, s);
    $finish;
  end

endmodule
