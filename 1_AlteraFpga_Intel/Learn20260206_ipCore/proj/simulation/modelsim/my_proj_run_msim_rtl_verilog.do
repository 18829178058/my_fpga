transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260206_ipCore/src {D:/FPGALearn/Learn20260206_ipCore/src/ipCore.v}
vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260206_ipCore/ip {D:/FPGALearn/Learn20260206_ipCore/ip/pll.v}
vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260206_ipCore/proj/db {D:/FPGALearn/Learn20260206_ipCore/proj/db/pll_altpll.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/Learn20260206_ipCore/proj/../src {D:/FPGALearn/Learn20260206_ipCore/proj/../src/ipCore_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  ipCore_tb

add wave *
view structure
view signals
run -all
