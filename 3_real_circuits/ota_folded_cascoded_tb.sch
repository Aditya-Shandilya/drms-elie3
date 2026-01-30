v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -620 280 -620 300 {lab=vcm_ref}
N -620 360 -620 370 {lab=GND}
N -790 -10 -790 10 {lab=GND}
N -790 170 -790 190 {lab=GND}
N -790 90 -790 110 {lab=inn}
N -790 -90 -790 -70 {lab=inp}
N -170 -110 -170 -100 {lab=vdd}
N -420 -60 -320 -60 {lab=inp}
N -420 -40 -320 -40 {lab=inn}
N -420 40 -320 40 {lab=v_feedback}
N -420 20 -320 20 {lab=bias_n_casc}
N -420 0 -320 0 {lab=bias_p_src}
N -420 -20 -320 -20 {lab=bias_p_casc}
N -790 280 -790 300 {lab=vdd}
N -790 360 -790 370 {lab=GND}
N -460 360 -460 370 {lab=GND}
N -460 280 -460 300 {lab=bias_p_src}
N -250 360 -250 370 {lab=GND}
N -250 280 -250 300 {lab=bias_p_casc}
N -50 360 -50 370 {lab=GND}
N -50 280 -50 300 {lab=bias_n_casc}
N -170 90 -170 130 {lab=GND}
N 170 360 170 370 {lab=GND}
N 170 280 170 300 {lab=v_feedback}
N -20 -60 190 -60 {lab=outp}
N 190 -60 190 -40 {lab=outp}
N -20 -40 100 -40 {lab=outn}
N 20 20 20 80 {lab=vcm_ref}
N 190 20 190 80 {lab=vcm_ref}
N 270 -60 270 -40 {lab=outp}
N 190 -60 270 -60 {lab=outp}
C {vsource.sym} -620 330 0 0 {name=VCM value=\{Vcm\}}
C {lab_pin.sym} -620 280 0 0 {name=p1 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} -620 370 0 0 {name=l2 lab=GND}
C {vsource.sym} -790 -40 0 0 {name=VinP value="PULSE(1.2 1.2005 1u 1n 1n 5u 10u) DC 1.2 AC 0.5m"}
C {vsource.sym} -790 140 0 0 {name=VinN value="PULSE(1.2 1.1995 1u 1n 1n 5u 10u) DC 1.2 AC -0.5m" }
C {lab_pin.sym} -790 90 0 0 {name=p3 sig_type=std_logic lab=inn}
C {code_shown.sym} 350 0 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
option sparse
save all
op
write ota_folded_cascoded_tb.raw
set appendwrite
*tran 1n 10u
ac dec 100 1 1G
write ota_folded_cascoded_tb.raw

* ---- AC plots ----
setplot ac1
plot db((v(outp)-v(outn))/(v(inp)-v(inn)))

* ---- Transient plots ----
setplot tran1
plot v(inp) v(inn)
plot v(outp) v(outn)
plot v(outp)-v(outn)
plot (v(outp)+v(outn))/2
.endc
"}
C {devices/code_shown.sym} 350 540 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
.lib cornerCAP.lib cap_typ
"}
C {ota_folded_cascoded.sym} -170 20 0 0 {name=x1}
C {lab_wire.sym} -420 20 0 1 {name=p22 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} -420 0 0 1 {name=p26 sig_type=std_logic lab=bias_p_src}
C {lab_wire.sym} -420 -20 0 1 {name=p27 sig_type=std_logic lab=bias_p_casc}
C {lab_pin.sym} -790 -90 0 0 {name=p6 sig_type=std_logic lab=inp}
C {lab_wire.sym} -420 -60 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_wire.sym} -170 -110 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -420 -40 0 1 {name=p9 sig_type=std_logic lab=inn}
C {vsource.sym} -790 330 0 0 {name=VDD value=\{Vdd\}}
C {gnd.sym} -790 370 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -790 280 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {vsource.sym} -460 330 0 0 {name=V_pbias_src value=\{vbias_p_src\} savecurrent=false}
C {gnd.sym} -460 370 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -250 280 0 0 {name=p17 sig_type=std_logic lab=bias_p_casc}
C {vsource.sym} -250 330 0 0 {name=V_pbias_casc value=\{vbias_p_casc\} savecurrent=false}
C {gnd.sym} -250 370 0 0 {name=l7 lab=GND}
C {lab_pin.sym} -460 280 0 0 {name=p18 sig_type=std_logic lab=bias_p_src}
C {vsource.sym} -50 330 0 0 {name=V_nbias_casc value=\{vbias_n_casc\} savecurrent=false}
C {gnd.sym} -50 370 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -50 280 0 0 {name=p19 sig_type=std_logic lab=bias_n_casc}
C {gnd.sym} -170 130 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -420 40 0 1 {name=p8 sig_type=std_logic lab=v_feedback}
C {vsource.sym} 170 330 0 0 {name=V_biasn_sink value=\{vbias_n_sink\} savecurrent=false}
C {gnd.sym} 170 370 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 170 280 0 0 {name=p31 sig_type=std_logic lab=v_feedback}
C {lab_wire.sym} 30 -60 0 0 {name=p10 sig_type=std_logic lab=outp}
C {lab_wire.sym} 20 -40 0 0 {name=p11 sig_type=std_logic lab=outn}
C {lab_pin.sym} 20 80 0 0 {name=p12 sig_type=std_logic lab=vcm_ref}
C {res.sym} 190 -10 0 0 {name=R1
value=\{Rcm1\}
footprint=1206
device=resistor
m=1}
C {res.sym} 20 -10 0 0 {name=R2
value=\{Rcm2\}
footprint=1206
device=resistor
m=1}
C {gnd.sym} -790 10 0 0 {name=l4 lab=GND}
C {gnd.sym} -790 190 0 0 {name=l9 lab=GND}
C {code_shown.sym} 350 -220 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
.param Vcm=Vdd/2
.param vbias_n_sink=0.7
.param vbias_n_casc=1.2
.param vbias_p_src=2.3
.param vbias_p_casc=1.8
.param Rcm1=1MEG Rcm2=1MEG
.param Cl1=1p Cl2=1p 
"}
C {capa.sym} 270 -10 0 0 {name=C1
m=1
value=\{Cl1\}
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 100 20 0 0 {name=l10 lab=GND}
C {lab_pin.sym} 190 80 0 0 {name=p4 sig_type=std_logic lab=vcm_ref}
C {capa.sym} 100 -10 0 0 {name=C2
m=1
value=\{Cl2\}
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 270 20 0 0 {name=l11 lab=GND}
C {devices/launcher.sym} 190 160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 190 220 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 350 470 0 0 {name=SAVE only_toplevel=true
format="tcleval( @value )"
value=".include [file rootname [xschem get schname]].save
"}
