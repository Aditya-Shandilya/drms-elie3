v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -320 -80 -320 -30 {lab=#net1}
N -320 -80 -130 -80 {lab=#net1}
N -130 -80 -130 -30 {lab=#net1}
N -320 30 -320 70 {lab=#net2}
N -320 70 -130 70 {lab=#net2}
N -130 30 -130 70 {lab=#net2}
N 120 -80 120 -30 {lab=#net3}
N 120 -80 310 -80 {lab=#net3}
N 310 -80 310 -30 {lab=#net3}
N 120 30 120 70 {lab=#net4}
N 120 70 310 70 {lab=#net4}
N 310 30 310 70 {lab=#net4}
N 80 -220 80 -0 {lab=#net5}
N -90 -250 -90 -0 {lab=#net6}
N -320 -500 -320 -440 {lab=#net7}
N -320 -500 -150 -500 {lab=#net7}
N -150 -500 -150 -440 {lab=#net7}
N -320 -380 -320 -320 {lab=#net8}
N -320 -320 -150 -320 {lab=#net8}
N -150 -380 -150 -320 {lab=#net8}
N 110 -500 110 -440 {lab=#net7}
N 110 -500 280 -500 {lab=#net7}
N 280 -500 280 -440 {lab=#net7}
N 110 -380 110 -320 {lab=#net8}
N 110 -320 280 -320 {lab=#net8}
N 280 -380 280 -320 {lab=#net8}
C {sg13g2_pr/sg13_hv_nmos.sym} -340 0 0 0 {name=M1
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -110 0 0 1 {name=M2
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 100 0 0 0 {name=M3
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 330 0 0 1 {name=M4
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 60 -250 0 0 {name=M5
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -110 -250 0 1 {name=M6
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -340 -410 0 0 {name=M7
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -130 -410 0 1 {name=M8
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 90 -410 0 0 {name=M9
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 300 -410 0 1 {name=M10
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
