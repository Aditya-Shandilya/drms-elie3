v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -530 120 -400 120 {lab=vop}
N -230 -70 -110 -70 {lab=vop}
N -110 120 80 120 {lab=vop}
N 80 -70 220 -70 {lab=vop}
N 80 120 220 120 {lab=vop}
N 500 -70 640 -70 {lab=vop}
N 500 120 640 120 {lab=vop}
N 390 120 500 120 {lab=vop}
N 810 -70 830 -70 {lab=vop}
N 810 120 830 120 {lab=vop}
N -730 200 -730 220 {lab=vss}
N -920 220 -730 220 {lab=vss}
N -730 220 -310 220 {lab=vss}
N -310 200 -310 220 {lab=vss}
N 310 200 310 220 {lab=vss}
N -310 220 310 220 {lab=vss}
N 730 200 730 220 {lab=vss}
N 310 220 730 220 {lab=vss}
N -730 10 -730 30 {lab=vss}
N -730 70 -730 90 {lab=vop}
N -730 30 -310 30 {lab=vss}
N -310 10 -310 30 {lab=vss}
N -110 -70 -110 -50 {lab=vop}
N -310 30 310 30 {lab=vss}
N 80 10 80 120 {lab=vop}
N 310 10 310 30 {lab=vss}
N 500 10 500 120 {lab=vop}
N 730 10 730 30 {lab=vss}
N 310 30 730 30 {lab=vss}
N 80 -70 80 -50 {lab=vop}
N 500 -70 500 -50 {lab=vop}
N 390 -70 500 -70 {lab=vop}
N -920 30 -730 30 {lab=vss}
N -920 30 -920 220 {lab=vss}
N -930 220 -920 220 {lab=vss}
N -730 70 -310 70 {lab=vop}
N 310 70 730 70 {lab=vop}
N 730 70 730 90 {lab=vop}
N -310 70 -310 90 {lab=vop}
N 310 70 310 90 {lab=vop}
N -310 70 310 70 {lab=vop}
N -120 -150 -110 -150 {lab=vop}
N 80 -150 90 -150 {lab=vop}
N 80 -150 80 -70 {lab=vop}
N -310 -120 -310 -100 {lab=vop}
N -310 -120 310 -120 {lab=vop}
N 310 -120 310 -100 {lab=vop}
N 730 -120 730 -100 {lab=vop}
N 310 -120 730 -120 {lab=vop}
N -730 -120 -310 -120 {lab=vop}
N -730 -120 -730 -100 {lab=vop}
N -900 -120 -730 -120 {lab=vop}
N -900 70 -730 70 {lab=vop}
N -900 -120 -900 70 {lab=vop}
N -930 -120 -900 -120 {lab=vop}
N -930 -30 -820 -30 {lab=phi1_b}
N -930 -50 -820 -50 {lab=phi1}
N -930 -70 -820 -70 {lab=vcm}
N -930 120 -820 120 {lab=vbiasn}
N -850 140 -820 140 {lab=phi1}
N -850 160 -820 160 {lab=phi1_b}
N -420 -30 -400 -30 {lab=phi2_b}
N -420 -50 -400 -50 {lab=phi2}
N -420 140 -400 140 {lab=phi2}
N -420 160 -400 160 {lab=phi2_b}
N 200 -50 220 -50 {lab=phi2}
N 200 140 220 140 {lab=phi2}
N 200 160 220 160 {lab=phi2_b}
N 200 -30 220 -30 {lab=phi2_b}
N 620 -50 640 -50 {lab=phi1}
N 620 -30 640 -30 {lab=phi1_b}
N 620 140 640 140 {lab=phi1}
N 620 160 640 160 {lab=phi1_b}
N -530 10 -530 120 {lab=vop}
N -650 120 -530 120 {lab=vop}
N -530 -70 -530 -50 {lab=vop}
N -650 -70 -530 -70 {lab=vop}
N -530 -70 -400 -70 {lab=vop}
N -110 -70 80 -70 {lab=vop}
N -110 10 -110 120 {lab=vop}
N -230 120 -110 120 {lab=vop}
N -110 -150 -110 -70 {lab=vop}
C {tg_hv.sym} -730 -50 0 0 {name=x1}
C {devices/ipin.sym} -930 -70 0 0 {name=p20 lab=vcm}
C {sg13g2_pr/cap_cmim.sym} -530 -20 0 1 {name=C1
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {tg_hv.sym} -730 140 0 0 {name=x2}
C {tg_hv.sym} -310 -50 0 0 {name=x3}
C {sg13g2_pr/cap_cmim.sym} -110 -20 0 0 {name=C3
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {tg_hv.sym} -310 140 0 0 {name=x4}
C {sg13g2_pr/cap_cmim.sym} 80 -20 0 0 {name=C4
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {tg_hv.sym} 310 -50 0 0 {name=x5}
C {tg_hv.sym} 310 140 0 0 {name=x6}
C {sg13g2_pr/cap_cmim.sym} 500 -20 0 0 {name=C2
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {tg_hv.sym} 730 -50 0 0 {name=x7}
C {tg_hv.sym} 730 140 0 0 {name=x8}
C {devices/ipin.sym} -930 120 0 0 {name=p4 lab=vbiasn}
C {devices/ipin.sym} -120 -150 0 0 {name=p8 lab=vop}
C {devices/ipin.sym} 90 -150 0 1 {name=p5 lab=von}
C {lab_wire.sym} 830 -70 0 1 {name=p6 sig_type=std_logic lab=vcm}
C {lab_wire.sym} 830 120 0 1 {name=p9 sig_type=std_logic lab=vbiasn}
C {devices/ipin.sym} -930 -120 0 0 {name=p23 lab=vdd}
C {devices/iopin.sym} -930 220 0 1 {name=p22 lab=vss}
C {devices/ipin.sym} -930 -50 0 0 {name=p1 lab=phi1}
C {devices/ipin.sym} -930 -30 0 0 {name=p2 lab=phi1_b}
C {lab_wire.sym} -850 140 0 0 {name=p3 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -850 160 0 0 {name=p7 sig_type=std_logic lab=phi1_b}
C {devices/ipin.sym} -420 -30 0 0 {name=p10 lab=phi2_b}
C {devices/ipin.sym} -420 -50 0 0 {name=p11 lab=phi2}
C {lab_wire.sym} -420 140 0 0 {name=p12 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -420 160 0 0 {name=p13 sig_type=std_logic lab=phi2_b}
C {lab_wire.sym} 200 -50 0 0 {name=p14 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 200 -30 0 0 {name=p15 sig_type=std_logic lab=phi2_b}
C {lab_wire.sym} 200 140 0 0 {name=p16 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 200 160 0 0 {name=p17 sig_type=std_logic lab=phi2_b}
C {lab_wire.sym} 620 -50 0 0 {name=p18 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 620 -30 0 0 {name=p19 sig_type=std_logic lab=phi1_b}
C {lab_wire.sym} 620 140 0 0 {name=p21 sig_type=std_logic lab=phi1}
C {lab_wire.sym} 620 160 0 0 {name=p24 sig_type=std_logic lab=phi1_b}
