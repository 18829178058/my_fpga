onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fifo_512x8_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_512x8.udo}

run -all

quit -force
