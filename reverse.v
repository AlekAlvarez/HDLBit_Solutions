module top_module( 
    input [99:0] in,
    output [99:0] out
);
    always @(*)
        begin
            reg [6:0] i;
            for(i=0;i<100;i=i+1)
                begin
                    out[100-i-1]=in[i];
                end
        end
endmodule