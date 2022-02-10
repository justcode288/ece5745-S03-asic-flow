//========================================================================
// RegIncrVRTL
//========================================================================
// This is a simple example of a module for a registered incrementer
// which combines a positive edge triggered register with a combinational
// +1 incrementer. We use flat register-transfer-level modeling.

`ifndef REG_INCR_V
`define REG_INCR_V

module RegIncrVRTL
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in_,
  output logic [7:0] out
);

  // Sequential logic

  logic [7:0] reg_out;

  always @( posedge clk ) begin
    if ( reset )
      reg_out <= 0;
    else
      reg_out <= in_;
  end

  // Combinational logic

  logic [7:0] temp_wire;

  always @(*) begin
    temp_wire = reg_out + 1;
  end

  assign out = temp_wire;

endmodule

`endif /* REG_INCR_V */
