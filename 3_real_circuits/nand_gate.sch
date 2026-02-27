v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 140 -20 140 -0 {lab=Y}
N 140 60 140 90 {lab=#net1}
N -0 -40 -0 -20 {lab=Y}
N 0 -20 140 -20 {lab=Y}
N 140 -40 140 -20 {lab=Y}
N 140 -20 210 -20 {lab=Y}
N 0 -130 -0 -100 {lab=VDD}
N 140 -130 140 -100 {lab=VDD}
N 90 30 100 30 {lab=A}
N -70 -70 -40 -70 {lab=B}
N -70 -70 -70 120 {lab=B}
N -70 120 100 120 {lab=B}
N -140 120 -70 120 {lab=B}
N 140 160 140 170 {lab=GND}
N 90 -70 100 -70 {lab=A}
N 90 -70 90 30 {lab=A}
N -140 30 90 30 {lab=A}
N -0 -70 70 -70 {lab=VDD}
N 70 -130 140 -130 {lab=VDD}
N 70 -130 70 -70 {lab=VDD}
N -0 -130 70 -130 {lab=VDD}
N 140 -70 210 -70 {lab=VDD}
N 210 -130 210 -70 {lab=VDD}
N 140 -130 210 -130 {lab=VDD}
N 140 30 240 30 {lab=GND}
N 240 120 240 160 {lab=GND}
N 140 160 240 160 {lab=GND}
N 140 150 140 160 {lab=GND}
N 140 120 240 120 {lab=GND}
N 240 30 240 120 {lab=GND}
C {gnd.sym} 140 170 0 0 {name=l1 lab=GND}
C {vdd.sym} 70 -130 0 0 {name=l2 lab=VDD}
C {ipin.sym} -140 30 0 0 {name=p1 lab=A}
C {ipin.sym} -140 120 0 0 {name=p2 lab=B}
C {opin.sym} 210 -20 0 0 {name=p3 lab=Y}
C {sg13g2_pr/sg13_hv_pmos.sym} -20 -70 0 0 {name=M1
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 120 -70 0 0 {name=M2
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 120 30 0 0 {name=M3
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 120 120 0 0 {name=M4
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
