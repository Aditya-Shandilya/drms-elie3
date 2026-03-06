v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -190 -200 -190 -180 {lab=vdd}
N -190 190 -190 210 {lab=GND}
N -190 110 -190 130 {lab=inp}
N -190 30 -190 50 {lab=GND}
N -190 -50 -190 -30 {lab=inn}
N -70 190 -70 210 {lab=GND}
N -70 110 -70 130 {lab=phi2}
N 200 190 200 210 {lab=GND}
N 200 110 200 130 {lab=phi2_b}
N -50 -80 10 -80 {lab=inp}
N -50 -60 10 -60 {lab=inn}
N -50 -40 10 -40 {lab=phi2}
N -50 -20 10 -20 {lab=phi2_b}
N 130 -130 130 -120 {lab=vdd}
N 250 -80 300 -80 {lab=outp}
N 250 -60 300 -60 {lab=outn}
N 130 20 130 30 {lab=GND}
N -190 -120 -190 -100 {lab=GND}
C {comparator_latched.sym} 160 -50 0 0 {name=x1}
C {vsource.sym} -190 -150 0 0 {name=VDD value=\{Vdd\}}
C {gnd.sym} -190 -100 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -190 -200 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {gnd.sym} 130 30 0 0 {name=l6 lab=GND}
C {vsource.sym} -190 160 0 1 {name=VinP value="PULSE(\{Vcm+Vdiff/2\} \{Vcm-Vdiff/2\} 5u 1n 1n 5u 10u) DC \{Vcm+Vdiff/2\}"}
C {lab_pin.sym} -190 110 0 1 {name=p6 sig_type=std_logic lab=inp}
C {gnd.sym} -190 210 0 1 {name=l4 lab=GND}
C {vsource.sym} -190 0 0 1 {name=VinN value="PULSE(\{Vcm-Vdiff/2\} \{Vcm+Vdiff/2\} 5u 1n 1n 5u 10u) DC \{Vcm-Vdiff/2\}" }
C {lab_pin.sym} -190 -50 0 1 {name=p3 sig_type=std_logic lab=inn}
C {gnd.sym} -190 50 0 1 {name=l9 lab=GND}
C {vsource.sym} -70 160 0 0 {name=Vphi2 value="PULSE(0 \{Vdd\} 0n 1n 1n 490n 1000n)"}
C {lab_pin.sym} -70 110 0 0 {name=p1 sig_type=std_logic lab=phi2}
C {gnd.sym} -70 210 0 0 {name=l1 lab=GND}
C {vsource.sym} 200 160 0 0 {name=Vphi2_b value="PULSE(0 \{Vdd\} 495n 1n 1n 490n 1000n)"}
C {lab_pin.sym} 200 110 0 0 {name=p2 sig_type=std_logic lab=phi2_b}
C {gnd.sym} 200 210 0 0 {name=l2 lab=GND}
C {code_shown.sym} 490 -60 0 0 {name=NGSPICE only_toplevel=true 
value="
.option temp=27
.option savecurrents
.control
option sparse
save all
op
write comparator_latched_tb.raw
tran 1n 12u
plot v(phi2) v(phi2_b)
plot v(inp) v(inn)
plot v(outp) v(outn)
.endc
"}
C {devices/code_shown.sym} 490 310 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {code_shown.sym} 490 -190 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
.param Vcm=Vdd/2
.param Vdiff=10m
"}
C {lab_wire.sym} -50 -80 0 1 {name=p4 sig_type=std_logic lab=inp}
C {lab_wire.sym} -50 -60 0 1 {name=p5 sig_type=std_logic lab=inn}
C {lab_wire.sym} -50 -40 0 1 {name=p7 sig_type=std_logic lab=phi2}
C {lab_wire.sym} -50 -20 0 1 {name=p8 sig_type=std_logic lab=phi2_b}
C {lab_wire.sym} 130 -130 0 0 {name=p9 sig_type=std_logic lab=vdd}
C {lab_wire.sym} 300 -80 0 0 {name=p10 sig_type=std_logic lab=outp}
C {lab_wire.sym} 300 -60 0 0 {name=p11 sig_type=std_logic lab=outn}
C {devices/launcher.sym} 330 20 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 330 80 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 490 230 0 0 {name=SAVE only_toplevel=true
format="tcleval( @value )"
value=".include [file rootname [xschem get schname]].save
"}
