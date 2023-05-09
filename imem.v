`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module imem (addr, dout);
	input  [5:0] addr;
	output [31:0] dout; 
  reg [31:0] rb [0:63]; // 64 rows of 32-bits

	initial
			$readmemb("opcodes.bin", rb);

	assign dout = rb[addr];
endmodule