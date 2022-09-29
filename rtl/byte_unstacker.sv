module byte_unstacker
(
  // global signals
  input  logic                                  clk_i,
  input  logic                                  rst_ni,
  input  logic                                  clr_i,
  input  logic                                  enable_i,
  input  logic                                  valid_i,
  input  logic                                  ready_i,
  input  logic [127:0]                          word_i,
  output logic                                  valid_o,
  output logic                                  ready_o,
  output logic [31:0]                           word_o
);

logic unsigned [2:0] cnt_r;
logic unsigned [2:0] next_cnt;
logic signed [127:0] stack_r;
logic filled_r;

assign ready_o = (~filled_r);

always_ff @(posedge clk_i or negedge rst_ni)
begin : ff
    if(~rst_ni) begin
        stack_r <= '0;
        cnt_r  <= '0;
        filled_r <= '0;
    end
    else if (clr_i) begin
        stack_r  <= '0;
        cnt_r  <= '0;
        filled_r <= '0;
    end
    else if (enable_i) begin
        if (valid_i & ~filled_r) begin
            stack_r <= word_i;
            filled_r <= '1;
        end

        if (next_cnt == 4) begin
            filled_r <= '0;
            cnt_r <= '0;
        end else begin
            cnt_r <= next_cnt;
        end
    end
end

always_comb
begin
    if (filled_r & ready_i) begin
        case(cnt_r)
            0: begin
                word_o <= stack_r[127:96];
            end
            1: begin
                word_o <= stack_r[95:64];
            end
            2: begin
                word_o <= stack_r[63:32];
            end
            3: begin
                word_o <= stack_r[31:0];
            end
            default: begin
                word_o <= 32'b0;
            end
        endcase
        next_cnt <= cnt_r + $unsigned('1);
    end else begin
        next_cnt <= cnt_r;
        word_o <= 32'b0;
    end
end

assign valid_o = filled_r & ready_i;

endmodule // byte_unstacker
