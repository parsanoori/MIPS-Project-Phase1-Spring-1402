`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module mips_core_tb;

	reg clk;
	reg rst;
	integer i;
	wire [5:0]  ia;
	wire [31:0] id;
	wire [5:0]  cma;
	wire [31:0] cmd;
	wire [31:0] mcd;
	wire        cmw;

	
	mips_core CORE (.clk(clk), .rst(rst), .iaddr(ia), .idata(id), .daddr(cma), .dwr(cmw), .ddout(cmd), .ddin(mcd));
	imem IM (.addr(ia), .dout(id));
	dmem DM (.clk(clk), .wr(cmw), .addr(cma), .din(cmd), .dout(mcd));

		initial
		begin
			rst = 1'b1;
			#30
			rst = 1'b0;
		end

		initial
		begin
			clk = 1'b0;
			for(i=0;i<10000;i=i+1)
			begin	
				#5 
				clk = 1'b1;
				#5
				clk = 1'b0;
			end
		end
endmodule