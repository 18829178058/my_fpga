transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260125/project/src {D:/FPGALearn/Learn20260125/project/src/decode_3to8.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260125/project/proj/../src {D:/FPGALearn/Learn20260125/project/proj/../src/decode_3to8_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  decode_3to8_tb

add wave *
view structure
view signals
run -all
