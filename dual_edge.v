module top_module (
    input clk,
    input d,
    output q
);
   reg pos, neg;
    always @(posedge clk)
        begin
            pos<=d;
        end
    always @(negedge clk)
        begin
            neg<=d;
        end
    always @(*)
        begin
            if(clk)
                q<=pos;
            else
                q<=neg;
        end
endmodule