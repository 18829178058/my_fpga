transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {d:/intelfpga_lite/18.0/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {d:/intelfpga_lite/18.0/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {d:/intelfpga_lite/18.0/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {d:/intelfpga_lite/18.0/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {d:/intelfpga_lite/18.0/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {d:/intelfpga_lite/18.0/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src {D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src/fifo_rd.v}
vlog -vlog01compat -work work +incdir+D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src {D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src/uart_tx.v}
vlog -vlog01compat -work work +incdir+D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src {D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src/top.v}
vlog -vlog01compat -work work +incdir+D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src {D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src/spi_master_m25p16_interface.v}
vlog -vlog01compat -work work +incdir+D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src {D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/src/id_m25p16_read.v}
vlog -vlog01compat -work work +incdir+D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/ip {D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/ip/rfifo.v}

vlog -vlog01compat -work work +incdir+D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/proj/../src {D:/GitHub/my_fpga/1_AlteraFpga_Intel/20260408_SPI_laoshi/proj/../src/spi_master_m25p16_interface_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  spi_master_m25p16_interface_tb

add wave *
view structure
view signals
run -all
