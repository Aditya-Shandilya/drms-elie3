v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
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
N -60 -380 -50 -380 {lab=Vin}
N -50 -380 -50 -370 {lab=Vin}
N -50 -310 -50 -300 {lab=GND}
N 90 -330 90 -310 {lab=GND}
N 90 -310 130 -310 {lab=GND}
N 130 -320 130 -310 {lab=GND}
N 130 -310 130 -300 {lab=GND}
N 230 -320 230 -300 {lab=GND}
N 340 -320 340 -300 {lab=GND}
N 430 -320 430 -300 {lab=GND}
N 520 -320 520 -300 {lab=GND}
N 780 -320 780 -300 {lab=GND}
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
N 770 -390 780 -390 {lab=phi2}
N 780 -390 780 -380 {lab=phi2}
N 510 -390 520 -390 {lab=phi1}
N 520 -390 520 -380 {lab=phi1}
N 420 -390 430 -390 {lab=Vcm}
N 430 -390 430 -380 {lab=Vcm}
N 330 -390 340 -390 {lab=Vdd}
N 340 -390 340 -380 {lab=Vdd}
N 220 -390 230 -390 {lab=Vref}
N 230 -390 230 -380 {lab=Vref}
N 120 -390 130 -390 {lab=trip}
N 130 -390 130 -380 {lab=trip}
N 70 -370 90 -370 {lab=Vdd}
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
value=\{C2\}
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -50 -340 0 0 {name=Vin 
value="SINE(1.5 0.8 1k)" 
savecurrent=false}
C {vsource.sym} 230 -350 0 0 {name=Vref value=\{Vref\} savecurrent=false}
C {vsource.sym} 340 -350 0 0 {name=Vdd value=\{Vdd\} savecurrent=false}
C {vsource.sym} 430 -350 0 0 {name=Vcm value=\{Vcm\} savecurrent=false}
C {vsource.sym} 520 -350 0 0 {name=Vphi1 value="PULSE(0V 3V 0ns 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vsource.sym} 780 -350 0 0 {name=Vphi2 value="PULSE(0V 3V 0.5us 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vcvs.sym} 130 -350 0 0 {name=Etrip value=\{Etrip\}}
C {lab_wire.sym} -150 -110 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_wire.sym} 230 -140 0 0 {name=p2 sig_type=std_logic lab=diff}
C {lab_wire.sym} 230 -80 0 0 {name=p3 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 560 -110 0 0 {name=p4 sig_type=std_logic lab=Vint}
C {lab_wire.sym} 560 -50 0 0 {name=p5 sig_type=std_logic lab=Vcm
}
C {lab_wire.sym} 80 110 0 0 {name=p6 sig_type=std_logic lab=Vcm}
C {capa.sym} -10 0 3 1 {name=C1
m=1
value=\{C1\}
footprint=1206
device="ceramic capacitor"}
C {ideal_comparator.sym} 680 -80 0 0 {name=x3}
C {lab_wire.sym} -60 -380 0 0 {name=p8 sig_type=std_logic lab=Vin}
C {gnd.sym} -50 -300 0 0 {name=l3 lab=GND}
C {gnd.sym} 130 -300 0 0 {name=l4 lab=GND}
C {gnd.sym} 230 -300 0 0 {name=l5 lab=GND}
C {gnd.sym} 340 -300 0 0 {name=l6 lab=GND}
C {gnd.sym} 430 -300 0 0 {name=l7 lab=GND}
C {gnd.sym} 520 -300 0 0 {name=l8 lab=GND}
C {gnd.sym} 780 -300 0 0 {name=l9 lab=GND}
C {lab_wire.sym} -180 -50 0 0 {name=p9 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -180 -30 0 0 {name=p10 sig_type=std_logic lab=trip}
C {lab_wire.sym} -180 50 0 0 {name=p11 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -180 70 0 0 {name=p12 sig_type=std_logic lab=trip}
C {lab_wire.sym} 50 50 0 0 {name=p13 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 50 70 0 0 {name=p14 sig_type=std_logic lab=trip}
C {lab_wire.sym} 50 -30 0 0 {name=p15 sig_type=std_logic lab=trip}
C {lab_wire.sym} 50 -50 0 0 {name=p16 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 290 160 0 0 {name=p17 sig_type=std_logic lab=Vfb}
C {code_shown.sym} 1092 -282 0 0 {name=param only_toplevel=false 
value="
.param Etrip=0.5
.param Vref=3
.param Vdd=3
.param Vcm=Vdd/2
.param C1=0.25p C2=1p
"}
C {lab_wire.sym} 688 -190 0 1 {name=p18 sig_type=std_logic lab=Vdd}
C {launcher.sym} 920 -260 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"}
C {launcher.sym} 920 -200 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"}
C {code_shown.sym} 1102 -79 0 0 {name=NGSPICE only_toplevel=false 
value="
.temp 27
.control
option sparse
tran 100n 7ms 2ms 20n uic
save V(Vin) V(Vint) V(out) 
plot V(Vin) V(out)

*FFT Analysis
linearize V(out)
fft V(out)
plot db(mag(V(out))) xlimit 1 500k ylimit -100 10 xlog
.endc
"}
C {lab_wire.sym} 680 40 0 0 {name=p7 sig_type=std_logic lab=phi1}
C {ideal_inverter.sym} 380 160 0 1 {name=x5}
C {lab_wire.sym} 120 -390 0 0 {name=p19 sig_type=std_logic lab=trip}
C {lab_wire.sym} 220 -390 0 0 {name=p21 sig_type=std_logic lab=Vref}
C {lab_wire.sym} 330 -390 0 0 {name=p22 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 420 -390 0 0 {name=p23 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 510 -390 0 0 {name=p24 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 770 -390 0 0 {name=p25 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 70 -370 0 0 {name=p26 sig_type=std_logic lab=Vdd}
C {ideal_inverter.sym} 930 -80 0 0 {name=x2}
C {lab_wire.sym} 920 -130 0 0 {name=p27 sig_type=std_logic lab=Vdd}
C {gnd.sym} 930 -40 0 0 {name=l1 lab=GND}
C {gnd.sym} 380 200 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 370 110 0 0 {name=p28 sig_type=std_logic lab=Vref}
C {opin.sym} 1000 -80 0 0 {name=p29 lab=out}
C {lab_wire.sym} 880 -80 0 0 {name=p20 sig_type=std_logic lab=cmp}
