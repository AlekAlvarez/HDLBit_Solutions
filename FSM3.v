module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @(*)
        begin
            case(state)
                A:
                    begin
                        if(in==1)
                            next_state=B;
                        else
                            next_state=A;
                    end
                B:
                    begin
                        if(in==1)
                            next_state=B;
                        else
                            next_state=C;
                    end
                C:
                    begin
                        if(in==0)
                            next_state=A;
                        else
                            next_state=D;
                    end
                default:
                    begin
                        if(in==0)
                            next_state=C;
                        else
                            next_state=B;
                    end
            endcase
        end
		assign out = state==D;

endmodule
