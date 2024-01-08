
module testbench;
  reg [3:0] a, b;
  wire [3:0] s;
  
  Sub uut (
    .a(a),
    .b(b),
    .s(s),
    .cout(cout)
  );

  initial begin
    $display("The simulation is starting");
    a = 4'b1111; // Example input values (change as needed)
    b = 4'b1111; // Example input values (change as needed)
    #10;
    $display("%b - %b = %b %b", a, b, cout, s);
    $finish;
  end

endmodule
