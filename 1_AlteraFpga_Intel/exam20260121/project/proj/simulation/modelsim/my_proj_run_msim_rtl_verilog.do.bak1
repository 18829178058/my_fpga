transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/exam20260121/project/src {D:/FPGALearn/exam20260121/project/src/mux_3to1.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/exam20260121/project/proj/../src {D:/FPGALearn/exam20260121/project/proj/../src/mux_3to1_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  mux_3to1_tb

add wave *
view structure
view signals
run -all
