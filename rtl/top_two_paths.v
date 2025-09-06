// Top-level: clock divider creates a stimulus; two 3-stage inverter chains in parallel.
// Route out both chains to pins; optional XOR for on-board skew visualization.

`timescale 1ns/1ps

module top_two_paths (
    input  wire sys_clk,    // map to on-board system clock (from Master XDC)
    output wire OUT_A,      // to scope CH1
    output wire OUT_B,      // to scope CH2
    output wire OUT_XOR     // optional: XOR(OUT_A, OUT_B) -> scope CH3
);

    reg [7:0] div = 8'd0;
    always @(posedge sys_clk) begin
        div <= div + 1'b1;
    end
    wire stim = div[0];   // ~sys_clk/2; choose another bit for lower freq if needed
    wire a_out, b_out;


    (* KEEP_HIERARCHY = "YES" *)
    inv_chain #(.STAGES(3)) u_chain_a (
        .din (stim),
        .dout(a_out)
    );

    (* KEEP_HIERARCHY = "YES" *)
    inv_chain #(.STAGES(3)) u_chain_b (
        .din (stim),
        .dout(b_out)
    );

    // Optional: XOR pulse ~ proportional to edge-to-edge skew
    assign OUT_XOR = a_out ^ b_out;
    assign OUT_A = a_out;
    assign OUT_B = b_out;

endmodule
