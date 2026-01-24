v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 110 0 130 0 {lab=phi_b}
N -130 0 -110 0 {lab=phi}
N 70 -40 70 -30 {lab=a}
N -70 -40 -70 -30 {lab=a}
N -70 0 -10 0 {lab=vss}
N -70 -40 70 -40 {lab=a}
N -130 -40 -70 -40 {lab=a}
N -70 30 -70 40 {lab=b}
N -70 40 70 40 {lab=b}
N 70 30 70 40 {lab=b}
N -130 40 -70 40 {lab=b}
N -10 0 -10 80 {lab=vss}
N -130 80 -10 80 {lab=vss}
N 10 0 70 0 {lab=vdd}
N 10 -80 10 0 {lab=vdd}
N -130 -80 10 -80 {lab=vdd}
C {sg13g2_pr/sg13_hv_pmos.sym} 90 0 2 0 {name=M2
l=0.45u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -90 0 0 0 {name=M1
l=0.45u
w=5u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {devices/ipin.sym} 130 0 2 0 {name=p4 lab=phi_b
}
C {devices/ipin.sym} -130 0 0 0 {name=p3 lab=phi}
C {devices/ipin.sym} -130 -40 2 1 {name=p1 lab=a pinnumber=1
}
C {devices/ipin.sym} -130 -80 0 0 {name=p5 lab=vdd}
C {devices/iopin.sym} -130 80 0 1 {name=p6 lab=vss}
C {devices/iopin.sym} -130 40 0 1 {name=p2 lab=b}
