module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] prev_state;
    always @(posedge clk)
        begin
            if(reset)
                begin
                    out=0;
                    prev_state=in;
                end
            else
                begin
                    out=out|((prev_state^in)&prev_state);
                    prev_state=in;
                end
        end
endmodule