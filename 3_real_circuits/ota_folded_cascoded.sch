v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -90 -20 -90 -0 {lab=#net1}
N -0 0 90 -0 {lab=#net1}
N 90 -20 90 -0 {lab=#net1}
N 130 -50 260 -50 {lab=inn}
N -0 0 0 140 {lab=#net1}
N -90 -0 -0 0 {lab=#net1}
N -180 100 -180 140 {lab=#net2}
N 180 100 180 140 {lab=#net3}
N -180 200 -180 220 {lab=vss}
N -0 200 0 220 {lab=vss}
N 180 200 180 220 {lab=vss}
N 90 220 180 220 {lab=vss}
N -180 -100 -180 40 {lab=outn}
N 180 -100 180 40 {lab=outp}
N 180 -230 180 -200 {lab=#net4}
N -180 -340 -180 -320 {lab=vdd}
N -180 -340 180 -340 {lab=vdd}
N 180 -340 180 -320 {lab=vdd}
N -320 -50 -130 -50 {lab=inp}
N -50 220 -0 220 {lab=vss}
N -270 220 -180 220 {lab=vss}
N -180 -220 -180 -200 {lab=#net5}
N 90 -230 90 -80 {lab=#net4}
N 90 -230 180 -230 {lab=#net4}
N 180 -260 180 -230 {lab=#net4}
N -270 -340 -180 -340 {lab=vdd}
N -320 -100 -180 -100 {lab=outn}
N -180 -140 -180 -100 {lab=outn}
N 180 -100 260 -100 {lab=outp}
N 180 -140 180 -100 {lab=outp}
N -270 170 -180 170 {lab=vss}
N -270 170 -270 220 {lab=vss}
N -320 220 -270 220 {lab=vss}
N 50 170 90 170 {lab=vss}
N 90 170 90 220 {lab=vss}
N 0 220 90 220 {lab=vss}
N 180 170 270 170 {lab=vss}
N 270 170 270 220 {lab=vss}
N 180 220 270 220 {lab=vss}
N 180 70 270 70 {lab=vss}
N 270 70 270 170 {lab=vss}
N 180 -170 270 -170 {lab=vdd}
N 270 -290 270 -170 {lab=vdd}
N 180 -340 270 -340 {lab=vdd}
N -270 -170 -180 -170 {lab=vdd}
N -0 -290 140 -290 {lab=bias4}
N -270 -290 -270 -170 {lab=vdd}
N -270 -290 -180 -290 {lab=vdd}
N -270 -340 -270 -290 {lab=vdd}
N 180 -290 270 -290 {lab=vdd}
N 270 -340 270 -290 {lab=vdd}
N -90 -50 -50 -50 {lab=vss}
N -50 -50 -50 220 {lab=vss}
N -180 220 -50 220 {lab=vss}
N 50 -50 90 -50 {lab=vss}
N 50 -50 50 170 {lab=vss}
N -0 170 50 170 {lab=vss}
N 110 170 140 170 {lab=vbias_n_sink}
N 110 120 110 170 {lab=vbias_n_sink}
N 0 -170 140 -170 {lab=vbias_p_casc}
N 0 -400 -0 -290 {lab=bias4}
N -140 -290 -0 -290 {lab=bias4}
N -90 70 140 70 {lab=vbias_n_casc}
N -270 70 -180 70 {lab=vss}
N -270 70 -270 170 {lab=vss}
N -320 20 -90 20 {lab=vbias_n_casc}
N -90 20 -90 70 {lab=vbias_n_casc}
N -140 70 -90 70 {lab=vbias_n_casc}
N -320 -340 -270 -340 {lab=vdd}
N -320 -400 -0 -400 {lab=bias4}
N -90 -220 -90 -80 {lab=#net5}
N -180 -220 -90 -220 {lab=#net5}
N -180 -260 -180 -220 {lab=#net5}
N -320 -240 -0 -240 {lab=vbias_p_casc}
N 0 -240 0 -170 {lab=vbias_p_casc}
N -140 -170 0 -170 {lab=vbias_p_casc}
N -140 170 -120 170 {lab=vbias_n_sink}
N -120 150 -120 170 {lab=vbias_n_sink}
N -120 150 -70 150 {lab=vbias_n_sink}
N -70 120 -70 150 {lab=vbias_n_sink}
N -70 120 110 120 {lab=vbias_n_sink}
N -90 170 -40 170 {lab=vbias_n_tail}
N -90 120 -90 170 {lab=vbias_n_tail}
N 110 120 320 120 {lab=vbias_n_sink}
N -320 120 -90 120 {lab=vbias_n_tail}
C {devices/ipin.sym} -320 -50 0 0 {name=p7 lab=inp}
C {devices/ipin.sym} 260 -50 0 1 {name=p5 lab=inn}
C {sg13g2_pr/sg13_lv_nmos.sym} -110 -50 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 110 -50 0 1 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 170 0 0 {name=M3
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -160 70 0 1 {name=M6
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -160 170 0 1 {name=M4
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 160 70 0 0 {name=M7
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 160 170 0 0 {name=M5
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 160 -170 0 0 {name=M9
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -160 -170 0 1 {name=M8
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -160 -290 0 1 {name=M10
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 160 -290 0 0 {name=M11
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/iopin.sym} -320 220 0 1 {name=p15 lab=vss}
C {devices/ipin.sym} -320 -340 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} -320 -100 0 1 {name=p6 lab=outn}
C {devices/opin.sym} 260 -100 0 0 {name=p2 lab=outp}
C {devices/ipin.sym} -320 20 0 0 {name=p4 lab=vbias_n_casc}
C {devices/ipin.sym} -320 -240 0 0 {name=p8 lab=vbias_p_casc}
C {devices/ipin.sym} -320 -400 0 0 {name=p9 lab=vbias_p_src}
C {devices/ipin.sym} 320 120 0 1 {name=p3 lab=vbias_n_sink}
C {devices/ipin.sym} -320 120 0 0 {name=p10 lab=vbias_n_tail}
