module byte_stacker
(
  // global signals
  input  logic                                  clk_i,
  input  logic                                  rst_ni,
  input  logic                                  clr_i,
  input  logic                                  enable_i,
  input  logic                                  valid_i,
  input  logic                                  ready_i,
  input  logic [31:0]                           word_i,
  output logic                                  valid_o,
  output logic                                  ready_o,
  output logic [127:0]                          word_o
);

logic unsigned [1:0] byte_cnt_r;
logic unsigned [127:0] stack_r;
logic done_r;

assign valid_o = done_r;
assign word_o = stack_r;
assign ready_o = ready_i | ~done_r;

always_ff @(posedge clk_i or negedge rst_ni)
begin : ff
    if(~rst_ni) begin
        stack_r <= '0;
        byte_cnt_r  <= '0;
        done_r <= '0;
    end
    else if (clr_i) begin
        stack_r  <= '0;
        byte_cnt_r  <= '0;
        done_r <= '0;
    end
    else if (enable_i) begin
        stack_r <= stack_r;
        byte_cnt_r  <= byte_cnt_r;
        done_r <= done_r;

        if (valid_i & ~done_r) begin
            case(byte_cnt_r)
                0: begin
                    byte_cnt_r <= 2'd1;
                    stack_r[127:96] <= word_i;
                    done_r <= '0;
                end
                1: begin
                    byte_cnt_r <= 2'd2;
                    stack_r[95:64] <= word_i;
                    done_r <= '0;
                end
                2: begin
                    byte_cnt_r <= 2'd3;
                    stack_r[63:32] <= word_i;
                    done_r <= '0;
                end
                3: begin
                    byte_cnt_r <= 2'd0;
                    stack_r[31:0] <= word_i;
                    done_r <= '1;
                end
            endcase
        end
        else if (done_r & ready_i) begin
            done_r <= '0;
            stack_r <= '0; // simplifies debugging
        end
    end
end

endmodule // byte_stacker
