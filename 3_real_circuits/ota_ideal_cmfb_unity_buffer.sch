v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 450 -420 450 -400 {lab=vcm_ref}
N 450 -340 450 -330 {lab=GND}
N -560 -340 -560 -320 {lab=GND}
N -130 -340 -130 -320 {lab=GND}
N -130 -420 -130 -400 {lab=inn_sig}
N -560 -420 -560 -400 {lab=inp_sig}
N -80 -100 -80 -90 {lab=vdd}
N -330 30 -230 30 {lab=bias_n_casc}
N -330 -10 -230 -10 {lab=bias_p_casc}
N 300 -420 300 -400 {lab=vdd}
N 300 -340 300 -330 {lab=GND}
N -80 100 -80 140 {lab=GND}
N 160 -30 240 -30 {lab=outn}
N 170 -10 240 -10 {lab=vcm_ref}
N 350 40 350 50 {lab=GND}
N 450 -50 550 -50 {lab=v_feedback}
N 100 -50 100 10 {lab=outp}
N 160 -30 160 10 {lab=outn}
N 70 -50 100 -50 {lab=outp}
N 100 70 100 90 {lab=GND}
N 100 90 160 90 {lab=GND}
N 160 70 160 90 {lab=GND}
N -280 230 -280 250 {lab=bias_p_casc}
N -280 310 -280 320 {lab=GND}
N -110 230 -110 250 {lab=bias_n_casc}
N -110 310 -110 320 {lab=GND}
N -490 50 -490 80 {lab=bias_n_sink}
N 90 230 90 250 {lab=n_bias_ref}
N 90 310 90 320 {lab=GND}
N 290 230 290 250 {lab=bias_p_src}
N 290 310 290 320 {lab=GND}
N -330 10 -230 10 {lab=bias_p_src}
N -490 140 -490 160 {lab=n_bias_ref}
N -490 50 -230 50 {lab=bias_n_sink}
N -490 20 -490 50 {lab=bias_n_sink}
N 110 -50 240 -50 {lab=outp}
N 130 -30 160 -30 {lab=outn}
N -260 -30 -230 -30 {lab=inn}
N 110 -130 110 -50 {lab=outp}
N 100 -50 110 -50 {lab=outp}
N -260 -130 -260 -30 {lab=inn}
N -460 -50 -400 -50 {lab=inp_sig}
N -460 -30 -400 -30 {lab=inn_sig}
N -280 -50 -230 -50 {lab=inp}
N -340 -30 -260 -30 {lab=inn}
N 50 -130 110 -130 {lab=outp}
N -260 -130 -10 -130 {lab=inn}
N -110 -180 130 -180 {lab=outn}
N -280 -180 -170 -180 {lab=inp}
N -280 -180 -280 -50 {lab=inp}
N -340 -50 -280 -50 {lab=inp}
N 130 -180 130 -30 {lab=outn}
N 70 -30 130 -30 {lab=outn}
C {vsource.sym} 450 -370 0 0 {name=VCM value=\{Vcm\}}
C {lab_pin.sym} 450 -420 0 0 {name=p1 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} 450 -330 0 0 {name=l2 lab=GND}
C {vsource.sym} -560 -370 0 0 {name=VinP value="PULSE(\{Vcm\} \{Vcm+Vstep\} 10n 1n 1n 500n 1.2u) DC \{Vcm\} AC 0.5"}
C {vsource.sym} -130 -370 0 0 {name=VinN value="PULSE(\{Vcm\} \{Vcm-Vstep\} 10n 1n 1n 500n 1.2u) DC \{Vcm\} AC -0.5" }
C {lab_pin.sym} -130 -420 0 0 {name=p3 sig_type=std_logic lab=inn_sig}
C {code_shown.sym} 620 -90 0 0 {name=NGSPICE only_toplevel=true 
value="
.option temp=27
.option savecurrents
.control
option sparse
save all
op
write ota_folded_cascoded_tran.raw

tran 100p 1.5u
wrdata ota_tran_small.txt v(outp) v(outn) v(inp) v(inn) v(inp_sig) v(inn_sig)
plot v(outp)-v(outn) title 'Small Signal (100mV)'

alterparam Vstep=0.5
reset

save all
tran 100p 1.5u
wrdata ota_tran_large.txt v(outp) v(outn) v(inp) v(inn) v(inp_sig) v(inn_sig)
plot v(outp)-v(outn) title 'Large Signal (500mV)'

.endc
"}
C {devices/code_shown.sym} 620 420 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {ota_folded_cascoded.sym} -80 30 0 0 {name=x1}
C {lab_wire.sym} -330 30 0 1 {name=p22 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} -330 10 0 1 {name=p26 sig_type=std_logic lab=bias_p_src}
C {lab_wire.sym} -330 -10 0 1 {name=p27 sig_type=std_logic lab=bias_p_casc}
C {lab_pin.sym} -560 -420 0 0 {name=p6 sig_type=std_logic lab=inp_sig}
C {lab_wire.sym} -330 -50 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_wire.sym} -80 -100 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -330 -30 0 1 {name=p9 sig_type=std_logic lab=inn}
C {vsource.sym} 300 -370 0 0 {name=VDD value=\{Vdd\}}
C {gnd.sym} 300 -330 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 300 -420 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {gnd.sym} -80 140 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 170 -50 0 1 {name=p10 sig_type=std_logic lab=outp}
C {lab_wire.sym} 170 -30 0 1 {name=p11 sig_type=std_logic lab=outn}
C {gnd.sym} -560 -320 0 0 {name=l4 lab=GND}
C {gnd.sym} -130 -320 0 0 {name=l9 lab=GND}
C {code_shown.sym} 620 -390 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
.param Vcm=Vdd/2
.param Vstep=0.1
.param vbias_n_ref=0.840
.param vbias_n_casc=1.162
.param vbias_p_src=2.150
.param vbias_p_casc=1.777
.param R_ref=22k
.param R_cmfb=47k
.param Rfb=500k
.param Rin=500k
.param Cl1=1p Cl2=1p
.param Gcmfb=5m 
"}
C {devices/launcher.sym} 340 110 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 340 170 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 620 350 0 0 {name=SAVE only_toplevel=true
format="tcleval( @value )"
value=".include /foss/designs/drms-elie3/3_real_circuits/ota_folded_cascoded_tb.save
"}
C {ideal_cmfb.sym} 390 -20 0 0 {name=x2}
C {capa.sym} 160 40 0 0 {name=C2
m=1
value=\{Cl2\}
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 100 40 0 0 {name=C1
m=1
value=\{Cl1\}
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 170 -10 0 1 {name=p4 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} 350 50 0 0 {name=l10 lab=GND}
C {lab_wire.sym} 550 -50 0 0 {name=p5 sig_type=std_logic lab=v_feedback}
C {gnd.sym} 160 90 0 0 {name=l11 lab=GND}
C {vsource.sym} -280 280 0 0 {name=V_pbias_casc value=\{vbias_p_casc\}}
C {gnd.sym} -280 320 0 0 {name=l6 lab=GND}
C {vsource.sym} -110 280 0 0 {name=V_nbias_casc value=\{vbias_n_casc\}}
C {lab_pin.sym} -110 230 0 0 {name=p17 sig_type=std_logic lab=bias_n_casc}
C {gnd.sym} -110 320 0 0 {name=l7 lab=GND}
C {lab_pin.sym} -280 230 0 0 {name=p16 sig_type=std_logic lab=bias_p_casc}
C {res.sym} -490 -10 0 0 {name=R1
value=\{R_cmfb\}
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} -330 50 0 1 {name=p12 sig_type=std_logic lab=bias_n_sink}
C {lab_pin.sym} -490 160 0 1 {name=p8 sig_type=std_logic lab=n_bias_ref}
C {vsource.sym} 90 280 0 0 {name=V_nbias_ref value=\{vbias_n_ref\}}
C {gnd.sym} 90 320 0 0 {name=l8 lab=GND}
C {vsource.sym} 290 280 0 0 {name=V_pbias_src value=\{vbias_p_src\}}
C {gnd.sym} 290 320 0 0 {name=l13 lab=GND}
C {res.sym} -490 110 0 0 {name=R2
value=\{R_ref\}
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} -490 -40 0 0 {name=p21 sig_type=std_logic lab=v_feedback}
C {lab_pin.sym} 90 230 0 0 {name=p18 sig_type=std_logic lab=n_bias_ref}
C {lab_pin.sym} 290 230 0 0 {name=p19 sig_type=std_logic lab=bias_p_src}
C {res.sym} -140 -180 3 0 {name=R3
value=\{Rfb\}
footprint=1206
device=resistor
m=1}
C {res.sym} 20 -130 3 1 {name=R4
value=\{Rfb\}
footprint=1206
device=resistor
m=1}
C {res.sym} -370 -50 3 0 {name=R5
value=\{Rin\}
footprint=1206
device=resistor
m=1}
C {res.sym} -370 -30 1 0 {name=R6
value=\{Rin\}
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} -460 -50 0 1 {name=p14 sig_type=std_logic lab=inp_sig}
C {lab_wire.sym} -460 -30 0 1 {name=p15 sig_type=std_logic lab=inn_sig}
