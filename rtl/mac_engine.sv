/*
 * mac_engine.sv
 * Francesco Conti <fconti@iis.ee.ethz.ch>
 *
 * Copyright (C) 2018 ETH Zurich, University of Bologna
 * Copyright and related rights are licensed under the Solderpad Hardware
 * License, Version 0.51 (the "License"); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
 * or agreed to in writing, software, hardware and materials distributed under
 * this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 *
 */

import mac_package::*;

module mac_engine
(
  // global signals
  input  logic                   clk_i,
  input  logic                   rst_ni,
  // input a stream
  hwpe_stream_intf_stream.sink   a_i,
  // input b stream
  hwpe_stream_intf_stream.sink   b_i,
  // output d stream
  hwpe_stream_intf_stream.source d_o,
  // control channel
  input  ctrl_engine_t           ctrl_i,
  output flags_engine_t          flags_o
);

  logic unsigned [$clog2(MAC_CNT_LEN):0] cnt;
  logic unsigned [$clog2(MAC_CNT_LEN):0] r_cnt;
  logic signed [127:0] word;
  logic signed [127:0] key;
  logic signed [127:0] aes_out;
  logic signed [31:0]  out_word;
  logic               word_valid;
  logic               word_ready;
  logic               key_valid;
  logic               key_ready;
  logic               aes_valid;
  logic               aes_ready;
  logic               aes_start;
  logic               aes_busy;
  logic               out_valid;
  logic               out_ready;

  aes_cipher_top i_aes(
    .clk (clk_i),
    .rst (rst_ni),
    .ld  (aes_start),
    .done(aes_valid),
    .key (key),
    .text_in (word),
    .text_out (aes_out)
  );

  byte_stacker stack_word(
    .clk_i (clk_i),
    .rst_ni (rst_ni),
    .clr_i  (ctrl_i.clear),
    .enable_i(ctrl_i.enable),
    .valid_i (a_i.valid),
    .ready_i (word_ready),
    .word_i ($signed(a_i.data)),
    .valid_o (word_valid),
    .ready_o (a_i.ready),
    .word_o (word)
  );

  byte_stacker stack_key(
    .clk_i (clk_i),
    .rst_ni (rst_ni),
    .clr_i  (ctrl_i.clear),
    .enable_i(ctrl_i.enable),
    .valid_i (b_i.valid),
    .ready_i (key_ready),
    .word_i ($signed(b_i.data)),
    .valid_o (key_valid),
    .ready_o (b_i.ready),
    .word_o (key)
  );

  byte_unstacker unstack(
    .clk_i (clk_i),
    .rst_ni (rst_ni),
    .clr_i  (ctrl_i.clear),
    .enable_i(ctrl_i.enable),
    .valid_i (aes_valid),
    .ready_i (out_ready),
    .word_i (aes_out),
    .valid_o (out_valid),
    .ready_o (aes_ready),
    .word_o (out_word)
  );

  assign out_ready = d_o.ready;
  assign aes_start = word_valid & word_ready & key_valid & key_ready;

  always_ff @(posedge clk_i or negedge rst_ni)
  begin : proc_aes_busy
    if(~rst_ni) begin
      aes_busy <= '0;
    end
    else if (ctrl_i.clear) begin
      aes_busy <= '0;
    end
    else if (ctrl_i.enable) begin
      // word_valid is re-evaluated after a valid handshake or in transition to 1
      if (aes_start) begin
        aes_busy <= '1;
      end
      if (aes_valid) begin
        aes_busy <= '0;
      end
    end
  end

  always_comb
  begin
    d_o.data  = $signed(out_word);
    d_o.valid = ctrl_i.enable & out_valid;
    d_o.strb  = '1; // for now, strb is always '1
  end

  // The control counter is implemented directly inside this module; as the control is
  // minimal, it was not deemed convenient to move it to another submodule. For bigger
  // FSMs that is typically the most advantageous choice.

  always_comb
  begin
    cnt = r_cnt + 1;
  end

  always_ff @(posedge clk_i or negedge rst_ni)
  begin
    if(~rst_ni) begin
      r_cnt <= '0;
    end
    else if(ctrl_i.clear) begin
      r_cnt <= '0;
    end
    else if(ctrl_i.enable) begin
      if ((ctrl_i.start == 1'b1) || ((r_cnt > 0) && (r_cnt < ctrl_i.len) && (d_o.valid & d_o.ready == 1'b1))) begin
        r_cnt <= cnt;
      end
    end
  end

  assign flags_o.cnt = r_cnt;
  assign flags_o.acc_valid = out_valid;

  // Ready signals have to be propagated backwards through pipeline stages (combinationally).
  // To avoid deadlocks, the following rules have to be followed:
  //  1) transition of ready CAN depend on the current state of valid
  //  2) transition of valid CANNOT depend on the current state of ready
  //  3) transition 1->0 of valid MUST depend on (previous) ready (i.e., once the valid goes
  //     to 1 it cannot go back to 0 until there is a valid handshake)
  // In the following:
  // R_valid & R_ready denominate the handshake at the *output* (Q port) of pipe register R

  assign word_ready = !aes_busy & word_valid & key_valid;
  assign key_ready = !aes_busy & word_valid & key_valid;
  
endmodule // mac_engine
