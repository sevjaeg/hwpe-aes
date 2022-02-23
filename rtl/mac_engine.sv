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
  logic signed [127:0] r_a;
  logic               r_a_valid;
  logic               r_a_ready;

  // r_a stores a_i
  always_ff @(posedge clk_i or negedge rst_ni)
  begin : mult_pipe_data
    if(~rst_ni) begin
      r_a <= '0;
    end
    else if (ctrl_i.clear) begin
      r_a <= '0;
    end
    else if (ctrl_i.enable) begin
      // r_a value is updated if there is a valid handshake at its input
      if (a_i.valid & a_i.ready) begin
        r_a <= $signed(a_i.data);
      end
    end
  end

  // r_a is valid following a valid handshake
  always_ff @(posedge clk_i or negedge rst_ni)
  begin : mult_pipe_valid
    if(~rst_ni) begin
      r_a_valid <= '0;
    end
    else if (ctrl_i.clear) begin
      r_a_valid <= '0;
    end
    else if (ctrl_i.enable) begin
      // r_a_valid is re-evaluated after a valid handshake or in transition to 1
      if ((a_i.valid) | (r_a_valid & r_a_ready)) begin
        r_a_valid <= a_i.valid;
      end
    end
  end

  always_comb
  begin
    d_o.data  = $signed(r_a);
    d_o.valid = ctrl_i.enable & r_a_valid;
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
      if ((ctrl_i.start == 1'b1) || ((r_cnt > 0) && (r_cnt < ctrl_i.len) && (r_a_valid & r_a_ready == 1'b1))) begin
        r_cnt <= cnt;
      end
    end
  end

  assign flags_o.cnt = r_cnt;
  assign flags_o.acc_valid = r_a_valid;

  // accumulator accepts new value from multiplier when
  //   1) output is ready or r_a is invalid (if in simple multiplication mode)
  //   2) r_acc is ready or r_a is invalid (if in scalar product mode)
  assign r_a_ready = d_o.ready  | ~r_a_valid;

  // multiplier accepts new value from a_i/b_i when r_a is ready and both a_i/b_i are valid, or when both a_i/b_i are invalid
  assign a_i.ready = (r_a_ready & a_i.valid & b_i.valid) | (~a_i.valid & ~b_i.valid);
  assign b_i.ready = (r_a_ready & a_i.valid & b_i.valid) | (~a_i.valid & ~b_i.valid);

endmodule // mac_engine
