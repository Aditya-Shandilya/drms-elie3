v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -440 -310 -430 -310 {lab=Vin}
N -430 -310 -430 -300 {lab=Vin}
N -430 -240 -430 -230 {lab=GND}
N -290 -260 -290 -240 {lab=GND}
N -290 -240 -250 -240 {lab=GND}
N -250 -250 -250 -240 {lab=GND}
N -250 -240 -250 -230 {lab=GND}
N -150 -250 -150 -230 {lab=GND}
N -40 -250 -40 -230 {lab=GND}
N 50 -250 50 -230 {lab=GND}
N 140 -250 140 -230 {lab=GND}
N 400 -250 400 -230 {lab=GND}
N 390 -320 400 -320 {lab=phi2}
N 400 -320 400 -310 {lab=phi2}
N 130 -320 140 -320 {lab=phi1}
N 140 -320 140 -310 {lab=phi1}
N 40 -320 50 -320 {lab=Vcm}
N 50 -320 50 -310 {lab=Vcm}
N -50 -320 -40 -320 {lab=Vdd}
N -40 -320 -40 -310 {lab=Vdd}
N -160 -320 -150 -320 {lab=Vref}
N -150 -320 -150 -310 {lab=Vref}
N -260 -320 -250 -320 {lab=trip}
N -250 -320 -250 -310 {lab=trip}
N -310 -300 -290 -300 {lab=Vdd}
N -10 -120 -10 -100 {lab=Vdd}
N -30 -120 -10 -120 {lab=Vdd}
N 20 -120 20 -100 {lab=Vref}
N 20 -120 40 -120 {lab=Vref}
N -130 -30 -110 -30 {lab=phi1}
N -130 -50 -110 -50 {lab=Vin}
N -130 -10 -110 -10 {lab=phi2}
N -130 10 -110 10 {lab=trip}
N -130 30 -110 30 {lab=Vcm}
N -10 80 -10 90 {lab=GND}
N 100 -50 190 -50 {lab=mod_out}
N 400 -50 420 -50 {lab=adaclout}
N 170 -30 190 -30 {lab=phi1}
N 400 -30 420 -30 {lab=adaccout}
C {vsource.sym} -430 -270 0 0 {name=Vin 
value="SINE(1.5 0.7 1k)" 
savecurrent=false}
C {vsource.sym} -150 -280 0 0 {name=Vref value=\{Vref\} savecurrent=false}
C {vsource.sym} -40 -280 0 0 {name=Vdd value=\{Vdd\} savecurrent=false}
C {vsource.sym} 50 -280 0 0 {name=Vcm value=\{Vcm\} savecurrent=false}
C {vsource.sym} 140 -280 0 0 {name=Vphi1 value="PULSE(0V 3V 0.5us 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vsource.sym} 400 -280 0 0 {name=Vphi2 value="PULSE(0V 3V 0.5us 0.1ns 0.1ns 0.4us 1us)" savecurrent=false}
C {vcvs.sym} -250 -280 0 0 {name=Etrip value=\{Etrip\}}
C {lab_wire.sym} -440 -310 0 0 {name=p8 sig_type=std_logic lab=Vin}
C {gnd.sym} -430 -230 0 0 {name=l3 lab=GND}
C {gnd.sym} -250 -230 0 0 {name=l4 lab=GND}
C {gnd.sym} -150 -230 0 0 {name=l5 lab=GND}
C {gnd.sym} -40 -230 0 0 {name=l6 lab=GND}
C {gnd.sym} 50 -230 0 0 {name=l7 lab=GND}
C {gnd.sym} 140 -230 0 0 {name=l8 lab=GND}
C {gnd.sym} 400 -230 0 0 {name=l9 lab=GND}
C {lab_wire.sym} -260 -320 0 0 {name=p19 sig_type=std_logic lab=trip}
C {lab_wire.sym} -160 -320 0 0 {name=p21 sig_type=std_logic lab=Vref}
C {lab_wire.sym} -50 -320 0 0 {name=p22 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 40 -320 0 0 {name=p23 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} 130 -320 0 0 {name=p24 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 390 -320 0 0 {name=p25 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -310 -300 0 0 {name=p26 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} -30 -120 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 40 -120 0 1 {name=p2 sig_type=std_logic lab=Vref}
C {lab_wire.sym} -130 -50 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {lab_wire.sym} -130 -30 0 0 {name=p4 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -130 -10 0 0 {name=p5 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -130 10 0 0 {name=p6 sig_type=std_logic lab=trip}
C {lab_wire.sym} -130 30 0 0 {name=p7 sig_type=std_logic lab=Vcm}
C {gnd.sym} -10 90 0 0 {name=l1 lab=GND}
C {code_shown.sym} 562 -152 0 0 {name=param only_toplevel=false 
value="
.param Etrip=0.5
.param Vref=3
.param Vdd=3
.param Vcm=Vdd/2
.param C1=0.25p C2=1p
.param samples=32
"}
C {code_shown.sym} 572 51 0 0 {name=NGSPICE only_toplevel=false 
value="
.temp 27
.control
option sparse
tran 100n 10ms 0 20n uic
save V(Vin) V(x1.Vint) V(mod_out) V(adaclout) V(adaccout)
plot V(Vin) V(x1.Vint) V(mod_out)

*FFT Analysis
*linearize V(mod_out)
*fft V(mod_out)
*plot db(mag(V(mod_out))) xlimit 1k 500k ylimit -100 10 xlog

*ADC Output
plot V(Vin) (V(adaccout * 96 -2) (V(adaclout) * 96 - 2)
.endc
"}
C {ideal_modulator.sym} 40 -10 0 0 {name=x1}
C {ideal_decimator.sym} 300 30 0 0 {name=x2}
C {lab_wire.sym} 170 -30 0 0 {name=p9 sig_type=std_logic lab=phi1}
C {opin.sym} 420 -50 0 0 {name=p10 lab=adaclout}
C {lab_wire.sym} 170 -50 0 0 {name=p11 sig_type=std_logic lab=mod_out}
C {opin.sym} 420 -30 0 0 {name=p12 lab=adaccout}
