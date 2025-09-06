// 3-stage inverter chain using LUT1s (kept intact by synthesis)
`timescale 1ns/1ps
module inv_chain #(parameter STAGES = 3)(
  input  wire din,
  output wire dout
);
  wire [STAGES:0] n;
  assign n[0] = din;

  genvar i;
  generate
    for (i = 0; i < STAGES; i = i + 1) begin : G_INV
      (* KEEP = "TRUE", DONT_TOUCH = "TRUE" *)
      LUT1 #(.INIT(2'b01)) u_inv ( .I0(n[i]), .O(n[i+1]) );
    end
  endgenerate

  assign dout = n[STAGES];
endmodule
