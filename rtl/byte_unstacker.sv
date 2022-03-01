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

logic unsigned [1:0] byte_cnt_r;
logic signed [127:0] stack_r;
logic signed [31:0] buffer_r;
logic busy_r;
logic buffer_free_r;

assign ready_o = (~busy_r) & buffer_free_r;

always_ff @(posedge clk_i or negedge rst_ni)
begin : ff
    if(~rst_ni) begin
        stack_r <= '0;
        byte_cnt_r  <= '0;
        busy_r <= '0;
        buffer_r <= '0;
        valid_o <= 0;
        buffer_free_r <= 1;
    end
    else if (clr_i) begin
        stack_r  <= '0;
        byte_cnt_r  <= '0;
        busy_r <= '0;
        buffer_r <= '0;
        valid_o <= 0;
        buffer_free_r <= 1;
    end
    else if (enable_i) begin
        valid_o <= 0;
        word_o <= 0;
        if (valid_i & ~busy_r & buffer_free_r) begin
            stack_r <= word_i;
            busy_r <= 1;
            buffer_r <= '0;
        end else if (busy_r & buffer_free_r) begin
            case(byte_cnt_r)
                0: begin
                    buffer_r <= stack_r[127:96]; 
                    busy_r <= 1;
                    byte_cnt_r <= 1; 
                    buffer_free_r <= 0;          
                end
                1: begin
                    buffer_r <= stack_r[95:64];  
                    busy_r <= 1;
                    byte_cnt_r <= 2;
                    buffer_free_r <= 0;
                end
                2: begin
                    buffer_r <= stack_r[63:32]; 
                    busy_r <= 1;
                    byte_cnt_r <= 3;
                    buffer_free_r <= 0;
                end
                3: begin
                    buffer_r <= stack_r[31:0];
                    busy_r <= 0;
                    byte_cnt_r <= 0;
                    buffer_free_r <= 0;
                end
            endcase
        end
        else if (~buffer_free_r & ready_i) begin
            word_o <= buffer_r;
            valid_o <= 1;
            buffer_free_r <= 1;
        end
    end
end

endmodule // byte_unstacker
