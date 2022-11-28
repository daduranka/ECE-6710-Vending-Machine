###################################################################

# Created by write_sdc on Sun Nov 27 00:13:33 2022

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_area 0
create_clock [get_ports clock]  -period 1.8  -waveform {0 0.9}
