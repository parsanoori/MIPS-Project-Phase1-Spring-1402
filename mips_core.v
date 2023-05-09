`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module mips_core (clk, rst, iaddr, idata, daddr, dwr, ddout, ddin);
	input  clk;
	input  rst;
	output [5:0]  iaddr;
	input  [31:0] idata;
	output [5:0]  daddr;
	output [31:0] ddout;
	input  [31:0] ddin;
	output        dwr;
	
	
	//Registers
	reg  [31:0] FPC;
	reg  [31:0] DPC;
	wire [31:0] FIR;
	reg  [31:0] DIR;
	
	// Pipeline registers
	always @(posedge clk, posedge rst)
	begin
    if(rst) 
		begin
			FPC = 0;
    end
    else 
		begin
			// Pipeline latches
			DPC = FPC;
			DIR = FIR;
			//x_alu_func = d_alu_func
			// Program counter
			FPC = FPC + 1;
		end
	end

	// Fetch
	assign iaddr = FPC[5:0];
	assign FIR = idata;
	
	// decode
/*	always @(DIR)
	begin
		if (DIR[31:26] = 6'b000000)
		begin
			d_alu_func = 3'b000;
		end
	end
*/
endmodule 