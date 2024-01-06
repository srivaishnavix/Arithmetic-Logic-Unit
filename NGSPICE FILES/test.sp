* Include the XOR subcircuit
.include XOR.sp

* Define the power supply
Vdd vdd 0 1.8V
Vgnd gnd 0 0V

* Define the inputs
Vin_a node_a 0 PULSE(0 1 0 1n 1n 1n 2n 4n)
Vin_b node_b 0 PULSE(0 1 0 2n 2n 2n 4n 8n)

* Connect the XOR gate
XOR node_a node_b xor_out vdd gnd XOR

* Define the output
Vout xor_out 0

* Set simulation options
.op
.tran 0.1n 20n

* Plot the results
.control
run
plot xor_out
.endc
