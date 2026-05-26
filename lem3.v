module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter LEFT=2'b00,RIGHT=2'b01,FALL=2'b10,DIG=2'b11;
    reg [1:0] state,next_state, prev_state;
    assign walk_left=state==LEFT;
    assign walk_right=state==RIGHT;
    assign aaah=state==FALL;
    assign digging=DIG==state;
    always @(*)
        begin
            if(~ground)
                next_state=FALL;
            else if(dig|state==DIG)
                next_state=DIG;
            else if(bump_left&&bump_right)
                begin
                    if(state==LEFT)
                        next_state=RIGHT;
                    else
                        next_state=LEFT;
                end
            else if(bump_left)
                next_state=RIGHT;
            else if(bump_right)
                next_state=LEFT;
            else
                next_state=state;
        end
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                state<=LEFT;
            else if(state==FALL&ground!=0)
                state<=prev_state;
            else if((next_state==FALL||next_state==DIG)&state!=FALL&state!=DIG)
                begin
                    prev_state<=state;
                    state<=next_state;
                end
            else
                state<=next_state;
        end
                    
endmodule