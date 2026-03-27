transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/exam20260116/prj04_1/src {D:/FPGALearn/exam20260116/prj04_1/src/sub.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/exam20260116/prj04_1/prj/../src {D:/FPGALearn/exam20260116/prj04_1/prj/../src/sub_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  sub_tb

add wave *
view structure
view signals
run -all
