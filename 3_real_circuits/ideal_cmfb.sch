v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -180 30 -180 40 {lab=vss}
N 0 40 180 40 {lab=vss}
N 180 30 180 40 {lab=vss}
N -0 30 0 40 {lab=vss}
N -180 40 0 40 {lab=vss}
N 180 -60 180 -30 {lab=vctrl}
N 0 -60 -0 -30 {lab=verr}
N -180 -60 -180 -30 {lab=voc}
N -210 40 -180 40 {lab=vss}
N -280 -20 -270 -20 {lab=vcm_ref}
N -280 -50 -270 -50 {lab=von}
N -280 -80 -270 -80 {lab=vop}
C {bsource.sym} -180 0 0 0 {name=B1 VAR=V FUNC="(V(vop)+V(von))/2" m=1}
C {bsource.sym} 0 0 0 0 {name=B2 VAR=V FUNC="V(vcm_ref) - V(voc)" m=1}
C {bsource.sym} 180 0 0 0 {name=B3 VAR=I FUNC="\{Gcmfb\}*V(verr)" m=1}
C {opin.sym} 180 -60 0 0 {name=p3 lab=vctrl}
C {ipin.sym} -280 -80 0 0 {name=p4 lab=vop}
C {ipin.sym} -280 -50 0 0 {name=p5 lab=von}
C {ipin.sym} -280 -20 0 0 {name=p6 lab=vcm_ref}
C {iopin.sym} -210 40 0 1 {name=p7 lab=vss}
C {lab_pin.sym} -180 -60 0 0 {name=p8 sig_type=std_logic lab=voc}
C {lab_pin.sym} 0 -60 0 0 {name=p1 sig_type=std_logic lab=verr}
C {noconn.sym} -270 -80 0 1 {name=l1}
C {noconn.sym} -270 -50 0 1 {name=l2}
C {noconn.sym} -270 -20 0 1 {name=l3}
