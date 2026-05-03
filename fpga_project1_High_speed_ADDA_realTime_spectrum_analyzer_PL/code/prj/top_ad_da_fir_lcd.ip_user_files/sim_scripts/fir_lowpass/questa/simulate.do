onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fir_lowpass_opt

do {wave.do}

view wave
view structure
view signals

do {fir_lowpass.udo}

run -all

quit -force
