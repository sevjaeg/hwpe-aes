/* 
 * Word Unstacker
 * 
 * Converts 128 bit data into four 32 bit words (sequentially)
 */

module byte_unstacker
(
  input  logic           clk_i,
  input  logic           rst_ni,
  input  logic           clr_i,
  input  logic           enable_i,
  input  logic           valid_i,
  input  logic           ready_i,
  input  logic [127:0]   word_i,
  output logic           valid_o,
  output logic           ready_o,
  output logic [31:0]    word_o
);

  logic                ready;
  logic unsigned [2:0] next_cnt;

  logic unsigned   [1:0] cnt_r;
  logic unsigned [127:0] stack_r;
  logic                  filled_r;

  assign ready = enable_i & ~(filled_r);

  always_ff @(posedge clk_i or negedge rst_ni)
  begin : ff
    if(~rst_ni) begin
      stack_r <= '0;
      cnt_r  <= '0;
      filled_r <= 1'b0;
    end else if (clr_i) begin
      stack_r  <= '0;
      cnt_r  <= '0;
      filled_r <= 1'b0;
    end else if (enable_i) begin
      stack_r <= stack_r;
      filled_r <= filled_r;

      // accept new data
      if (valid_i & ready) begin
        stack_r <= word_i;
        filled_r <= 1'b1;
      end

      // next word when handshake at the output
      if (filled_r & ready_i) begin
        if (next_cnt == 4) begin
          filled_r <= 1'b0;
          cnt_r <= '0;
        end else begin
          cnt_r <= next_cnt[1:0];
        end
      end else begin
        cnt_r <= cnt_r;
      end       
    end
  end

  always_comb
  begin : update_cnt
    next_cnt <= cnt_r + 1;
  end

  always_comb
  begin : set_output
    if (filled_r) begin
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
      endcase
    end else begin
      word_o <= 32'b0;
    end
  end

  assign valid_o = enable_i & filled_r;
  assign ready_o = ready;

endmodule // byte_unstacker
