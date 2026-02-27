v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 -0 0 20 {lab=Y}
N -70 -50 -40 -50 {lab=A}
N -70 -0 -70 50 {lab=A}
N -70 50 -40 50 {lab=A}
N 0 -0 40 -0 {lab=Y}
N -0 -20 0 -0 {lab=Y}
N -90 -0 -70 -0 {lab=A}
N -70 -50 -70 -0 {lab=A}
N 0 90 -0 100 {lab=GND}
N 0 -90 -0 -80 {lab=VDD}
N 90 -90 90 -50 {lab=VDD}
N 0 -90 90 -90 {lab=VDD}
N 0 -100 0 -90 {lab=VDD}
N -0 50 90 50 {lab=GND}
N 90 50 90 90 {lab=GND}
N 0 90 90 90 {lab=GND}
N -0 80 0 90 {lab=GND}
N -0 -50 90 -50 {lab=VDD}
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
C {opin.sym} 40 0 0 0 {name=p1 lab=Y}
C {ipin.sym} -90 0 0 0 {name=p2 lab=A}
C {gnd.sym} 0 100 0 0 {name=l1 lab=GND}
C {vdd.sym} 0 -100 0 0 {name=l2 lab=VDD}
