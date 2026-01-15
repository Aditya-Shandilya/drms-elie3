v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 -280 50 -260 50 {}
L 4 -260 -30 -260 130 {}
L 4 510 50 530 50 {}
L 4 530 -30 530 130 {}
B 5 -262.5 47.5 -257.5 52.5 {name=vout dir=out}
B 5 527.5 47.5 532.5 52.5 {name=vout dir=out}
N -480 50 -480 70 {lab=#net1}
N -260 30 -260 50 {lab=#net2}
N -260 50 -260 70 {lab=#net2}
N -260 -90 -260 -30 {lab=diff}
N -100 -90 -60 -90 {lab=diff}
N -100 -170 40 -170 {lab=diff}
N -100 -170 -100 -90 {lab=diff}
N -260 -90 -100 -90 {lab=diff}
N 160 -60 310 -60 {lab=Vint1}
N 100 -170 160 -170 {lab=Vint1}
N 160 -170 160 -60 {lab=Vint1}
N 120 -60 160 -60 {lab=Vint1}
N 310 210 820 210 {lab=Vfb}
N -480 130 -480 210 {lab=Vfb}
N -510 -60 -480 -60 {lab=Vin}
N -480 -60 -480 -30 {lab=Vin}
N -130 -30 -60 -30 {lab=Vcm}
N -260 130 -260 160 {lab=Vcm}
N -280 160 -260 160 {lab=Vcm}
N -540 0 -520 0 {lab=phi1}
N -540 20 -520 20 {lab=trip}
N -540 100 -520 100 {lab=phi2}
N -540 120 -520 120 {lab=trip}
N -480 50 -400 50 {lab=#net1}
N -480 30 -480 50 {lab=#net1}
N -340 50 -260 50 {lab=#net2}
N -310 20 -300 20 {lab=trip}
N -310 0 -300 0 {lab=phi2}
N -310 100 -300 100 {lab=phi1}
N -310 120 -300 120 {lab=trip}
N -540 90 -540 100 {lab=phi2}
N -540 -10 -540 0 {lab=phi1}
N -310 -10 -310 0 {lab=phi2}
N -310 90 -310 100 {lab=phi1}
N 310 50 310 70 {lab=#net3}
N 530 30 530 50 {lab=#net4}
N 530 50 530 70 {lab=#net4}
N 530 -90 530 -30 {lab=diff}
N 690 -90 730 -90 {lab=diff}
N 690 -170 830 -170 {lab=diff}
N 690 -170 690 -90 {lab=diff}
N 530 -90 690 -90 {lab=diff}
N 950 -60 1030 -60 {lab=Vint2}
N 890 -170 950 -170 {lab=Vint2}
N 950 -170 950 -60 {lab=Vint2}
N 910 -60 950 -60 {lab=Vint2}
N 310 -60 310 -30 {lab=Vint1}
N 660 -30 730 -30 {lab=Vcm}
N 530 130 530 160 {lab=Vcm}
N 250 20 270 20 {lab=trip}
N 250 100 270 100 {lab=phi1}
N 250 120 270 120 {lab=trip}
N 310 50 390 50 {lab=#net3}
N 310 30 310 50 {lab=#net3}
N 450 50 530 50 {lab=#net4}
N 480 20 490 20 {lab=trip}
N 480 0 490 0 {lab=phi1}
N 480 100 490 100 {lab=phi2}
N 480 120 490 120 {lab=trip}
N 480 -10 480 0 {lab=phi1}
N 480 90 480 100 {lab=phi2}
N 990 0 1030 0 {lab=Vcm}
N 1118 -140 1118 -110 {lab=Vdd}
N 1118 50 1118 90 {lab=phi1}
N 1110 90 1118 90 {lab=phi1}
N 1210 -30 1300 -30 {lab=out}
N 860 240 860 260 {lab=vss}
N 850 160 860 160 {lab=Vdd}
N 860 160 860 180 {lab=Vdd}
N 860 260 870 260 {lab=vss}
N 1300 -30 1300 210 {lab=out}
N 890 210 1300 210 {lab=out}
N 1300 -30 1340 -30 {lab=out}
N 480 160 530 160 {lab=Vcm}
N 250 -0 270 -0 {lab=phi2}
N 310 130 310 210 {lab=Vfb}
N -480 210 310 210 {lab=Vfb}
C {switch_ngspice.sym} -480 0 0 0 {name=S1 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} -480 100 0 0 {name=S2 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} -260 0 0 0 {name=S3 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} -260 100 0 0 {name=S4 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {ideal_opamp.sym} 20 -60 0 0 {name=x1}
C {capa.sym} 70 -170 3 1 {name=C2
m=1
value=\{C2\}
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} -130 -90 0 0 {name=p2 sig_type=std_logic lab=diff}
C {lab_wire.sym} -130 -30 0 0 {name=p3 sig_type=std_logic lab=Vcm}
C {capa.sym} -370 50 3 1 {name=C1
m=1
value=\{C1\}
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} -540 120 0 0 {name=p12 sig_type=std_logic lab=trip}
C {lab_wire.sym} -310 90 0 0 {name=p13 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -310 120 0 0 {name=p14 sig_type=std_logic lab=trip}
C {lab_wire.sym} -310 20 0 0 {name=p15 sig_type=std_logic lab=trip}
C {lab_wire.sym} -310 -10 0 0 {name=p16 sig_type=std_logic lab=phi2}
C {ipin.sym} -510 -60 0 0 {name=p30 lab=Vin}
C {ipin.sym} -540 -10 0 0 {name=p1 lab=phi1}
C {ipin.sym} -540 20 0 0 {name=p9 lab=trip}
C {ipin.sym} -540 90 0 0 {name=p10 lab=phi2}
C {ipin.sym} -280 160 0 0 {name=p11 lab=Vcm}
C {switch_ngspice.sym} 310 0 0 0 {name=S5 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} 310 100 0 0 {name=S6 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} 530 0 0 0 {name=S7 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} 530 100 0 0 {name=S8 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {ideal_opamp.sym} 810 -60 0 0 {name=x4}
C {capa.sym} 860 -170 3 1 {name=C3
m=1
value=\{C2\}
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 660 -90 0 0 {name=p21 sig_type=std_logic lab=diff}
C {lab_wire.sym} 660 -30 0 0 {name=p22 sig_type=std_logic lab=Vcm}
C {capa.sym} 420 50 3 1 {name=C4
m=1
value=\{C1\}
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 250 120 0 0 {name=p23 sig_type=std_logic lab=trip}
C {lab_wire.sym} 480 90 0 0 {name=p24 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 480 120 0 0 {name=p25 sig_type=std_logic lab=trip}
C {lab_wire.sym} 480 20 0 0 {name=p26 sig_type=std_logic lab=trip}
C {lab_wire.sym} 480 -10 0 0 {name=p27 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 990 0 0 0 {name=p5 sig_type=std_logic lab=Vcm
}
C {ideal_comparator.sym} 1110 -30 0 0 {name=x3}
C {lab_wire.sym} 1118 -140 0 1 {name=p18 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 1110 90 0 0 {name=p7 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 770 210 0 0 {name=p17 sig_type=std_logic lab=Vfb}
C {ideal_inverter.sym} 860 210 0 1 {name=x5}
C {ipin.sym} 850 160 0 0 {name=p6 lab=Vdd}
C {iopin.sym} 870 260 0 0 {name=p8 lab=vss}
C {opin.sym} 1330 -30 0 0 {name=p4 lab=out}
C {lab_wire.sym} 480 160 0 0 {name=p19 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 250 0 0 0 {name=p28 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 250 20 0 0 {name=p20 sig_type=std_logic lab=trip}
C {lab_wire.sym} 250 100 0 0 {name=p29 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 160 -170 0 1 {name=p31 sig_type=std_logic lab=Vint1}
C {lab_wire.sym} 950 -170 0 1 {name=p32 sig_type=std_logic lab=Vint2}
