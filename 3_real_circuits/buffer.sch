v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 0 0 20 {lab=#net1}
N -70 -50 -40 -50 {lab=A}
N -70 0 -70 50 {lab=A}
N -70 50 -40 50 {lab=A}
N 0 0 140 -0 {lab=#net1}
N 0 -20 0 0 {lab=#net1}
N -90 0 -70 0 {lab=A}
N -70 -50 -70 0 {lab=A}
N 0 90 0 100 {lab=GND}
N 210 0 210 20 {lab=X}
N 210 90 210 100 {lab=GND}
N 140 -50 170 -50 {lab=#net1}
N 140 -0 140 50 {lab=#net1}
N 140 50 170 50 {lab=#net1}
N 140 -50 140 -0 {lab=#net1}
N -0 -120 0 -80 {lab=VDD}
N 210 -120 210 -80 {lab=VDD}
N 210 0 240 0 {lab=X}
N 210 -20 210 0 {lab=X}
N -0 -50 90 -50 {lab=VDD}
N 90 -120 90 -50 {lab=VDD}
N 90 -120 210 -120 {lab=VDD}
N -0 -120 90 -120 {lab=VDD}
N 0 50 90 50 {lab=GND}
N 90 50 90 90 {lab=GND}
N 0 90 90 90 {lab=GND}
N 0 80 0 90 {lab=GND}
N 210 50 300 50 {lab=GND}
N 300 50 300 90 {lab=GND}
N 210 90 300 90 {lab=GND}
N 210 80 210 90 {lab=GND}
N 210 -50 300 -50 {lab=VDD}
N 300 -120 300 -50 {lab=VDD}
N 210 -120 300 -120 {lab=VDD}
C {sg13g2_pr/sg13_hv_nmos.sym} -20 50 0 0 {name=M2
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -20 -50 0 0 {name=M1
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {ipin.sym} -90 0 0 0 {name=p2 lab=A}
C {gnd.sym} 0 100 0 0 {name=l1 lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} 190 50 0 0 {name=M3
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 190 -50 0 0 {name=M4
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {gnd.sym} 210 100 0 0 {name=l2 lab=GND}
C {opin.sym} 240 0 0 0 {name=p1 lab=X}
C {vdd.sym} 130 -120 0 0 {name=l3 lab=VDD}
