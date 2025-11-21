v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 -70 80 -50 {lab=GND}
N -0 30 -0 50 {lab=GND}
N -70 0 -70 20 {lab=#net1}
N -70 80 -70 100 {lab=GND}
N 40 0 60 0 {lab=v_out}
N -70 -0 -30 0 {lab=#net1}
N 0 -70 -0 -30 {lab=#net2}
N 60 -70 80 -70 {lab=GND}
C {vsource.sym} 30 -70 1 1 {name=vdd value=5}
C {gnd.sym} 80 -50 0 0 {name=l1 lab=GND sig_type=std_logic}
C {gnd.sym} 0 50 0 0 {name=l2 lab=GND sig_type=std_logic}
C {vsource.sym} -70 50 0 1 {name=Vin
value="
+ PULSE(0 5 0 1p 1p 500n 1u)
"}
C {gnd.sym} -70 100 0 1 {name=l3 lab=GND}
C {devices/code_shown.sym} -360 -200 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
option sparse
save all
op
tran 0.01n 20n
write inverter_test.raw
plot V(v_out)
.endc
"
}
C {opin.sym} 60 0 0 0 {name=p5 lab=v_out sig_type=std_logic}
C {ideal_inverter.sym} 0 0 0 0 {name=x1}
