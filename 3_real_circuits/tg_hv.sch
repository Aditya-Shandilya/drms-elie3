v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 110 0 130 0 {lab=ENB}
N -130 0 -110 0 {lab=EN}
N 70 -40 70 -30 {lab=a}
N -70 -40 -70 -30 {lab=a}
N -70 0 -10 0 {lab=GND}
N -70 -40 70 -40 {lab=a}
N -130 -40 -70 -40 {lab=a}
N -70 30 -70 40 {lab=b}
N -70 40 70 40 {lab=b}
N 70 30 70 40 {lab=b}
N -130 40 -70 40 {lab=b}
N -10 0 -10 80 {lab=GND}
N 10 0 70 0 {lab=vdd}
N 10 -80 10 0 {lab=vdd}
C {sg13g2_pr/sg13_hv_pmos.sym} 90 0 2 0 {name=M2
l=0.45u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -90 0 0 0 {name=M1
l=0.45u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {devices/ipin.sym} 130 0 2 0 {name=p1 lab=ENB}
C {devices/ipin.sym} -130 0 0 0 {name=p2 lab=EN}
C {devices/iopin.sym} -130 40 0 1 {name=p3 lab=b}
C {devices/iopin.sym} -130 -40 0 1 {name=p4 lab=a}
C {vdd.sym} 10 -80 0 0 {name=l1 lab=VDD}
C {gnd.sym} -10 80 0 0 {name=l2 lab=GND}
