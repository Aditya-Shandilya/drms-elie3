v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -470 280 -470 300 {lab=vcm_ref}
N -470 360 -470 370 {lab=GND}
N -640 -10 -640 10 {lab=GND}
N -640 170 -640 190 {lab=GND}
N -640 90 -640 110 {lab=inn}
N -640 -90 -640 -70 {lab=inp}
N -20 -110 -20 -100 {lab=vdd}
N -270 -60 -170 -60 {lab=inp}
N -270 -40 -170 -40 {lab=inn}
N -230 40 -170 40 {lab=v_feedback}
N -270 20 -170 20 {lab=bias_n_casc}
N -270 0 -170 0 {lab=bias_p_src}
N -270 -20 -170 -20 {lab=bias_p_casc}
N -640 280 -640 300 {lab=vdd}
N -640 360 -640 370 {lab=GND}
N -310 360 -310 370 {lab=GND}
N -310 280 -310 300 {lab=bias_p_src}
N -100 360 -100 370 {lab=GND}
N -100 280 -100 300 {lab=bias_p_casc}
N 100 360 100 370 {lab=GND}
N 100 280 100 300 {lab=bias_n_casc}
N -20 90 -20 130 {lab=GND}
N 320 360 320 370 {lab=GND}
N 320 280 320 300 {lab=bias_n_sink}
N 220 -40 300 -40 {lab=outn}
N 230 -20 300 -20 {lab=vcm_ref}
N 410 30 410 40 {lab=GND}
N 510 -60 610 -60 {lab=v_feedback}
N 160 -60 160 0 {lab=outp}
N 220 -40 220 0 {lab=outn}
N 160 -60 300 -60 {lab=outp}
N 130 -60 160 -60 {lab=outp}
N 130 -40 220 -40 {lab=outn}
N 160 60 160 80 {lab=GND}
N 160 80 220 80 {lab=GND}
N 220 60 220 80 {lab=GND}
N -230 40 -230 70 {lab=v_feedback}
N -270 40 -230 40 {lab=v_feedback}
N -230 130 -230 160 {lab=bias_n_sink}
C {vsource.sym} -470 330 0 0 {name=VCM value=\{Vcm\}}
C {lab_pin.sym} -470 280 0 0 {name=p1 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} -470 370 0 0 {name=l2 lab=GND}
C {vsource.sym} -640 -40 0 0 {name=VinP value="PULSE(1.2 1.5 1u 1n 1n 5u 10u) DC 1.2 AC 1"}
C {vsource.sym} -640 140 0 0 {name=VinN value="PULSE(1.2 0.9 1u 1n 1n 5u 10u) DC 1.2 AC -1" }
C {lab_pin.sym} -640 90 0 0 {name=p3 sig_type=std_logic lab=inn}
C {code_shown.sym} 660 0 0 0 {name=NGSPICE only_toplevel=true 
value="
.option temp=27
.control
option sparse
save all
op
write ota_folded_cascoded_tb.raw
print @n.x1.xm3.nsg13_hv_nmos[ids]
print @n.x1.xm10.nsg13_hv_pmos[ids]
print @n.x1.xm1.nsg13_hv_nmos[ids]
wrdata op_data.txt @n.x1.xm3.nsg13_hv_nmos[ids] @n.x1.xm1.nsg13_hv_nmos[ids] @n.x1.xm1.nsg13_hv_nmos[gm] @n.x1.xm10.nsg13_hv_pmos[ids] @n.x1.xm10.nsg13_hv_pmos[gm] @n.x1.xm8.nsg13_hv_pmos[ids]

tran 100p 10u
wrdata ota_tran_data.txt v(outp) v(outn) v(inp) v(inn)

ac dec 100 1 1G
wrdata ota_ac_data.txt v(outp) v(outn) v(inp) v(inn)

.endc
"}
C {devices/code_shown.sym} 660 510 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {ota_folded_cascoded.sym} -20 20 0 0 {name=x1}
C {lab_wire.sym} -270 20 0 1 {name=p22 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} -270 0 0 1 {name=p26 sig_type=std_logic lab=bias_p_src}
C {lab_wire.sym} -270 -20 0 1 {name=p27 sig_type=std_logic lab=bias_p_casc}
C {lab_pin.sym} -640 -90 0 0 {name=p6 sig_type=std_logic lab=inp}
C {lab_wire.sym} -270 -60 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_wire.sym} -20 -110 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -270 -40 0 1 {name=p9 sig_type=std_logic lab=inn}
C {vsource.sym} -640 330 0 0 {name=VDD value=\{Vdd\}}
C {gnd.sym} -640 370 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -640 280 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {vsource.sym} -310 330 0 0 {name=V_pbias_src value=\{vbias_p_src\} savecurrent=false}
C {gnd.sym} -310 370 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -100 280 0 0 {name=p17 sig_type=std_logic lab=bias_p_casc}
C {vsource.sym} -100 330 0 0 {name=V_pbias_casc value=\{vbias_p_casc\} savecurrent=false}
C {gnd.sym} -100 370 0 0 {name=l7 lab=GND}
C {lab_pin.sym} -310 280 0 0 {name=p18 sig_type=std_logic lab=bias_p_src}
C {vsource.sym} 100 330 0 0 {name=V_nbias_casc value=\{vbias_n_casc\} savecurrent=false}
C {gnd.sym} 100 370 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 100 280 0 0 {name=p19 sig_type=std_logic lab=bias_n_casc}
C {gnd.sym} -20 130 0 0 {name=l1 lab=GND}
C {vsource.sym} 320 330 0 0 {name=V_biasn_sink value=\{vbias_n_sink\} savecurrent=false}
C {gnd.sym} 320 370 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 320 280 0 0 {name=p31 sig_type=std_logic lab=bias_n_sink}
C {lab_wire.sym} 230 -60 0 1 {name=p10 sig_type=std_logic lab=outp}
C {lab_wire.sym} 230 -40 0 1 {name=p11 sig_type=std_logic lab=outn}
C {gnd.sym} -640 10 0 0 {name=l4 lab=GND}
C {gnd.sym} -640 190 0 0 {name=l9 lab=GND}
C {code_shown.sym} 660 -230 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
.param Vcm=Vdd/2
.param vbias_n_sink=0.8
.param vbias_n_casc=1.2
.param vbias_p_src=2.2
.param vbias_p_casc=1.9
.param Riso=100k
.param Cl1=3p Cl2=3p
.param Gcmfb=5m 
"}
C {devices/launcher.sym} 340 160 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 340 220 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 660 440 0 0 {name=SAVE only_toplevel=true
format="tcleval( @value )"
value=".include [file rootname [xschem get schname]].save
"}
C {ideal_cmfb.sym} 450 -30 0 0 {name=x2}
C {capa.sym} 220 30 0 0 {name=C2
m=1
value=\{Cl2\}
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 160 30 0 0 {name=C1
m=1
value=\{Cl1\}
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 230 -20 0 1 {name=p4 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} 410 40 0 0 {name=l10 lab=GND}
C {lab_wire.sym} 610 -60 0 0 {name=p5 sig_type=std_logic lab=v_feedback}
C {gnd.sym} 220 80 0 0 {name=l11 lab=GND}
C {res.sym} -230 100 0 0 {name=R1
value=\{Riso\}
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} -270 40 0 1 {name=p12 sig_type=std_logic lab=v_feedback}
C {lab_pin.sym} -230 160 0 1 {name=p8 sig_type=std_logic lab=bias_n_sink}
