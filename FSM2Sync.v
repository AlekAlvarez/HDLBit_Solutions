module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if(reset)
            next_state=OFF;
        else if(state==OFF)
            begin
                if(j==0)
                    next_state=OFF;
                else
                    next_state=ON;
            end
        else
            begin
                if(k==0)
                    next_state=ON;
                else
                    next_state=OFF;
            end
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        state<=next_state;
    end

    // Output logic
     assign out = state;

endmodule
