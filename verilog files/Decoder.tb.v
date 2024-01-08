`timescale 1ns / 1ps

module tb_decoder;
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] S;
    wire cout;
    wire sign;
    wire [3:0] y0, y1, y2, y3;
    

    decoder UUT(
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .cout(cout),
        .sign(sign),
        .s(S),
        .a(A),
        .b(B));

    // Initialize inputs
    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0, UUT);
        
        A = 4'b0111; // Input A
        B = 4'b1110; // Input B
        
        //select lines

        S = 2'b00;   // Select bits for Decoder

        #50;
        $display("S = %b, A = %b, B = %b, carry = %b Y0 = %b, Y1 = %b, Y2 = %b, Y3 = %b", S, A, B, cout, y0, y1, y2, y3);

        // Change select bits for different outputs
        S = 2'b01;   // Change select bits for different outputs
        #50;
        $display("S = %b, A = %b, B = %b, Y0 = %b, sign = %b Y1 = %b, Y2 = %b, Y3 = %b", S, A, B, y0, sign, y1, y2, y3);

        S = 2'b10;
        #50;
        $display("S = %b, A = %b, B = %b, Y0 = %b, Y1 = %b, {0,ga,gb,e} Y2 = %b, Y3 = %b", S, A, B, y0, y1, y2, y3);

        S = 2'b11;
        #50;
        $display("S = %b, A = %b, B = %b, Y0 = %b, Y1 = %b, Y2 = %b, Y3 = %b", S, A, B, y0, y1, y2, y3);

        // Finish simulation
        $finish;
    end
endmodule
