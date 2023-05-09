vlog -reportprogress 300 -work work D:/Workroom/verilog_works/mips/imem.v 
vlog -reportprogress 300 -work work D:/Workroom/verilog_works/mips/dmem.v 
vlog -reportprogress 300 -work work D:/Workroom/verilog_works/mips/mips_core.v 
vlog -reportprogress 300 -work work D:/Workroom/verilog_works/mips/mips_core_tb.v 
vsim -gui work.mips_core_tb -voptargs=+acc
