module top_module (
    input clk,
    input in, 
    output out);
	reg d;
    reg q;
    always @(*)
        begin
            d=in^q;
        end
    always @(posedge clk)
        begin
            q<=d;
        end
        assign out=q;
endmodule