// 3-stage inverter chain using LUT1 primitives.
// DONT_TOUCH/KEEP prevent the tools from folding the chain away.

`timescale 1ns/1ps

module inv_chain #(
    parameter STAGES = 3
) (
    input  wire din,
    output wire dout
);
    // Internal nets between stages
    wire [STAGES:0] n;
    assign n[0] = din;

    genvar i;
    generate
        for (i = 0; i < STAGES; i = i + 1) begin : G_INV
            // LUT1 with INIT=2'b01 implements NOT(I0)
            (* KEEP = "TRUE", DONT_TOUCH = "TRUE" *)
            LUT1 #(.INIT(2'b01)) u_inv (
                .I0(n[i]),
                .O (n[i+1])
            );
        end
    endgenerate

    assign dout = n[STAGES];
endmodule
