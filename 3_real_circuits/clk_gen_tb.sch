v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -350 -80 -350 -70 {lab=GND}
N -350 -150 -350 -140 {lab=VDD}
N -150 30 -150 40 {lab=GND}
N -150 -30 -100 -30 {lab=clk}
N 100 -30 140 -30 {lab=phi1}
N 100 -10 140 -10 {lab=phi1_d}
N 100 10 140 10 {lab=phi2}
N 100 30 140 30 {lab=phi2_d}
C {clk_gen.sym} 50 0 0 0 {name=x1}
C {vsource.sym} -350 -110 0 0 {name=VDD value=\{Vdd\} savecurrent=false}
C {vdd.sym} -350 -150 0 0 {name=l5 lab=VDD}
C {gnd.sym} -350 -70 0 0 {name=l6 lab=GND}
C {code_shown.sym} 270 -200 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
"}
C {code_shown.sym} 260 -100 0 0 {name=NGSPICE only_toplevel=true 
value="
.option temp=27

.control
option sparse
save all
tran 1n 3000n
write clk_gen_tb.raw
plot v(clk)
plot v(phi1) v(phi2)
plot v(phi1_d) v(phi2_d)
plot v(phi1)*v(phi2)
.endc
"}
C {devices/code_shown.sym} 260 200 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {vsource.sym} -150 0 0 1 {name=VCK value="PULSE(0 3 10n 1n 1n 500n 1000n)" savecurrent=false}
C {gnd.sym} -150 40 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 140 -30 0 1 {name=p1 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 140 -10 0 1 {name=p2 sig_type=std_logic lab=phi1_d}
C {lab_wire.sym} 140 10 0 1 {name=p3 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 140 30 0 1 {name=p4 sig_type=std_logic lab=phi2_d}
C {lab_wire.sym} -120 -30 0 0 {name=p5 sig_type=std_logic lab=clk}
