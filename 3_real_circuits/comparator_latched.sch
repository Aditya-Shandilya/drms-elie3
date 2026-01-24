v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 290 -220 290 -200 {lab=#net1}
N 470 -220 470 -200 {lab=#net1}
N 290 -200 470 -200 {lab=#net1}
N 190 -200 250 -250 {lab=#net2}
N 180 -250 250 -200 {lab=#net1}
N 250 -200 290 -200 {lab=#net1}
N 140 -200 190 -200 {lab=#net2}
N 140 -220 140 -200 {lab=#net2}
N -40 -220 -40 -200 {lab=#net2}
N -40 -200 140 -200 {lab=#net2}
N 140 -40 140 -10 {lab=outn}
N 290 -40 290 -10 {lab=outp}
N 470 -40 470 -10 {lab=outp}
N 290 -40 470 -40 {lab=outp}
N -40 -40 -40 -10 {lab=outn}
N -40 -40 140 -40 {lab=outn}
N -40 50 -40 70 {lab=vss}
N 380 70 470 70 {lab=vss}
N 470 50 470 70 {lab=vss}
N 290 50 290 70 {lab=vss}
N 140 70 290 70 {lab=vss}
N 140 50 140 70 {lab=vss}
N 50 70 140 70 {lab=vss}
N 180 20 200 20 {lab=outp}
N 200 20 260 -40 {lab=outp}
N 260 -40 290 -40 {lab=outp}
N 230 20 250 20 {lab=outn}
N 170 -40 230 20 {lab=outn}
N 140 -40 170 -40 {lab=outn}
N -40 -300 -40 -280 {lab=vdd}
N 380 -300 470 -300 {lab=vdd}
N 470 -300 470 -280 {lab=vdd}
N 140 -300 140 -280 {lab=vdd}
N 290 -300 290 -280 {lab=vdd}
N 140 -300 290 -300 {lab=vdd}
N -90 -250 -80 -250 {lab=inp}
N -90 -300 -40 -300 {lab=vdd}
N -40 -250 50 -250 {lab=vdd}
N 50 -300 140 -300 {lab=vdd}
N 50 -300 50 -250 {lab=vdd}
N -40 -300 50 -300 {lab=vdd}
N 50 -250 140 -250 {lab=vdd}
N 290 -250 380 -250 {lab=vdd}
N 380 -300 380 -250 {lab=vdd}
N 290 -300 380 -300 {lab=vdd}
N 380 -250 470 -250 {lab=vdd}
N 510 -250 520 -250 {lab=inn}
N 140 -70 140 -40 {lab=outn}
N 290 -70 290 -40 {lab=outp}
N 290 -70 520 -70 {lab=outp}
N 290 -100 290 -70 {lab=outp}
N 140 -100 140 -70 {lab=outn}
N 140 -200 140 -160 {lab=#net2}
N -90 -180 220 -180 {lab=phi2_b}
N 220 -130 250 -130 {lab=phi2_b}
N 220 -180 220 -130 {lab=phi2_b}
N 180 -130 220 -130 {lab=phi2_b}
N 290 -200 290 -160 {lab=#net1}
N -90 20 -80 20 {lab=phi2}
N -40 20 50 20 {lab=vss}
N 50 20 50 70 {lab=vss}
N -40 70 50 70 {lab=vss}
N 50 20 140 20 {lab=vss}
N 290 20 380 20 {lab=vss}
N 380 20 380 70 {lab=vss}
N 290 70 380 70 {lab=vss}
N 380 20 470 20 {lab=vss}
N -90 70 -40 70 {lab=vss}
N 50 -130 140 -130 {lab=vss}
N 50 -130 50 20 {lab=vss}
N 290 -130 380 -130 {lab=vss}
N 380 -130 380 20 {lab=vss}
N -90 -70 140 -70 {lab=outn}
N 510 20 520 20 {lab=phi2}
C {sg13g2_pr/sg13_hv_nmos.sym} -60 20 0 0 {name=M9
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 160 20 0 1 {name=M7
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 270 20 0 0 {name=M8
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 490 20 0 1 {name=M10
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 160 -130 0 1 {name=M5
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 270 -130 0 0 {name=M6
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -60 -250 0 0 {name=M1
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 160 -250 0 1 {name=M3
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 270 -250 0 0 {name=M4
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 490 -250 0 1 {name=M2
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {ipin.sym} -90 -250 0 0 {name=p1 lab=inp}
C {devices/ipin.sym} -90 -300 0 0 {name=p2 lab=vdd}
C {devices/ipin.sym} 520 -250 0 1 {name=p5 lab=inn}
C {devices/opin.sym} 520 -70 0 0 {name=p3 lab=outp}
C {devices/opin.sym} -90 -70 0 1 {name=p6 lab=outn}
C {ipin.sym} -90 -180 0 0 {name=p4 lab=phi2_b}
C {ipin.sym} -90 20 0 0 {name=p7 lab=phi2}
C {lab_pin.sym} 520 20 0 1 {name=p8 sig_type=std_logic lab=phi2}
C {devices/iopin.sym} -90 70 0 1 {name=p15 lab=vss}
