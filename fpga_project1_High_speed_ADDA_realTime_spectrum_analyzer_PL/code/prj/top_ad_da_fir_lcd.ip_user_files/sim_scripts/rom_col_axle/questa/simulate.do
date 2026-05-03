onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib rom_col_axle_opt

do {wave.do}

view wave
view structure
view signals

do {rom_col_axle.udo}

run -all

quit -force
