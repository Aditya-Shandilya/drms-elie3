v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -150 40 -150 60 {lab=GND}
N -80 100 -80 120 {lab=GND}
N -150 -20 -60 -20 {lab=in1}
N -80 20 -80 40 {lab=in2}
N -80 20 -60 20 {lab=in2}
N 60 0 110 -0 {lab=out}
N -230 -70 -230 -60 {lab=GND}
N -230 -140 -230 -130 {lab=VDD}
C {nand_gate.sym} -10 0 0 0 {name=x1}
C {code_shown.sym} 230 -230 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
"}
C {code_shown.sym} 220 -130 0 0 {name=NGSPICE only_toplevel=true 
value="
.option temp=27
.control
option sparse
save all
op
write nand_gate_tb.raw
tran 0.1n 500n
plot v(in1) v(in2) v(out)
.endc
"}
C {devices/code_shown.sym} 220 130 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {vsource.sym} -150 10 0 1 {name=VA value="PULSE(0 3 200n 1n 1n 199n 800n)" savecurrent=false}
C {gnd.sym} -150 60 0 0 {name=l1 lab=GND}
C {vsource.sym} -80 70 0 0 {name=VB value="PULSE(0 3 200n 1n 1n 199n 800n)" savecurrent=false}
C {gnd.sym} -80 120 0 1 {name=l2 lab=GND}
C {lab_wire.sym} -100 -20 0 0 {name=p1 sig_type=std_logic lab=in1}
C {lab_wire.sym} -70 20 0 0 {name=p2 sig_type=std_logic lab=in2}
C {lab_wire.sym} 80 0 0 1 {name=p3 sig_type=std_logic lab=out}
C {vsource.sym} -230 -100 0 0 {name=VDD value=\{Vdd\} savecurrent=false}
C {vdd.sym} -230 -140 0 0 {name=l5 lab=VDD}
C {gnd.sym} -230 -60 0 0 {name=l6 lab=GND}
