// D5FF, C5FF, B5FF, A5FF == W5FF
// Flip-flop which can be configured only as a flip flop.
module {W}5FF(D, CE, CK, Q, SR);
	input  wire D;
	output wire Q;

	// When SR is high:
	//  * Force internal value to 1 -- SRHIGH
	//  * Force internal value to 0 -- SRLOW  (default)
	parameter SRVAL		= "SRLOW";

	// Value on Async Reset on power up
	parameter INIT 		= (SRVAL == "SRLOW") ? 1'b0 : 1'b1;

	// Shared between all flip-flops in a slice
	input wire CK; // Clock
	input wire CE; // Clock-enable - Active high
	input wire SR; // Set or Reset - Active high

	// Reset type, can be;
	// * None  -- Ignore SR
	// * Sync  -- Reset occurs on clock edge
	// * Async -- Reset occurs when ever
	parameter SRTYPE 	= "SYNC";

	always @(posedge CK) if (SR == 1'b1) Q <= 1'b1; else if (CE) Q <= D;
endmodule
