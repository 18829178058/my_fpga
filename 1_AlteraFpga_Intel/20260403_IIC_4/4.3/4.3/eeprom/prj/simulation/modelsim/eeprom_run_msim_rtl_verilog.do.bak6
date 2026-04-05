transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/src {C:/Users/dell/Desktop/4.2/eeprom/src/uart_tx.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/src {C:/Users/dell/Desktop/4.2/eeprom/src/uart_rx.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/src {C:/Users/dell/Desktop/4.2/eeprom/src/iic.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/src {C:/Users/dell/Desktop/4.2/eeprom/src/top.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/src {C:/Users/dell/Desktop/4.2/eeprom/src/fifo_wr.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/ip {C:/Users/dell/Desktop/4.2/eeprom/ip/rfifo.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/src {C:/Users/dell/Desktop/4.2/eeprom/src/fifo_rd.v}

vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/prj/../sim {C:/Users/dell/Desktop/4.2/eeprom/prj/../sim/top_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/4.2/eeprom/prj/../sim {C:/Users/dell/Desktop/4.2/eeprom/prj/../sim/M24LC64.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  top_tb

add wave *
view structure
view signals
run -all
