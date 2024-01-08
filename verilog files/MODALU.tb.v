module ALUMOD(
    input [1:0] s,
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
);
  // Wires for output for each select line
  wire [3:0] y0, y1, y2, y3;

  // Signals for decoder
  wire s0n, s1n;
  wire d0, d1, d2, d3;
  wire cout;
  wire sign;

  // Adder, Subtractor, Comparator, and Anding outputs
  wire [3:0] adder_out, subtractor_out, comparator_out, anding_out;

  // Negation of Select lines
  assign s0n = ~s[0];
  assign s1n = ~s[1];

  // Decoder logic
  assign d0 = s0n & s1n;
  assign d1 = s1n & s0;
  assign d2 = s1 & s0n;
  assign d3 = s1 & s0;

  // Adder
  Adder M0 (.a(a), .b(b), .y(adder_out), .cout(cout));

  // Subtractor
  Subtractor M1 (.a(a), .b(b), .y(subtractor_out), .sign(sign));

  // Comparator
  Comparator M2 (.a(a), .b(b), .ga(ga), .gb(gb), .e(e));

  // Anding
  Anding M3 (.a(a), .b(b), .y(anding_out));

  // Multiplexer for selecting the output based on s
  always @(*)
  begin
    if (s == 2'b00)
      y = adder_out;
    else if (s == 2'b01)
      y = subtractor_out;
    else if (s == 2'b10)
      y = 4b'0000;
    else if (s == 2'b11)
      y = anding_out;
    else
      y = 4'bxxxx; // Handle any undefined cases
  end

endmodule
