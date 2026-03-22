// Behavioral replacement for tsmc_dff UDP primitive
// Purpose: UDP state regs start as X and cannot be initialized by +xminitReg+0.
//          This behavioral model adds "initial q = 0;" so all DFFs start at 0,
//          enabling correct gate-level simulation of synchronous-reset designs.
// Usage:   Compile this INSTEAD of the PDK file's tsmc_dff primitive.

module tsmc_dff (q, d, cp, cdn, sdn, notifier);
   output reg q;
   input d, cp, cdn, sdn, notifier;

   initial q = 0;

   always @(posedge cp or negedge cdn or negedge sdn) begin
      if (!cdn)       q <= 1'b0;   // async clear dominates
      else if (!sdn)  q <= 1'b1;   // async preset
      else            q <= d;      // normal latch on rising edge
   end
endmodule
