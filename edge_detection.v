module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] prev_state;
    always @(posedge clk)
        begin
            if((prev_state^in)!=0 & ~(& prev_state))
                begin
                    pedge=(prev_state^in)&(~prev_state);
                    prev_state=in;
                end
            else
                begin
                    pedge=0;
                    prev_state=in;
                end 
        end
endmodule