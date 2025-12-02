v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 90 -40 150 -40 {lab=inn}
N 90 -80 150 -80 {lab=inp}
N 190 -110 260 -110 {lab=out}
N 190 -110 190 -90 {lab=out}
N 190 -30 190 -20 {lab=GND}
N 190 -30 260 -30 {lab=GND}
N 260 -110 260 -90 {lab=out}
N 260 -110 280 -110 {lab=out}
C {gnd.sym} 190 -20 0 0 {name=l1 lab=GND}
C {vcvs.sym} 190 -60 0 0 {name=E1 value=1Meg}
C {opin.sym} 280 -110 0 0 {name=p3 lab=out}
C {res.sym} 260 -60 0 0 {name=R1
value=100Meg
footprint=1206
device=resistor
m=1}
C {ipin.sym} 90 -80 0 0 {name=p2 lab=inp}
C {ipin.sym} 90 -40 0 0 {name=p1 lab=inn}
