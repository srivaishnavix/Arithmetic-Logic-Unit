* Include the 4_BIT_AND subcircuit
.include 4bitAnding.sub

* Define stimulus inputs and output nodes
VDD vdd 0 5V
GND gnd 0 0V

* Create 4-bit input vectors
Vinput[3] a0 0 PULSE(0 5 0 1n 1n 10n 20n)
Vinput[2] a1 0 PULSE(0 5 0 2n 2n 10n 40n)
Vinput[1] a2 0 PULSE(0 5 0 4n 4n 10n 80n)
Vinput[0] a3 0 PULSE(0 5 0 8n 8n 10n 160n)

* Connect the inputs to the 4-bit AND gate
X4BIT_AND a0 a1 a2 a3 out vdd gnd

* Simulate for a specific time
.tran 0ns 200ns

* Plot the input and output waveforms
.plot tran V(a0) V(a1) V(a2) V(a3) V(out)

* Save the simulation results to a file
.control
run
wrdata test_result.dat V(a0) V(a1) V(a2) V(a3) V(out)
.quit
.endc
