v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 70 -50 70 -30 {lab=sample}
N 130 -50 130 -20 {lab=sample}
N 70 -50 130 -50 {lab=sample}
N 20 -50 70 -50 {lab=sample}
N 130 20 130 30 {lab=GND}
N 130 30 170 30 {lab=GND}
N 170 30 170 40 {lab=GND}
N -80 30 -80 40 {lab=GND}
N 290 -50 380 -50 {lab=hold}
N 380 30 380 40 {lab=GND}
N -80 -50 -80 -30 {lab=diff}
N -80 -50 -40 -50 {lab=diff}
N 170 -50 170 -30 {lab=#net1}
N 170 -50 230 -50 {lab=#net1}
N 480 30 480 40 {lab=GND}
N 120 -140 120 -130 {lab=GND}
N 80 -150 80 -130 {lab=GND}
N 80 -130 120 -130 {lab=GND}
N 120 -220 120 -200 {lab=tp}
N -140 -20 -120 -20 {lab=Vinp}
N -140 20 -120 20 {lab=Vinn}
N 260 -10 260 20 {lab=clk}
N 380 -50 380 -30 {lab=hold}
N 280 -10 280 20 {lab=tp}
N 480 -50 490 -50 {lab=Vout}
N 480 -50 480 -30 {lab=Vout}
N 60 -190 80 -190 {lab=Vdd}
N 280 20 290 20 {lab=tp}
N -10 -10 -10 20 {lab=tp}
N -20 20 -10 20 {lab=tp}
N 70 30 70 40 {lab=GND}
N 10 -10 10 20 {lab=clk}
N 240 20 260 20 {lab=clk}
C {vcvs.sym} -80 0 0 0 {name=E1 value=1}
C {switch_ngspice.sym} -10 -50 3 0 {name=S1 model=SW1
device_model=".MODEL SW1 SW( VT=0.9 VH=0.01 RON=0.01 ROFF=10G )"}
C {vcvs.sym} 170 0 0 0 {name=E2 value=1}
C {capa.sym} 70 0 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 170 40 0 0 {name=l1 lab=GND}
C {gnd.sym} 70 40 0 0 {name=l2 lab=GND}
C {gnd.sym} -80 40 0 0 {name=l3 lab=GND}
C {switch_ngspice.sym} 260 -50 3 0 {name=S2 model=SW1
device_model=".MODEL SW1 SW( VT=0.9 VH=0.01 RON=0.01 ROFF=10G )"}
C {capa.sym} 380 0 0 0 {name=C2
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 380 40 0 0 {name=l4 lab=GND}
C {vsource.sym} 480 0 0 0 {name=B1 value="V=\{v(hold)>0?v(Vdd):0\}" 
savecurrent=false}
C {gnd.sym} 480 40 0 0 {name=l5 lab=GND}
C {vcvs.sym} 120 -170 0 0 {name=Etp value=0.5}
C {gnd.sym} 120 -130 0 0 {name=l6 lab=GND}
C {ipin.sym} -140 -20 0 0 {name=p3 lab=Vinp}
C {ipin.sym} -140 20 0 0 {name=p4 lab=Vinn}
C {opin.sym} 490 -50 0 0 {name=p7 lab=Vout}
C {lab_wire.sym} -50 -50 0 0 {name=p12 sig_type=std_logic lab=diff}
C {lab_wire.sym} 120 -220 0 0 {name=p2 sig_type=std_logic lab=tp}
C {lab_wire.sym} 80 -50 0 1 {name=p8 sig_type=std_logic lab=sample}
C {lab_wire.sym} 290 20 0 1 {name=p6 sig_type=std_logic lab=tp}
C {lab_wire.sym} 330 -50 0 1 {name=p9 sig_type=std_logic lab=hold}
C {lab_wire.sym} -20 20 0 0 {name=p10 sig_type=std_logic lab=tp}
C {code_shown.sym} 390 -190 0 0 {name=s3 only_toplevel=false 
value="
.ic v(hold)=1 v(sample)=1
"}
C {iopin.sym} 60 -190 0 1 {name=p1 lab=Vdd}
C {iopin.sym} 10 20 0 0 {name=p11 lab=clk}
C {lab_wire.sym} 240 20 0 0 {name=p5 sig_type=std_logic lab=clk}
