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
N -0 -290 140 -290 {lab=vbias_p_src}
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
N 0 -400 -0 -290 {lab=vbias_p_src}
N -140 -290 -0 -290 {lab=vbias_p_src}
N -90 70 140 70 {lab=vbias_n_casc}
N -270 70 -180 70 {lab=vss}
N -270 70 -270 170 {lab=vss}
N -320 20 -90 20 {lab=vbias_n_casc}
N -90 20 -90 70 {lab=vbias_n_casc}
N -140 70 -90 70 {lab=vbias_n_casc}
N -320 -340 -270 -340 {lab=vdd}
N -320 -400 -0 -400 {lab=vbias_p_src}
N -90 -220 -90 -80 {lab=#net5}
N -180 -220 -90 -220 {lab=#net5}
N -180 -260 -180 -220 {lab=#net5}
N -320 -240 -0 -240 {lab=vbias_p_casc}
N 0 -240 0 -170 {lab=vbias_p_casc}
N -140 -170 0 -170 {lab=vbias_p_casc}
N -140 170 -120 170 {lab=vbias_n_sink}
N -120 120 110 120 {lab=vbias_n_sink}
N -120 120 -120 170 {lab=vbias_n_sink}
N -120 170 -40 170 {lab=vbias_n_sink}
N -320 120 -120 120 {lab=vbias_n_sink}
C {devices/ipin.sym} -320 -50 0 0 {name=p7 lab=inp}
C {devices/ipin.sym} 260 -50 0 1 {name=p5 lab=inn}
C {devices/iopin.sym} -320 220 0 1 {name=p15 lab=vss}
C {devices/ipin.sym} -320 -340 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} -320 -100 0 1 {name=p6 lab=outn}
C {devices/opin.sym} 260 -100 0 0 {name=p2 lab=outp}
C {devices/ipin.sym} -320 20 0 0 {name=p4 lab=vbias_n_casc}
C {devices/ipin.sym} -320 -240 0 0 {name=p8 lab=vbias_p_casc}
C {devices/ipin.sym} -320 -400 0 0 {name=p9 lab=vbias_p_src}
C {devices/ipin.sym} -320 120 0 0 {name=p3 lab=vbias_n_sink}
C {sg13g2_pr/sg13_hv_nmos.sym} -110 -50 0 0 {name=M1
l=1u
w=3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -160 -290 0 1 {name=M10
l=1u
w=12.1u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -160 -170 0 1 {name=M8
l=1u
w=6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 160 -290 0 0 {name=M11
l=1u
w=12.1u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 160 -170 0 0 {name=M9
l=1u
w=6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 160 70 0 0 {name=M7
l=1u
w=1.7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 160 170 0 0 {name=M5
l=1u
w=1.7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -160 170 0 1 {name=M4
l=1u
w=1.7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -160 70 0 1 {name=M6
l=1u
w=1.7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 110 -50 0 1 {name=M2
l=1u
w=3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -20 170 0 0 {name=M3
l=1.5u
w=4.9u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/annotate_fet_params.sym} 340 -340 0 0 {name=annot4 ref=M10}
C {sg13g2_pr/annotate_fet_params.sym} 460 -340 0 0 {name=annot1 ref=M10}
C {sg13g2_pr/annotate_fet_params.sym} 340 -210 0 0 {name=annot2 ref=M8}
C {sg13g2_pr/annotate_fet_params.sym} 460 -210 0 0 {name=annot3 ref=M9}
C {sg13g2_pr/annotate_fet_params.sym} 340 -80 0 0 {name=annot5 ref=M1}
C {sg13g2_pr/annotate_fet_params.sym} 460 -80 0 0 {name=annot6 ref=M2}
C {sg13g2_pr/annotate_fet_params.sym} 340 50 0 0 {name=annot7 ref=M6}
C {sg13g2_pr/annotate_fet_params.sym} 460 50 0 0 {name=annot8 ref=M7}
C {sg13g2_pr/annotate_fet_params.sym} 340 180 0 0 {name=annot9 ref=M4}
C {sg13g2_pr/annotate_fet_params.sym} 460 180 0 0 {name=annot10 ref=M3}
C {sg13g2_pr/annotate_fet_params.sym} 580 180 0 0 {name=annot11 ref=M5}
C {ngspice_probe.sym} -180 -220 0 0 {name=r1}
C {ngspice_probe.sym} 0 0 0 0 {name=r2}
C {ngspice_probe.sym} 180 -230 0 0 {name=r3}
C {ngspice_probe.sym} -180 110 0 0 {name=r4}
C {ngspice_probe.sym} 180 120 0 0 {name=r5}
