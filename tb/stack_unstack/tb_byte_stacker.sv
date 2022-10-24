`timescale 1ns / 10ps

module test(

);

logic clk = 0;
logic clk_active = 1;

logic         rst_n;
logic         clr;
logic         enable;
logic         valid_in;
logic         valid_mid;
logic         valid_out;
logic         ready_out;
logic         ready_mid;
logic         ready_in;
logic [31:0]  word_in;
logic [127:0] word_128;
logic [31:0]  word_out;
logic [31:0]  test_vectors[7:0];
integer       i;
integer       j;
integer       errors;

byte_stacker i_stacker(
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

byte_unstacker i_unstacker(
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
    i = 0;

    test_vectors[0] = 32'hAAAAAAAA;
    test_vectors[1] = 32'hBBBBBBBB;
    test_vectors[2] = 32'h12345678;
    test_vectors[3] = 32'h55555555;
    test_vectors[4] = 32'hBAAAAAAA;
    test_vectors[5] = 32'hFFFFFFFF;
    test_vectors[6] = 32'hABAAAAAA;
    test_vectors[7] = 32'h00000000;

    repeat (2) @(posedge clk);
    rst_n = 1;
    @(posedge clk);

    word_in = test_vectors[i];
    i = i + 1;
    valid_in = 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);

    word_in = test_vectors[i];
    i = i + 1;
    valid_in = 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);
 
    word_in = test_vectors[i];
    i = i + 1;
    valid_in = 1;
    @(posedge clk);
    word_in = test_vectors[i];
    i = i + 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);

    word_in = test_vectors[i];
    i = i + 1;
    valid_in = 1;
    @(posedge clk);
    word_in = test_vectors[i];
    i = i + 1;
    ready_out = 0;
    @(posedge clk);
    
    valid_in = 0;
    @(posedge clk);

    word_in = test_vectors[i];
    i = i + 1;
    valid_in = 1;
    @(posedge clk);
    valid_in = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    word_in = test_vectors[i];
    i = i + 1;
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

initial begin
    j = 0;
    errors = 0;
    $display("\nStarting stack/unstack testbench\n");
    while(clk_active) begin
        @(posedge clk);
        if (valid_out & ready_out) begin
            if(word_out != test_vectors[j]) begin
                $display("ERROR @%t ns: output=%h expect=%h", $time, word_out, test_vectors[j]);
                errors = errors + 1;
            end;
            j = j + 1;
        end
    end
    $display("\nCompleted %0d out of 8 checks with %0d errors.\n", j, errors);
end

endmodule