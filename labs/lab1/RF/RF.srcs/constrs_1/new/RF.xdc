set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
create_clock -add -name sys_clk -period 10.00 -waveform { 0 5 } [get_ports { clk }]; 
