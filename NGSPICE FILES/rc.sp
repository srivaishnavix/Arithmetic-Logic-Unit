rc circuit 

r1 1 2 1k 
*capacitor is connected 
c1 2 0 1u 
vin 1 0 pwl (0 0 10ms 0 11ms 5v 20ms 5v)
.tran 0.02ms 20ms
.control 
run 
plot v(1) v(2)
.edc
.end