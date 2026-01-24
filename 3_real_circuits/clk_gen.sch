v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -260 -20 -110 -20 {lab=CK}
N -260 260 -240 260 {lab=CK}
N -260 -20 -260 260 {lab=CK}
N -290 -20 -260 -20 {lab=CK}
N -130 20 -110 20 {lab=#net1}
N -130 20 -130 80 {lab=#net1}
N -130 80 -0 80 {lab=#net1}
N -130 150 -0 150 {lab=#net2}
N -130 150 -130 220 {lab=#net2}
N -130 220 -110 220 {lab=#net2}
N -160 260 -110 260 {lab=#net3}
N 30 240 50 240 {lab=#net4}
N 30 280 280 280 {lab=#net4}
N 30 240 30 280 {lab=#net4}
N 10 240 30 240 {lab=#net4}
N 400 260 430 260 {lab=#net5}
N 150 240 170 240 {lab=#net6}
N 150 340 430 340 {lab=#net6}
N 150 240 150 340 {lab=#net6}
N 130 240 150 240 {lab=#net6}
N 250 240 280 240 {lab=#net7}
N 80 150 440 150 {lab=phi1_d}
N 30 -0 50 -0 {lab=#net8}
N 30 -40 290 -40 {lab=#net8}
N 150 -120 150 0 {lab=#net9}
N 130 0 150 0 {lab=#net9}
N 150 0 170 0 {lab=#net9}
N 30 -40 30 -0 {lab=#net8}
N 10 -0 30 -0 {lab=#net8}
N 150 -120 430 -120 {lab=#net9}
N 410 -20 430 -20 {lab=#net10}
N 510 340 550 340 {lab=phi2}
N 530 260 550 260 {lab=phi2_d}
N 530 -20 550 -20 {lab=phi1_d}
N 510 -120 550 -120 {lab=phi1}
N 250 -0 290 -0 {lab=#net11}
N 80 80 440 80 {lab=phi2_d}
N 440 80 530 220 {lab=phi2_d}
N 530 220 530 260 {lab=phi2_d}
N 510 260 530 260 {lab=phi2_d}
N 530 -20 530 30 {lab=phi1_d}
N 510 -20 530 -20 {lab=phi1_d}
N 440 150 530 30 {lab=phi1_d}
C {sg13g2_stdcells/sg13g2_nand2_1.sym} -50 0 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_nand2_1.sym} -50 240 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_nand2_1.sym} 350 -20 0 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_nand2_1.sym} 340 260 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} -200 260 0 0 {name=x5 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 40 150 0 1 {name=x6 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 40 80 0 1 {name=x7 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 90 240 0 0 {name=x8 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 210 240 0 0 {name=x9 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 90 0 0 0 {name=x10 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 210 0 0 0 {name=x11 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {ipin.sym} -290 -20 0 0 {name=p1 lab=CK}
C {sg13g2_stdcells/sg13g2_buf_1.sym} 470 -120 0 0 {name=x12 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_buf_1.sym} 470 -20 0 0 {name=x13 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_buf_1.sym} 470 260 0 0 {name=x14 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_buf_1.sym} 470 340 0 0 {name=x15 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {opin.sym} 550 -120 0 0 {name=p2 lab=phi1}
C {opin.sym} 550 -20 0 0 {name=p3 lab=phi1_d}
C {opin.sym} 550 260 0 0 {name=p4 lab=phi2_d}
C {opin.sym} 550 340 0 0 {name=p5 lab=phi2}
