v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -110 -70 -60 -70 {lab=#net1}
N -80 -30 -60 -30 {lab=#net2}
N -80 -30 -80 -0 {lab=#net2}
N -80 0 80 -0 {lab=#net2}
N 80 0 80 80 {lab=#net2}
N 60 80 80 80 {lab=#net2}
N 60 -50 60 20 {lab=Q}
N -80 20 60 20 {lab=Q}
N -80 20 -80 60 {lab=Q}
N -80 60 -60 60 {lab=Q}
N -110 100 -60 100 {lab=#net3}
N -200 -70 -190 -70 {lab=S}
N -200 100 -190 100 {lab=R}
N 60 -50 70 -50 {lab=Q}
C {sg13g2_stdcells/sg13g2_nand2_1.sym} 0 -50 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_nand2_1.sym} 0 80 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} -150 -70 0 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} -150 100 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {devices/ipin.sym} -200 -70 0 0 {name=p29 lab=S}
C {devices/ipin.sym} -200 100 0 0 {name=p1 lab=R}
C {opin.sym} 70 -50 0 0 {name=p2 lab=Q}
