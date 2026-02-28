v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -300 -70 -300 -60 {lab=GND}
N -300 -140 -300 -130 {lab=VDD}
N -170 50 -170 70 {lab=GND}
N -110 70 -110 90 {lab=GND}
N -170 -10 -70 -10 {lab=S}
N -110 10 -70 10 {lab=R}
N 90 -10 120 -10 {lab=Q}
C {sr_latch.sym} 10 0 0 0 {name=x1}
C {vsource.sym} -300 -100 0 0 {name=VDD value=\{Vdd\} savecurrent=false}
C {vdd.sym} -300 -140 0 0 {name=l5 lab=VDD}
C {gnd.sym} -300 -60 0 0 {name=l6 lab=GND}
C {vsource.sym} -170 20 0 1 {name=VS value="PULSE(0 3 100n 1n 1n 200n 800n)" savecurrent=false}
C {gnd.sym} -170 70 0 0 {name=l1 lab=GND}
C {vsource.sym} -110 40 0 0 {name=VR value="PULSE(0 3 500n 1n 1n 200n 800n)" savecurrent=false}
C {gnd.sym} -110 90 0 1 {name=l2 lab=GND}
C {code_shown.sym} 170 -200 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
"}
C {code_shown.sym} 160 -100 0 0 {name=NGSPICE only_toplevel=true 
value="
.option temp=27
.control
option sparse
save all
tran 1n 2000n uic
write sr_latch_tb.raw
plot v(S) v(R) v(Q)
.endc
"}
C {devices/code_shown.sym} 160 110 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {lab_wire.sym} 120 -10 0 0 {name=p3 sig_type=std_logic lab=Q}
C {lab_wire.sym} -130 -10 0 0 {name=p1 sig_type=std_logic lab=S}
C {lab_wire.sym} -80 10 0 0 {name=p2 sig_type=std_logic lab=R}
