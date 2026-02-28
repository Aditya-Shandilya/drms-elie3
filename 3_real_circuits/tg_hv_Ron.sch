v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -60 0 -50 0 {lab=a}
N -120 60 -120 70 {lab=GND}
N 50 0 110 0 {lab=b}
N 110 -0 110 70 {lab=b}
N -0 60 0 100 {lab=GND}
N -60 0 -60 70 {lab=a}
N -120 0 -60 0 {lab=a}
N -60 70 50 70 {lab=a}
N -0 -80 -0 -50 {lab=vdd}
N -210 60 -210 70 {lab=GND}
N -210 -10 -210 -0 {lab=vdd}
C {tg_hv.sym} 0 0 0 0 {name=x1}
C {code_shown.sym} 230 -230 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
"}
C {vsource.sym} -120 30 0 0 {name=VIN value=0 savecurrent=false}
C {gnd.sym} -120 70 0 0 {name=l4 lab=GND}
C {code_shown.sym} 220 -130 0 0 {name=NGSPICE only_toplevel=true 
value="
.options reltol=1e-6 vntol=1e-6 abstol=1e-12
.temp 27
.control
option sparse
save all
op
write tg_hv_tb.raw
dc VIN 0 3 0.05
let Ron = (v(b)-v(a))/I(Vds)
plot Ron ylabel 'Ron (Ohms)' xlabel 'Vin (V)'
.endc
"}
C {devices/code_shown.sym} 220 140 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {vsource.sym} -210 30 0 0 {name=VDD value=\{Vdd\} savecurrent=false}
C {vdd.sym} -210 -10 0 0 {name=l5 lab=VDD}
C {gnd.sym} -210 70 0 0 {name=l6 lab=GND}
C {lab_wire.sym} -70 0 0 0 {name=p1 sig_type=std_logic lab=a}
C {lab_wire.sym} 80 0 0 0 {name=p2 sig_type=std_logic lab=b}
C {vsource.sym} 80 70 3 0 {name=VDS value=1m savecurrent=false}
C {vdd.sym} 0 -80 0 0 {name=l2 lab=vdd}
C {gnd.sym} 0 100 0 0 {name=l1 lab=GND}
