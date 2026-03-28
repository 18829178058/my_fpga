transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.28/lcdphoto/src {C:/Users/dell/Desktop/ZX/3.28/lcdphoto/src/lcd_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.28/lcdphoto/ip {C:/Users/dell/Desktop/ZX/3.28/lcdphoto/ip/lcd_pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.28/lcdphoto/src {C:/Users/dell/Desktop/ZX/3.28/lcdphoto/src/lcd_command.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.28/lcdphoto/src {C:/Users/dell/Desktop/ZX/3.28/lcdphoto/src/send_data.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.28/lcdphoto/ip {C:/Users/dell/Desktop/ZX/3.28/lcdphoto/ip/lcd_rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.28/lcdphoto/prj/db {C:/Users/dell/Desktop/ZX/3.28/lcdphoto/prj/db/lcd_pll_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/ZX/3.28/lcdphoto/prj/../sim {C:/Users/dell/Desktop/ZX/3.28/lcdphoto/prj/../sim/lcd_top_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  lcd_top_tb

add wave *
view structure
view signals
run -all
