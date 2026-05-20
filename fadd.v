module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
    
);//
	wire cot,spare;
    add16 o(a[15:0],b[15:0],1'b0,sum[15:0],cot);
    add16 t(a[31:16],b[31:16],cot,sum[31:16],spare);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
	assign sum=a^b^cin;
    assign cout=a&b||b&&cin||a&&cin;
endmodule
