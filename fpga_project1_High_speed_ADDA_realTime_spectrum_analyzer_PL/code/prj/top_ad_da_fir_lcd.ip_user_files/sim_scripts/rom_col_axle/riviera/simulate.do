onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+rom_col_axle -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.rom_col_axle xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {rom_col_axle.udo}

run -all

endsim

quit -force
