transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/src {C:/Users/dell/Desktop/ZX/3.5/dds/src/key_filter.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/src {C:/Users/dell/Desktop/ZX/3.5/dds/src/dds_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/src {C:/Users/dell/Desktop/ZX/3.5/dds/src/adjust_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/ip {C:/Users/dell/Desktop/ZX/3.5/dds/ip/dds_rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/src {C:/Users/dell/Desktop/ZX/3.5/dds/src/f_word_cal.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/src {C:/Users/dell/Desktop/ZX/3.5/dds/src/addr_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/src {C:/Users/dell/Desktop/ZX/3.5/dds/src/dds_ctrl.v}

vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.5/dds/prj/../sim {C:/Users/dell/Desktop/ZX/3.5/dds/prj/../sim/dds_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  dds_tb

add wave *
view structure
view signals
run -all
