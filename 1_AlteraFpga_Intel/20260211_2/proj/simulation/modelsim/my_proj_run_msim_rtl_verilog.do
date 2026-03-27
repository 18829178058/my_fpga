transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/20260211_2/src {D:/FPGALearn/20260211_2/src/question_13.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/20260211_2/proj/../src {D:/FPGALearn/20260211_2/proj/../src/question_13_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  question_13_tb

add wave *
view structure
view signals
run -all
