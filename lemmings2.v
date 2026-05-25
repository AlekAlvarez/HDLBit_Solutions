module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
	parameter LEFT=0,RIGHT=1,FALL=2;
    reg[1:0] state,next_state;
    reg was_right,cyc;
    reg was_fallen;
    assign walk_left=state==LEFT;
    assign walk_right=state==RIGHT;
    assign aaah=state==FALL;
    always @(*)
        begin
            if(bump_left&bump_right)
                next_state=state==RIGHT?LEFT:RIGHT;
            else if(bump_left)
                next_state=RIGHT;
            else if(bump_right)
                next_state=LEFT;
            else
                next_state=state;
            if(ground&was_fallen&cyc)
                was_fallen=0;
            if(walk_left)
                was_right=0;
            if(walk_right)
                was_right=1;
            if(state==FALL)
                was_fallen=1;
        end
    always @(posedge areset or posedge clk)
        begin
            if(areset)
                begin
                	state<=LEFT;
                    cyc<=0;
                end
            else if(~ground)
                begin
                    state<=FALL;
                end
            else if(was_fallen&ground)
                begin
                    cyc<=1;
                    state<=was_right?RIGHT:LEFT;
                end
            else
                begin
                	state<=next_state;
                    cyc<=0;
                end
        end
endmodule