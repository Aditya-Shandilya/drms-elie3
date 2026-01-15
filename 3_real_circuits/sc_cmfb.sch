v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 500 -40 620 -40 {lab=n4}
N 130 60 500 60 {lab=vcm_samp}
N 130 40 130 60 {lab=vcm_samp}
N -170 60 130 60 {lab=vcm_samp}
N 130 -40 130 -20 {lab=n1}
N -170 40 -170 60 {lab=vcm_samp}
N -540 60 -170 60 {lab=vcm_samp}
N -540 40 -540 60 {lab=vcm_samp}
N -540 -40 -540 -20 {lab=vcm}
N 500 40 500 60 {lab=vcm_samp}
N 500 -40 500 -20 {lab=n4}
N -810 -40 -790 -40 {lab=vcm}
N 790 -40 810 -40 {lab=vcm}
N -700 40 -700 80 {lab=vss}
N 710 40 710 80 {lab=vss}
N -340 40 -340 80 {lab=vss}
N 340 40 340 80 {lab=vss}
N -700 -90 -700 -70 {lab=vcm}
N 340 -90 710 -90 {lab=vcm}
N 710 -90 710 -70 {lab=vcm}
N -810 -90 -700 -90 {lab=vcm}
N -810 -20 -790 -20 {lab=#net1}
N -810 0 -790 0 {lab=#net2}
N 220 -20 250 -20 {lab=#net3}
N 220 -0 250 0 {lab=#net4}
N -440 -20 -430 -20 {lab=#net5}
N -440 -0 -430 -0 {lab=#net6}
N 590 -20 620 -20 {lab=#net7}
N 590 -0 620 0 {lab=#net8}
N -340 -90 -340 -70 {lab=vcm}
N -700 -90 -340 -90 {lab=vcm}
N 340 -90 340 -70 {lab=vcm}
N -340 -90 340 -90 {lab=vcm}
N -620 -40 -540 -40 {lab=vcm}
N -450 -40 -430 -40 {lab=von}
N 130 -40 250 -40 {lab=n1}
N -260 -40 -170 -40 {lab=vcm}
N -170 -40 -170 -20 {lab=vcm}
N -540 60 -540 170 {lab=vcm_samp}
N -620 170 -540 170 {lab=vcm_samp}
N -170 60 -170 170 {lab=vcm_samp}
N -260 170 -170 170 {lab=vcm_samp}
N 500 60 500 170 {lab=vcm_samp}
N 420 170 500 170 {lab=vcm_samp}
N 790 180 820 180 {lab=vcm_samp}
N -810 170 -790 170 {lab=bias1}
N -440 170 -430 170 {lab=n2}
N 230 170 250 170 {lab=n1}
N 600 180 620 180 {lab=n4}
N -700 80 -340 80 {lab=vss}
N -340 80 340 80 {lab=vss}
N 340 80 710 80 {lab=vss}
N 340 120 340 140 {lab=vcm_samp}
N 340 120 710 120 {lab=vcm_samp}
N 710 120 710 150 {lab=vcm_samp}
N -340 120 340 120 {lab=vcm_samp}
N -700 120 -700 140 {lab=vcm_samp}
N -340 120 -340 140 {lab=vcm_samp}
N -700 120 -340 120 {lab=vcm_samp}
N -700 250 -700 270 {lab=vss}
N 340 270 710 270 {lab=vss}
N 710 260 710 270 {lab=vss}
N 340 250 340 270 {lab=vss}
N -340 270 340 270 {lab=vss}
N -340 250 -340 270 {lab=vss}
N -700 270 -340 270 {lab=vss}
N -840 270 -700 270 {lab=vss}
N -840 80 -700 80 {lab=vss}
N -840 80 -840 270 {lab=vss}
N -870 270 -840 270 {lab=vss}
N -810 190 -790 190 {lab=#net9}
N -810 210 -790 210 {lab=#net10}
C {sg13g2_pr/cap_cmim.sym} -540 10 0 0 {name=C1
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 130 10 0 0 {name=C2
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} -170 10 0 0 {name=C5
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 500 10 0 0 {name=C6
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {devices/ipin.sym} -810 -40 0 0 {name=p20 lab=vcm}
C {lab_wire.sym} 810 -40 0 1 {name=p21 sig_type=std_logic lab=vcm}
C {devices/ipin.sym} -810 -90 0 0 {name=p23 lab=vdd}
C {lab_wire.sym} -170 -40 0 0 {name=p12 sig_type=std_logic lab=n2}
C {lab_wire.sym} 130 -40 0 0 {name=p13 sig_type=std_logic lab=n1}
C {lab_wire.sym} -540 -40 0 0 {name=p14 sig_type=std_logic lab=n3}
C {devices/ipin.sym} -450 -40 0 0 {name=p7 lab=von}
C {lab_wire.sym} 500 -40 0 0 {name=p15 sig_type=std_logic lab=n4}
C {devices/ipin.sym} 420 -40 0 1 {name=p2 lab=vop}
C {tg_hv.sym} -700 -20 0 0 {name=x4}
C {tg_hv.sym} -340 -20 0 0 {name=x1}
C {tg_hv.sym} 340 -20 0 0 {name=x2}
C {tg_hv.sym} 710 -20 0 0 {name=x3}
C {lab_wire.sym} 0 60 0 0 {name=p16 sig_type=std_logic lab=vcm_samp}
C {tg_hv.sym} -700 190 0 0 {name=x5}
C {tg_hv.sym} -340 190 0 0 {name=x6}
C {tg_hv.sym} 340 190 0 0 {name=x7}
C {tg_hv.sym} 710 200 0 0 {name=x8}
C {lab_wire.sym} 820 180 0 1 {name=p1 sig_type=std_logic lab=bias2}
C {lab_wire.sym} -440 170 0 0 {name=p18 sig_type=std_logic lab=n2}
C {lab_wire.sym} 230 170 0 0 {name=p19 sig_type=std_logic lab=n1}
C {lab_wire.sym} 600 180 0 0 {name=p24 sig_type=std_logic lab=n4}
C {devices/iopin.sym} -870 270 0 1 {name=p22 lab=vss}
C {devices/ipin.sym} -810 170 0 0 {name=p3 lab=bias1}
