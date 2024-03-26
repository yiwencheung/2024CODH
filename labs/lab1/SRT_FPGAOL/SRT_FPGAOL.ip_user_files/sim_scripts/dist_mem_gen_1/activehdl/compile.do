transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/dist_mem_gen_v8_0_14
vlib activehdl/xil_defaultlib

vmap dist_mem_gen_v8_0_14 activehdl/dist_mem_gen_v8_0_14
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work dist_mem_gen_v8_0_14  -v2k5 -l dist_mem_gen_v8_0_14 -l xil_defaultlib \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib  -v2k5 -l dist_mem_gen_v8_0_14 -l xil_defaultlib \
"../../../../SRT_FPGAOL.gen/sources_1/ip/dist_mem_gen_1/sim/dist_mem_gen_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

