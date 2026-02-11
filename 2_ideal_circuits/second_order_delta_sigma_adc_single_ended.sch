v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -510 -270 -500 -270 {lab=Vin}
N -500 -270 -500 -260 {lab=Vin}
N -500 -200 -500 -180 {lab=GND}
N -360 -210 -360 -190 {lab=GND}
N -360 -190 -320 -190 {lab=GND}
N -320 -200 -320 -190 {lab=GND}
N -320 -190 -320 -180 {lab=GND}
N -110 -200 -110 -180 {lab=GND}
N -20 -200 -20 -180 {lab=GND}
N 70 -200 70 -180 {lab=GND}
N 330 -200 330 -180 {lab=GND}
N 320 -270 330 -270 {lab=phi2}
N 330 -270 330 -260 {lab=phi2}
N 60 -270 70 -270 {lab=phi1}
N 70 -270 70 -260 {lab=phi1}
N -30 -270 -20 -270 {lab=Vcm}
N -20 -270 -20 -260 {lab=Vcm}
N -120 -270 -110 -270 {lab=Vdd}
N -110 -270 -110 -260 {lab=Vdd}
N -330 -270 -320 -270 {lab=trip}
N -320 -270 -320 -260 {lab=trip}
N -380 -250 -360 -250 {lab=Vdd}
N -170 -30 -150 -30 {lab=phi1}
N -170 -50 -150 -50 {lab=Vin}
N -170 10 -150 10 {lab=phi2}
N -170 -10 -150 -10 {lab=trip}
N -170 30 -150 30 {lab=Vcm}
N 150 -10 180 -10 {lab=out}
N -0 80 -0 100 {lab=GND}
N -20 -110 0 -110 {lab=Vdd}
N 0 -110 0 -80 {lab=Vdd}
C {second_order_modulator.sym} 0 0 0 0 {name=x1}
C {vsource.sym} -500 -230 0 0 {name=Vin 
value="SINE(1.5 0.8 625)" 
savecurrent=false}
C {vsource.sym} -110 -230 0 0 {name=Vdd value=\{Vdd\} savecurrent=false}
C {vsource.sym} -20 -230 0 0 {name=Vcm value=\{Vcm\} savecurrent=false}
C {vsource.sym} 70 -230 0 0 {name=Vphi1 value="PULSE(0V 3V 0ns 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vsource.sym} 330 -230 0 0 {name=Vphi2 value="PULSE(0V 3V 0.5us 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vcvs.sym} -320 -230 0 0 {name=Etrip value=\{Etrip\}}
C {lab_wire.sym} -510 -270 0 0 {name=p8 sig_type=std_logic lab=Vin}
C {gnd.sym} -500 -180 0 0 {name=l3 lab=GND}
C {gnd.sym} -320 -180 0 0 {name=l4 lab=GND}
C {gnd.sym} -110 -180 0 0 {name=l6 lab=GND}
C {gnd.sym} -20 -180 0 0 {name=l7 lab=GND}
C {gnd.sym} 70 -180 0 0 {name=l8 lab=GND}
C {gnd.sym} 330 -180 0 0 {name=l9 lab=GND}
C {lab_wire.sym} -330 -270 0 0 {name=p19 sig_type=std_logic lab=trip}
C {lab_wire.sym} -120 -270 0 0 {name=p22 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} -30 -270 0 0 {name=p23 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 60 -270 0 0 {name=p24 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 320 -270 0 0 {name=p25 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -380 -250 0 0 {name=p26 sig_type=std_logic lab=Vdd}
C {code_shown.sym} 272 -72 0 0 {name=param only_toplevel=false 
value="
.param Etrip=0.5
.param Vref=3
.param Vdd=3
.param Vcm=Vdd/2
.param C1=1p C2=1p C3=0.5p C4=0.25p
.param samples=500
"}
C {code_shown.sym} 272 111 0 0 {name=NGSPICE only_toplevel=false 
value="
.temp 27
.control
option sparse
option method=gear
tran 100n 10ms 0 20n uic
save V(Vin) V(x1.Vint1) V(x1.Vint2) V(out)
wrdata sodsm_data.txt V(Vin) V(x1.Vint1) V(x1.Vint2) V(out)
plot V(Vin) V(x1.Vint1) V(x1.Vint2) V(out)
.endc
"}
C {lab_wire.sym} -170 -50 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {lab_wire.sym} -170 -30 0 0 {name=p4 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -170 10 0 0 {name=p5 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -170 -10 0 0 {name=p6 sig_type=std_logic lab=trip}
C {lab_wire.sym} -170 30 0 0 {name=p7 sig_type=std_logic lab=Vcm}
C {gnd.sym} 0 100 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -20 -110 0 0 {name=p10 sig_type=std_logic lab=Vdd}
C {opin.sym} 180 -10 0 0 {name=p2 lab=out}
