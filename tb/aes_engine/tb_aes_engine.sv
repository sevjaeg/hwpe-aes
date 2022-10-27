`timescale 1ns / 1ps

import mac_package::*;

module test(

);

logic         clk = 0;
logic         clk_active = 1;

logic         rst_n = 0;
logic         clr = 0;
logic         enable = 1;

logic         valid_key_in;
logic         valid_word_in;
logic         valid_out;
logic         ready_out;
logic         ready_key_in;
logic         ready_word_in;
logic [31:0]  word_in = '0;
logic [31:0]  key_in = '0;
logic [31:0]  word_out;

logic [31:0]  test_vector_key [ 3:0];
logic [31:0]  test_vector_word[15:0];
logic [31:0]  test_vector_out [15:0];
integer       i;
integer       j;
integer       k;
integer       errors;

hwpe_stream_intf_stream #(
    .DATA_WIDTH(32)
) a (
    .clk ( clk_i )
);
hwpe_stream_intf_stream #(
    .DATA_WIDTH(32)
) b (
    .clk ( clk_i )
);
hwpe_stream_intf_stream #(
    .DATA_WIDTH(32)
) d (
    .clk ( clk_i )
);

assign a.valid = valid_word_in;
assign ready_word_in = a.ready;
assign a.data  = word_in;
assign a.strb  = '1;

assign b.valid = valid_key_in;
assign ready_key_in = b.ready;
assign b.data  = key_in;
assign b.strb  = '1;

assign valid_out = d.valid;
assign d.ready = ready_out;
assign word_out = d.data;

ctrl_engine_t  ctrl;
flags_engine_t flags;

assign ctrl.clear = clr;
assign ctrl.enable = enable;

mac_engine dut(
    .clk_i (clk),
    .rst_ni (rst_n),
    .a_i (a),
    .b_i (b),
    .d_o (d),
    .ctrl_i (ctrl),
    .flags_o (flags)
);

initial begin
    test_vector_key[0] = 32'h2b7e1516;
    test_vector_key[1] = 32'h28aed2a6;
    test_vector_key[2] = 32'habf71588;
    test_vector_key[3] = 32'h09cf4f3c;

    test_vector_word[0] = 32'h6bc1bee2;
    test_vector_word[1] = 32'h2e409f96;
    test_vector_word[2] = 32'he93d7e11;
    test_vector_word[3] = 32'h7393172a;
    test_vector_word[4] = 32'hae2d8a57;
    test_vector_word[5] = 32'h1e03ac9c;
    test_vector_word[6] = 32'h9eb76fac;
    test_vector_word[7] = 32'h45af8e51;
    test_vector_word[8] = 32'h30c81c46;
    test_vector_word[9] = 32'ha35ce411;
    test_vector_word[10] = 32'he5fbc119;
    test_vector_word[11] = 32'h1a0a52ef;
    test_vector_word[12] = 32'hf69f2445;
    test_vector_word[13] = 32'hdf4f9b17;
    test_vector_word[14] = 32'had2b417b;
    test_vector_word[15] = 32'he66c3710;

    test_vector_out[0] = 32'h7649abac;
    test_vector_out[1] = 32'h8119b246;
    test_vector_out[2] = 32'hcee98e9b;
    test_vector_out[3] = 32'h12e9197d;
    test_vector_out[4] = 32'h5086cb9b;
    test_vector_out[5] = 32'h507219ee;
    test_vector_out[6] = 32'h95db113a;
    test_vector_out[7] = 32'h917678b2;
    test_vector_out[8] = 32'h73bed6b8;
    test_vector_out[9] = 32'he3c1743b;
    test_vector_out[10] = 32'h7116e69e;
    test_vector_out[11] = 32'h22229516;
    test_vector_out[12] = 32'h3ff1caa1;
    test_vector_out[13] = 32'h681fac09;
    test_vector_out[14] = 32'h120eca30;
    test_vector_out[15] = 32'h7586e1a7;
    
    valid_word_in = 0;
    valid_key_in = 0;
    ready_out = 0;
    word_in = '0;

    repeat (2) @(posedge clk);
    @(negedge clk);
    rst_n = '1;
    repeat (2) @(posedge clk);

    for (i=0; i<16; i=i+1) begin
        word_in = test_vector_word[i];
        key_in = test_vector_key[i%4];
        #0;
        valid_word_in = 1;
        @(posedge clk);
        valid_key_in = 1;
        if(ready_word_in) begin
            valid_word_in = 0;
        end
        do begin
            @(posedge clk);
            if(ready_key_in) begin
                valid_key_in = 0;
            end
            #0;
        end while(!ready_word_in | !ready_key_in);
    end

    repeat (50) @(posedge clk);
    clk_active = 0;
    $display("\nCompleted %0d out of 16 checks with %0d errors.\n", j, errors);
end

initial begin
    while(clk_active) begin
        #0.8 clk = ~clk;
    end
end

initial begin
    k = 0;
    while(clk_active) begin
        @(posedge clk);
        if ((k % 7 == 0) || (k % 12== 0)) begin
            # 0.1
            ready_out = ~ready_out;
        end
        k = k + 1;
    end
end

initial begin
    j = 0;
    errors = 0;
    $display("\nStarting AES engine testbench\n");
    while(clk_active) begin
        @(posedge clk);
        if (valid_out & ready_out) begin
            if(word_out != test_vector_out[j]) begin
                $display("ERROR @%t ns: output=%h expect=%h", $time, word_out, test_vector_out[j]);
                errors = errors + 1;
            end
            j = j + 1;
        end
    end
end
endmodule