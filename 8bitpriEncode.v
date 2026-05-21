module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    always @(*)
        begin
            casez(in)
                8'bZZZZZZZ1:
                    pos=3'd0;
                8'bZZZZZZ1Z:
                    pos=3'd1;
                8'bZZZZZ1ZZ:
                    pos=3'd2;
                8'bZZZZ1ZZZ:
                    pos=3'd3;
                8'bZZZ1ZZZZ:
                    pos=3'd4;
                8'bZZ1ZZZZZ:
                    pos=3'd5;
                8'bZ1ZZZZZZ:
                    pos=3'd6;
                8'b1ZZZZZZZ:
                    pos=3'd7;
                default:
                    pos=0;
            endcase
        end
endmodule