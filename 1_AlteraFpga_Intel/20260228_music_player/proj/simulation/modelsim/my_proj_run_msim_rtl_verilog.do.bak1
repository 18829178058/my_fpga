transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGALearn/20260228_music_player/src {D:/FPGALearn/20260228_music_player/src/music_player.v}
vlog -vlog01compat -work work +incdir+D:/FPGALearn/20260228_music_player/src {D:/FPGALearn/20260228_music_player/src/key_delate.v}

vlog -vlog01compat -work work +incdir+D:/FPGALearn/20260228_music_player/proj/../src {D:/FPGALearn/20260228_music_player/proj/../src/test_bench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  test_bench

add wave *
view structure
view signals
run -all
