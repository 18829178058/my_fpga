transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260201seven_segment_display/src {D:/FPGALearn/Learn20260201seven_segment_display/src/seven_segment_display_dynamic.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260201seven_segment_display/proj/../src {D:/FPGALearn/Learn20260201seven_segment_display/proj/../src/seven_segment_display_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  seven_segment_display_tb

add wave *
view structure
view signals
run -all
