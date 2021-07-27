## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK100MHZ]
 

# LEDs
set_property PACKAGE_PIN U16 [get_ports {ready_led}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led}]
set_property PACKAGE_PIN E19 [get_ports {reflex_led}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reflex_led}]
#set_property PACKAGE_PIN U19 [get_ports {ready_led[2]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[2]}]
#set_property PACKAGE_PIN V19 [get_ports {ready_led[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[3]}]
#set_property PACKAGE_PIN W18 [get_ports {ready_led[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[4]}]
#set_property PACKAGE_PIN U15 [get_ports {ready_led[5]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[5]}]
#set_property PACKAGE_PIN U14 [get_ports {ready_led[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {ready_led[7]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[7]}]
#set_property PACKAGE_PIN V13 [get_ports {ready_led[8]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[8]}]
#set_property PACKAGE_PIN V3 [get_ports {ready_led[9]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[9]}]
#set_property PACKAGE_PIN W3 [get_ports {ready_led[10]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[10]}]
#set_property PACKAGE_PIN U3 [get_ports {ready_led[11]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[11]}]
#set_property PACKAGE_PIN P3 [get_ports {ready_led[12]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[12]}]
#set_property PACKAGE_PIN N3 [get_ports {ready_led[13]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[13]}]
#set_property PACKAGE_PIN P1 [get_ports {ready_led[14]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[14]}]
#set_property PACKAGE_PIN L1 [get_ports {ready_led[15]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ready_led[15]}]
	
	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {SevenSD[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSD[0]}]
set_property PACKAGE_PIN W6 [get_ports {SevenSD[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSD[1]}]
set_property PACKAGE_PIN U8 [get_ports {SevenSD[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSD[2]}]
set_property PACKAGE_PIN V8 [get_ports {SevenSD[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSD[3]}]
set_property PACKAGE_PIN U5 [get_ports {SevenSD[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSD[4]}]
set_property PACKAGE_PIN V5 [get_ports {SevenSD[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSD[5]}]
set_property PACKAGE_PIN U7 [get_ports {SevenSD[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SevenSD[6]}]

set_property PACKAGE_PIN V7 [get_ports SevenSD[7]]							
	set_property IOSTANDARD LVCMOS33 [get_ports SevenSD[7]]

set_property PACKAGE_PIN U2 [get_ports {anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]


##Buttons
## buttonC	
set_property PACKAGE_PIN U18 [get_ports user_input]					
	set_property IOSTANDARD LVCMOS33 [get_ports user_input] 
#set_property PACKAGE_PIN T18 [get_ports btnU]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
#set_property PACKAGE_PIN W19 [get_ports btnL]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnL]]
## buttonR	
set_property PACKAGE_PIN T17 [get_ports reset] 					
	 set_property IOSTANDARD LVCMOS33 [get_ports reset] 
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
