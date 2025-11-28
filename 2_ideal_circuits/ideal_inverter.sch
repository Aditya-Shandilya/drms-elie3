v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 140 40 140 50 {lab=GND}
N 140 -30 160 -30 {lab=out}
N 140 -30 140 -20 {lab=out}
N 70 -40 80 -40 {lab=vdd}
N 140 -60 150 -60 {lab=in}
N 60 20 70 20 {lab=vss}
C {iopin.sym} 70 -40 0 1 {name=p3 lab=vdd}
C {ipin.sym} 140 -60 0 0 {name=p1 lab=in}
C {opin.sym} 160 -30 0 0 {name=p2 lab=out}
C {vsource.sym} 140 10 0 0 {name=B1 value="V=\{v(in)>v(vdd)/2?v(vss):v(vdd)\}" savecurrent=false}
C {gnd.sym} 140 50 0 0 {name=l1 lab=GND}
C {noconn.sym} 80 -40 0 1 {name=l3}
C {noconn.sym} 150 -60 0 1 {name=l4}
C {iopin.sym} 60 20 0 1 {name=p4 lab=vss}
C {noconn.sym} 70 20 0 1 {name=l2}
