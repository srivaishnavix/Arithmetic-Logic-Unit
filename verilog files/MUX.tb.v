    module MUX_tb;

    reg [1:0] s;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] y1;
    wire [3:0] y2;
    wire [3:0] y3;
    wire [3:0] y4;


    MUX comp (
        .s(s),
        .a(a),
        .b(b),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4)
    );

    initial begin
        // Test Case 1: Addition
        s = 2'b01;
        a = 4'b1011;
        b = 4'b0011;
        #10; //delay
        $display(" y1 = %b y2 = %b, y3 = %b, y4= %b", y1 , y2,y3 , y4);



        $finish; 
    end 

    endmodule
