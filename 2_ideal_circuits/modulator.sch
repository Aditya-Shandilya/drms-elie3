v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 80 0 100 0 {}
L 4 100 -80 100 80 {}
B 5 97.5 -2.5 102.5 2.5 {name=vout dir=out}
N -120 0 -120 20 {lab=#net1}
N 100 -20 100 -0 {lab=#net2}
N 100 0 100 20 {lab=#net2}
N 100 -140 100 -80 {lab=diff}
N 260 -140 300 -140 {lab=diff}
N 260 -220 400 -220 {lab=diff}
N 260 -220 260 -140 {lab=diff}
N 100 -140 260 -140 {lab=diff}
N 520 -110 600 -110 {lab=Vint}
N 460 -220 520 -220 {lab=Vint}
N 520 -220 520 -110 {lab=Vint}
N 480 -110 520 -110 {lab=Vint}
N 850 -80 900 -80 {lab=cmp}
N 850 -80 850 160 {lab=cmp}
N 780 -80 850 -80 {lab=cmp}
N -120 160 340 160 {lab=Vfb}
N -120 80 -120 160 {lab=Vfb}
N -150 -110 -120 -110 {lab=Vin}
N -120 -110 -120 -80 {lab=Vin}
N 230 -80 300 -80 {lab=Vcm}
N 560 -50 600 -50 {lab=Vcm}
N 100 80 100 110 {lab=Vcm}
N 80 110 100 110 {lab=Vcm}
N -180 -410 -170 -410 {lab=Vin}
N -170 -410 -170 -400 {lab=Vin}
N -170 -340 -170 -330 {lab=GND}
N -30 -360 -30 -340 {lab=GND}
N -30 -340 10 -340 {lab=GND}
N 10 -350 10 -340 {lab=GND}
N 10 -340 10 -330 {lab=GND}
N 110 -340 110 -320 {lab=GND}
N 220 -340 220 -320 {lab=GND}
N 310 -340 310 -320 {lab=GND}
N 440 -510 440 -490 {lab=GND}
N 810 -520 810 -500 {lab=GND}
N -180 -50 -160 -50 {lab=phi1}
N -180 -30 -160 -30 {lab=trip}
N -180 50 -160 50 {lab=phi2}
N -180 70 -160 70 {lab=trip}
N -120 0 -40 0 {lab=#net1}
N -120 -20 -120 0 {lab=#net1}
N 20 -0 100 0 {lab=#net2}
N 50 -30 60 -30 {lab=trip}
N 50 -50 60 -50 {lab=phi2}
N 50 50 60 50 {lab=phi1}
N 50 70 60 70 {lab=trip}
N 688 -190 688 -160 {lab=Vdd}
N 688 -0 688 40 {lab=phi1}
N 680 40 688 40 {lab=phi1}
N 800 -590 810 -590 {lab=phi2}
N 810 -590 810 -580 {lab=phi2}
N 430 -580 440 -580 {lab=phi1}
N 440 -580 440 -570 {lab=phi1}
N 300 -410 310 -410 {lab=Vcm}
N 310 -410 310 -400 {lab=Vcm}
N 210 -410 220 -410 {lab=Vdd}
N 220 -410 220 -400 {lab=Vdd}
N 100 -410 110 -410 {lab=Vref}
N 110 -410 110 -400 {lab=Vref}
N 0 -420 10 -420 {lab=trip}
N 10 -420 10 -410 {lab=trip}
N -50 -400 -30 -400 {lab=Vdd}
N 970 -80 1000 -80 {lab=out}
N 930 -50 930 -40 {lab=GND}
N 380 190 380 200 {lab=GND}
N 370 110 380 110 {lab=Vref}
N 380 110 380 130 {lab=Vref}
N 920 -130 930 -130 {lab=Vdd}
N 930 -130 930 -110 {lab=Vdd}
N 410 160 850 160 {lab=cmp}
C {switch_ngspice.sym} -120 -50 0 0 {name=S1 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} -120 50 0 0 {name=S2 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} 100 -50 0 0 {name=S3 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {switch_ngspice.sym} 100 50 0 0 {name=S4 model=SW1
device_model=".MODEL SW1 SW( VT=0.5 VH=0 RON=0.1 ROFF=100M )"}
C {ideal_opamp.sym} 380 -110 0 0 {name=x1}
C {capa.sym} 430 -220 3 1 {name=C2
m=1
value=\{C\}
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -170 -370 0 0 {name=Vin 
value="SINE(1.5 1.4 1k)" 
savecurrent=false}
C {vsource.sym} 110 -370 0 0 {name=Vref value=\{Vref\} savecurrent=false}
C {vsource.sym} 220 -370 0 0 {name=Vdd value=\{Vdd\} savecurrent=false}
C {vsource.sym} 310 -370 0 0 {name=Vcm value=\{Vcm\} savecurrent=false}
C {vsource.sym} 440 -540 0 0 {name=Vphi1 value="PULSE(0V 3V 0ns 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vsource.sym} 810 -550 0 0 {name=Vphi2 value="PULSE(0V 3V 0.5ns 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vcvs.sym} 10 -380 0 0 {name=Etrip value=\{Etrip\}}
C {lab_wire.sym} -150 -110 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_wire.sym} 230 -140 0 0 {name=p2 sig_type=std_logic lab=diff}
C {lab_wire.sym} 230 -80 0 0 {name=p3 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 560 -110 0 0 {name=p4 sig_type=std_logic lab=Vint}
C {lab_wire.sym} 560 -50 0 0 {name=p5 sig_type=std_logic lab=Vcm
}
C {lab_wire.sym} 80 110 0 0 {name=p6 sig_type=std_logic lab=Vcm}
C {capa.sym} -10 0 3 1 {name=C1
m=1
value=\{C\}
footprint=1206
device="ceramic capacitor"}
C {ideal_comparator.sym} 680 -80 0 0 {name=x3}
C {lab_wire.sym} -180 -410 0 0 {name=p8 sig_type=std_logic lab=Vin}
C {gnd.sym} -170 -330 0 0 {name=l3 lab=GND}
C {gnd.sym} 10 -330 0 0 {name=l4 lab=GND}
C {gnd.sym} 110 -320 0 0 {name=l5 lab=GND}
C {gnd.sym} 220 -320 0 0 {name=l6 lab=GND}
C {gnd.sym} 310 -320 0 0 {name=l7 lab=GND}
C {gnd.sym} 440 -490 0 0 {name=l8 lab=GND}
C {gnd.sym} 810 -500 0 0 {name=l9 lab=GND}
C {lab_wire.sym} -180 -50 0 0 {name=p9 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -180 -30 0 0 {name=p10 sig_type=std_logic lab=trip}
C {lab_wire.sym} -180 50 0 0 {name=p11 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -180 70 0 0 {name=p12 sig_type=std_logic lab=trip}
C {lab_wire.sym} 50 50 0 0 {name=p13 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 50 70 0 0 {name=p14 sig_type=std_logic lab=trip}
C {lab_wire.sym} 50 -30 0 0 {name=p15 sig_type=std_logic lab=trip}
C {lab_wire.sym} 50 -50 0 0 {name=p16 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 290 160 0 0 {name=p17 sig_type=std_logic lab=Vfb}
C {code_shown.sym} 862 -362 0 0 {name=param only_toplevel=false 
value="
.param Etrip=0.5
.param Vref=3
.param Vdd=3
.param Vcm=Vdd/2
.param C=0.25p
"}
C {lab_wire.sym} 688 -190 0 1 {name=p18 sig_type=std_logic lab=Vdd}
C {launcher.sym} 1030 60 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"}
C {launcher.sym} 1030 120 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"}
C {code_shown.sym} 1072 -369 0 0 {name=NGSPICE only_toplevel=false 
value="
.temp 27
.control
option sparse
.options plotwinsize=0
tran 0.1n 5ms
write modulator.raw
plot v(Vin) v(out) v(Vcm) v(Vint)
save all
.endc
"}
C {lab_wire.sym} 680 40 0 0 {name=p7 sig_type=std_logic lab=phi1}
C {ideal_inverter.sym} 380 160 0 1 {name=x5}
C {lab_wire.sym} 0 -420 0 0 {name=p19 sig_type=std_logic lab=trip}
C {lab_wire.sym} 100 -410 0 0 {name=p21 sig_type=std_logic lab=Vref}
C {lab_wire.sym} 210 -410 0 0 {name=p22 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 300 -410 0 0 {name=p23 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 430 -580 0 0 {name=p24 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 800 -590 0 0 {name=p25 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -50 -400 0 0 {name=p26 sig_type=std_logic lab=Vdd}
C {ideal_inverter.sym} 930 -80 0 0 {name=x2}
C {lab_wire.sym} 920 -130 0 0 {name=p27 sig_type=std_logic lab=Vdd}
C {gnd.sym} 930 -40 0 0 {name=l1 lab=GND}
C {gnd.sym} 380 200 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 370 110 0 0 {name=p28 sig_type=std_logic lab=Vref}
C {opin.sym} 1000 -80 0 0 {name=p29 lab=out}
C {lab_wire.sym} 880 -80 0 0 {name=p20 sig_type=std_logic lab=cmp}
