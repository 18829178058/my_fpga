transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260204/sale_auto_1/src {D:/FPGALearn/Learn20260204/sale_auto_1/src/sale_auto_1.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260204/sale_auto_1/proj/../src {D:/FPGALearn/Learn20260204/sale_auto_1/proj/../src/sale_auto_1_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  sale_auto_1_tb

add wave *
view structure
view signals
run -all
