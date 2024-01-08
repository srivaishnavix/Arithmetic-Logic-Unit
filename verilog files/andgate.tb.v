module and_gate_tb;

  // Inputs
  reg a, b;

  // Output
  wire y;

  // Instantiate the AND gate module
  and_gate uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Testbench stimulus
  initial begin
    $display("Time a b y");
    $monitor("%d %b %b %b", $time, a, b, y);

    // Simulate inputs
    a = 0;
    b = 0;
    #10; // Delay for 10 time units
    a = 0;
    b = 1;
    #10;
    a = 1;
    b = 0;
    #10;
    a = 1;
    b = 1;
    #10;

    // Terminate simulation
    $finish;
  end

endmodule
