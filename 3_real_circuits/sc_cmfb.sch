v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -610 -100 -590 -100 {lab=vcm}
N -380 -100 -280 -100 {lab=#net1}
N -380 -100 -380 -30 {lab=#net1}
N -490 -100 -380 -100 {lab=#net1}
N -100 -100 -100 -30 {lab=vop}
N -180 -100 -100 -100 {lab=vop}
N -100 -190 -100 -100 {lab=vop}
N -120 -190 -100 -190 {lab=vop}
N 110 -100 190 -100 {lab=von}
N 110 -100 110 -30 {lab=von}
N 110 -190 110 -100 {lab=von}
N 110 -190 130 -190 {lab=von}
N -380 30 -380 100 {lab=#net2}
N -380 100 -280 100 {lab=#net2}
N -100 30 -100 100 {lab=#net3}
N 110 100 190 100 {lab=#net3}
N 110 30 110 100 {lab=#net3}
N 390 -100 390 -30 {lab=#net4}
N 290 -100 390 -100 {lab=#net4}
N 390 -100 490 -100 {lab=#net4}
N 390 30 390 100 {lab=#net5}
N 390 100 490 100 {lab=#net5}
N 590 -100 650 -100 {lab=vcm}
N 590 100 650 100 {lab=vbiasn}
N -540 40 -540 50 {lab=phi1}
N -570 -30 -540 -30 {lab=phi1_b}
N -540 -40 -540 -30 {lab=phi1_b}
N -630 40 -540 40 {lab=phi1}
N 290 100 390 100 {lab=#net5}
N -490 100 -380 100 {lab=#net2}
N -230 40 -230 50 {lab=phi2}
N -320 40 -230 40 {lab=phi2}
N 240 40 240 50 {lab=phi2}
N 150 40 240 40 {lab=phi2}
N 540 40 540 50 {lab=phi1}
N 450 40 540 40 {lab=phi1}
N -540 160 -540 170 {lab=phi1_b}
N -630 170 -540 170 {lab=phi1_b}
N -230 160 -230 170 {lab=phi2_b}
N -320 170 -230 170 {lab=phi2_b}
N 240 160 240 170 {lab=phi2_b}
N 150 170 240 170 {lab=phi2_b}
N 540 160 540 170 {lab=phi1_b}
N 450 170 540 170 {lab=phi1_b}
N -100 100 110 100 {lab=#net3}
N -180 100 -100 100 {lab=#net3}
N -230 -40 -230 -30 {lab=phi2_b}
N 240 -40 240 -30 {lab=phi2_b}
N 150 -30 240 -30 {lab=phi2_b}
N 540 -40 540 -30 {lab=phi1_b}
N 450 -30 540 -30 {lab=phi1_b}
N 240 -160 240 -150 {lab=phi2}
N 150 -160 240 -160 {lab=phi2}
N 540 -160 540 -150 {lab=phi1}
N 450 -160 540 -160 {lab=phi1}
N -560 -160 -540 -160 {lab=phi1}
N -540 -160 -540 -150 {lab=phi1}
N -260 -160 -230 -160 {lab=phi2}
N -230 -160 -230 -150 {lab=phi2}
N -260 -30 -230 -30 {lab=phi2_b}
N -610 100 -590 100 {lab=vbiasn}
C {sg13g2_pr/cap_cmim.sym} -380 0 0 1 {name=C1
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} -100 0 0 0 {name=C3
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {devices/ipin.sym} -120 -190 0 0 {name=p8 lab=vop}
C {devices/ipin.sym} 130 -190 0 1 {name=p5 lab=von}
C {lab_wire.sym} 650 -100 0 0 {name=p6 sig_type=std_logic lab=vcm}
C {lab_wire.sym} 650 100 0 0 {name=p9 sig_type=std_logic lab=vbiasn}
C {devices/ipin.sym} -560 -160 0 0 {name=p1 lab=phi1}
C {devices/ipin.sym} -570 -30 0 0 {name=p2 lab=phi1_b}
C {tg_hv.sym} -230 -100 0 0 {name=x2}
C {tg_hv.sym} -540 -100 0 0 {name=x1}
C {sg13g2_pr/cap_cmim.sym} 390 0 0 1 {name=C2
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {tg_hv.sym} 240 -100 0 0 {name=x3}
C {tg_hv.sym} 540 -100 0 0 {name=x4}
C {tg_hv.sym} -540 100 0 0 {name=x5}
C {tg_hv.sym} -230 100 0 0 {name=x6}
C {tg_hv.sym} 240 100 0 0 {name=x7}
C {tg_hv.sym} 540 100 0 0 {name=x8}
C {devices/iopin.sym} -610 -100 0 1 {name=p20 lab=vcm}
C {lab_wire.sym} -630 40 0 1 {name=p3 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -320 40 0 1 {name=p4 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 450 40 0 1 {name=p12 sig_type=std_logic lab=phi1}
C {lab_wire.sym} -630 170 0 1 {name=p13 sig_type=std_logic lab=phi1_b}
C {lab_wire.sym} -320 170 0 1 {name=p14 sig_type=std_logic lab=phi2_b}
C {lab_wire.sym} 450 170 0 1 {name=p16 sig_type=std_logic lab=phi1_b}
C {lab_wire.sym} 450 -30 0 1 {name=p19 sig_type=std_logic lab=phi1_b}
C {lab_wire.sym} 150 -160 0 1 {name=p17 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 450 -160 0 1 {name=p21 sig_type=std_logic lab=phi1}
C {devices/ipin.sym} -260 -160 0 0 {name=p22 lab=phi2}
C {devices/ipin.sym} -260 -30 0 0 {name=p23 lab=phi2_b}
C {devices/iopin.sym} -610 100 0 1 {name=p10 lab=vbiasn}
C {sg13g2_pr/cap_cmim.sym} 110 0 0 1 {name=C4
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {lab_wire.sym} 150 40 0 1 {name=p7 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 150 170 0 1 {name=p11 sig_type=std_logic lab=phi2_b}
C {lab_wire.sym} 150 -30 0 1 {name=p15 sig_type=std_logic lab=phi2_b}
