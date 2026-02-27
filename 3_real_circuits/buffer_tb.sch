v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -200 80 -200 90 {lab=GND}
N -200 10 -200 20 {lab=VDD}
N -90 70 -90 90 {lab=GND}
N -90 0 -90 10 {lab=in}
N -90 0 -30 0 {lab=in}
N 50 0 100 0 {lab=out}
C {buffer.sym} 10 0 0 0 {name=x1}
C {vsource.sym} -200 50 0 0 {name=VDD value=\{Vdd\} savecurrent=false}
C {vdd.sym} -200 10 0 0 {name=l5 lab=VDD}
C {gnd.sym} -200 90 0 0 {name=l6 lab=GND}
C {code_shown.sym} 220 -200 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
"}
C {code_shown.sym} 210 -100 0 0 {name=NGSPICE only_toplevel=true 
value="
.option temp=27
.control
option sparse
save all
op
write buffer_tb.raw
tran 0.1n 400n
plot v(in) v(out)
.endc
"}
C {devices/code_shown.sym} 210 160 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {vsource.sym} -90 40 0 0 {name=VIN value="PULSE(0 3.0 10ns 1ns 1ns 100ns 200ns)" savecurrent=false}
C {gnd.sym} -90 90 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -70 0 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_wire.sym} 100 0 0 1 {name=p2 sig_type=std_logic lab=out}
