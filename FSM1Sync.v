module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state<=0;
        end else begin
            case (present_state)
                // Fill in state transition logic
                1'b0:
                    begin
                        if(in==1)
                            present_state<=0;
                        else
                            present_state<=1;
                    end
                default:
                    begin
                        if(in==1)
                            present_state<=1;
                        else
                            present_state<=0;
                    end
            endcase
                
        end
    end
	assign out=!present_state;
endmodule
