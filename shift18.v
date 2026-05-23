module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always @(posedge clk)
        begin
            if(load)
                q<=data;
            else if(ena)
                begin
                    if(amount==0)
                        q<=q<<<1;
                    else if(amount==1)
                        q<=q<<<8;
                    else if(amount==2)
                        q<=q>>1 | (q[63]<<63);
                    else
                        begin
                            if(q[63]==0)
                                q<=q>>8;
                            else
                                q<=q>>8|(8'hFF<<56);
                        end
                end
            else
                q<=q;
        end
endmodule
