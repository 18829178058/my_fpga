transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/zxope/Desktop/exam00/prj04/src {C:/Users/zxope/Desktop/exam00/prj04/src/sub.v}

vlog -vlog01compat -work work +incdir+C:/Users/zxope/Desktop/exam00/prj04/prj/../src {C:/Users/zxope/Desktop/exam00/prj04/prj/../src/sub_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  sub_tb

add wave *
view structure
view signals
run -all
