module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0] prev_state;
    always @(posedge clk)
        begin
            if(~s[1]|reset)
                begin
                    fr3<=1;
                    fr2<=1;
                    fr1<=1;
                    dfr<=1;
                    prev_state<=0;
                end
            else if(~s[2])
                begin
                    fr3<=0;
                    fr2<=1;
                    fr1<=1;
                    dfr<=prev_state==1?dfr:prev_state>1?1:0;
                    prev_state<=1;
                end
            else if(~s[3])
                begin
                    fr3<=0;
                    fr2<=0;
                    fr1<=1;
                    dfr<=prev_state==2?dfr:prev_state>2?1:0;
                    prev_state<=2;
                end
            else
                begin
                    fr3<=0;
                    fr2<=0;
                    fr1<=0;
                    dfr<=0;
                    prev_state<=3;
                end
        end
endmodule