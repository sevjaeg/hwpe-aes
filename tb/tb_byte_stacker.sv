module test(

);

logic clk = 0;
logic clk_active = 1;

logic                                  rst_n;
logic                                  clr;
logic                                  enable;
logic                                  valid_in;
logic                                  valid_mid;
logic                                  valid_out;
logic                                  ready_out;
logic                                  ready_mid;
logic                                  ready_in;
logic [31:0]                           word_in;
logic [127:0]                          word_128;
logic [31:0]                           word_out;


byte_stacker dut0(
    .clk_i (clk),
    .rst_ni (rst_n),
    .clr_i  (clr),
    .enable_i(enable),
    .valid_i (valid_in),
    .ready_i (ready_mid),
    .word_i (word_in),
    .valid_o (valid_mid),
    .ready_o (ready_in),
    .word_o (word_128)
);

byte_unstacker dut1(
    .clk_i (clk),
    .rst_ni (rst_n),
    .clr_i  (clr),
    .enable_i(enable),
    .valid_i (valid_mid),
    .ready_i (ready_out),
    .word_i (word_128),
    .valid_o (valid_out),
    .ready_o (ready_mid),
    .word_o (word_out)
);

initial begin
    rst_n = 0;
    enable = 1;
    valid_in = 0;
    ready_out = 1;
    word_in = '0;
    clr = 0;

    repeat (2) @(posedge clk);
    rst_n = 1;
    @(posedge clk);

    word_in = 32'hAAAAAAAA;
    valid_in = 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);

    word_in = 32'hBBBBBBBB;
    valid_in = 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);

    word_in = 32'h12345678;
    valid_in = 1;
    @(posedge clk);
    word_in = 32'h55555555;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);

    word_in = 32'hBAAAAAAA;
    valid_in = 1;
    @(posedge clk);
    word_in = 32'hFFFFFFFF;
    ready_out = 0;
    @(posedge clk);
    
    valid_in = 0;
    @(posedge clk);

    word_in = 32'hABAAAAAA;
    valid_in = 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    word_in = 32'hBAAAAAAA;
    valid_in = 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);
    ready_out = 1;

    repeat (25) @(posedge clk);
    clk_active = 0;
end

initial begin
    while(clk_active) begin
        #5 clk = ~clk;
    end
end

endmodule