onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib rom_256x8_1_opt

do {wave.do}

view wave
view structure
view signals

do {rom_256x8_1.udo}

run -all

quit -force
