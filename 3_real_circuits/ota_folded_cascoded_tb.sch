v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 450 -250 450 -230 {lab=vcm_ref}
N 450 -170 450 -160 {lab=GND}
N -410 -170 -410 -150 {lab=GND}
N -60 -170 -60 -150 {lab=GND}
N -60 -250 -60 -230 {lab=inn}
N -410 -250 -410 -230 {lab=inp}
N -80 -100 -80 -90 {lab=vdd}
N -330 -50 -230 -50 {lab=inp}
N -330 -30 -230 -30 {lab=inn}
N -330 30 -230 30 {lab=bias_n_casc}
N -330 -10 -230 -10 {lab=bias_p_casc}
N 280 -250 280 -230 {lab=vdd}
N 280 -170 280 -160 {lab=GND}
N -80 100 -80 140 {lab=GND}
N 160 -30 240 -30 {lab=outn}
N 170 -10 240 -10 {lab=vcm_ref}
N 350 40 350 50 {lab=GND}
N 450 -50 550 -50 {lab=v_feedback}
N 100 -50 100 10 {lab=outp}
N 160 -30 160 10 {lab=outn}
N 100 -50 240 -50 {lab=outp}
N 70 -50 100 -50 {lab=outp}
N 70 -30 160 -30 {lab=outn}
N 100 70 100 90 {lab=GND}
N 100 90 160 90 {lab=GND}
N 160 70 160 90 {lab=GND}
N -120 300 -120 320 {lab=bias_p_casc}
N -120 380 -120 390 {lab=GND}
N 50 300 50 320 {lab=bias_n_casc}
N 50 380 50 390 {lab=GND}
N -450 50 -450 80 {lab=bias_n_sink}
N 250 300 250 320 {lab=n_bias_ref}
N 250 380 250 390 {lab=GND}
N 450 300 450 320 {lab=bias_p_src}
N 450 380 450 390 {lab=GND}
N -330 10 -230 10 {lab=bias_p_src}
N -450 140 -450 160 {lab=n_bias_ref}
N -450 50 -230 50 {lab=bias_n_sink}
N -450 20 -450 50 {lab=bias_n_sink}
C {vsource.sym} 450 -200 0 0 {name=VCM value=\{Vcm\}}
C {lab_pin.sym} 450 -250 0 0 {name=p1 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} 450 -160 0 0 {name=l2 lab=GND}
C {vsource.sym} -410 -200 0 0 {name=VinP value="PULSE(1.5 1.8 1u 1n 1n 5u 10u) DC \{Vcm\} AC 1"}
C {vsource.sym} -60 -200 0 0 {name=VinN value="PULSE(1.5 1.2 1u 1n 1n 5u 10u) DC \{Vcm\} AC -1" }
C {lab_pin.sym} -60 -250 0 0 {name=p3 sig_type=std_logic lab=inn}
C {code_shown.sym} 660 10 0 0 {name=NGSPICE only_toplevel=true 
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
print @n.x1.xm8.nsg13_hv_pmos[ids]
wrdata op_data.txt @n.x1.xm3.nsg13_hv_nmos[ids] @n.x1.xm1.nsg13_hv_nmos[ids] @n.x1.xm1.nsg13_hv_nmos[gm] @n.x1.xm10.nsg13_hv_pmos[ids] @n.x1.xm10.nsg13_hv_pmos[gm] @n.x1.xm8.nsg13_hv_pmos[ids]
ac dec 100 1 1G
wrdata ota_ac_data.txt v(outp) v(outn) v(inp) v(inn)

tran 100p 10u
wrdata ota_tran_data.txt v(outp) v(outn) v(inp) v(inn)
.endc
"}
C {devices/code_shown.sym} 660 470 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {ota_folded_cascoded.sym} -80 30 0 0 {name=x1}
C {lab_wire.sym} -330 30 0 1 {name=p22 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} -330 10 0 1 {name=p26 sig_type=std_logic lab=bias_p_src}
C {lab_wire.sym} -330 -10 0 1 {name=p27 sig_type=std_logic lab=bias_p_casc}
C {lab_pin.sym} -410 -250 0 0 {name=p6 sig_type=std_logic lab=inp}
C {lab_wire.sym} -330 -50 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_wire.sym} -80 -100 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -330 -30 0 1 {name=p9 sig_type=std_logic lab=inn}
C {vsource.sym} 280 -200 0 0 {name=VDD value=\{Vdd\}}
C {gnd.sym} 280 -160 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 280 -250 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {gnd.sym} -80 140 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 170 -50 0 1 {name=p10 sig_type=std_logic lab=outp}
C {lab_wire.sym} 170 -30 0 1 {name=p11 sig_type=std_logic lab=outn}
C {gnd.sym} -410 -150 0 0 {name=l4 lab=GND}
C {gnd.sym} -60 -150 0 0 {name=l9 lab=GND}
C {code_shown.sym} 660 -230 0 0 {name=param only_toplevel=false 
value="
.param Vdd=3
.param Vcm=Vdd/2
.param vbias_n_ref=0.92
.param vbias_p_src=2.1
.param vbias_n_casc=1.2
.param vbias_p_casc=1.8
.param R_ref=22k
.param R_cmfb=47k
.param Cl1=1p Cl2=1p
.param Gcmfb=5m 
"}
C {devices/launcher.sym} 420 120 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 420 180 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 660 380 0 0 {name=SAVE only_toplevel=true
format="tcleval( @value )"
value=".include [file rootname [xschem get schname]].save
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
C {vsource.sym} -120 350 0 0 {name=V_pbias_casc value=\{vbias_p_casc\}}
C {gnd.sym} -120 390 0 0 {name=l6 lab=GND}
C {vsource.sym} 50 350 0 0 {name=V_nbias_casc value=\{vbias_n_casc\}}
C {lab_pin.sym} 50 300 0 0 {name=p17 sig_type=std_logic lab=bias_n_casc}
C {gnd.sym} 50 390 0 0 {name=l7 lab=GND}
C {lab_pin.sym} -120 300 0 0 {name=p16 sig_type=std_logic lab=bias_p_casc}
C {res.sym} -450 -10 0 0 {name=R1
value=\{R_cmfb\}
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} -330 50 0 1 {name=p12 sig_type=std_logic lab=bias_n_sink}
C {lab_pin.sym} -450 160 0 1 {name=p8 sig_type=std_logic lab=n_bias_ref}
C {vsource.sym} 250 350 0 0 {name=V_nbias_ref value=\{vbias_n_ref\}}
C {gnd.sym} 250 390 0 0 {name=l8 lab=GND}
C {vsource.sym} 450 350 0 0 {name=V_pbias_src value=\{vbias_p_src\}}
C {gnd.sym} 450 390 0 0 {name=l13 lab=GND}
C {res.sym} -450 110 0 0 {name=R2
value=\{R_ref\}
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} -450 -40 0 0 {name=p21 sig_type=std_logic lab=v_feedback}
C {lab_pin.sym} 250 300 0 0 {name=p18 sig_type=std_logic lab=n_bias_ref}
C {lab_pin.sym} 450 300 0 0 {name=p19 sig_type=std_logic lab=bias_p_src}
