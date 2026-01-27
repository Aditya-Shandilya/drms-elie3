v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -70 -260 -70 -240 {lab=vcm_ref}
N -70 -180 -70 -170 {lab=GND}
N -360 -180 -360 -160 {lab=vcm_ref}
N -240 -180 -240 -160 {lab=vcm_ref}
N -240 -260 -240 -240 {lab=inn}
N -360 -260 -360 -240 {lab=inp}
N -170 -110 -170 -100 {lab=vdd}
N -420 -60 -320 -60 {lab=inp}
N -420 -40 -320 -40 {lab=inn}
N -420 40 -320 40 {lab=v_feedback}
N -420 20 -320 20 {lab=bias_n_casc}
N -420 0 -320 0 {lab=bias_p_src}
N -420 -20 -320 -20 {lab=bias_p_casc}
N 40 -260 40 -240 {lab=vdd}
N 40 -180 40 -170 {lab=GND}
N -340 290 -340 300 {lab=GND}
N -340 210 -340 230 {lab=bias_p_src}
N -180 290 -180 300 {lab=GND}
N -180 210 -180 230 {lab=bias_p_casc}
N -40 290 -40 300 {lab=GND}
N -40 210 -40 230 {lab=bias_n_casc}
N -170 90 -170 120 {lab=GND}
N 50 120 50 130 {lab=GND}
N -170 120 50 120 {lab=GND}
N 130 290 130 300 {lab=GND}
N 130 210 130 230 {lab=v_feedback}
N -20 -60 90 -60 {lab=outp}
N 90 -60 90 -40 {lab=outp}
N -20 -40 20 -40 {lab=outn}
N 20 20 20 40 {lab=GND}
N 50 40 90 40 {lab=GND}
N 90 20 90 40 {lab=GND}
N 50 40 50 120 {lab=GND}
N 20 40 50 40 {lab=GND}
C {vsource.sym} -70 -210 0 0 {name=VCM value=1.5 savecurrent=false}
C {lab_pin.sym} -70 -260 0 0 {name=p1 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} -70 -170 0 0 {name=l2 lab=GND}
C {vsource.sym} -360 -210 0 0 {name=VinP value="DC 1.5 AC 0.5"}
C {vsource.sym} -240 -210 0 0 {name=VinN value="DC 1.5 AC -0.5" }
C {lab_pin.sym} -240 -260 0 0 {name=p3 sig_type=std_logic lab=inn}
C {code_shown.sym} -790 -90 0 0 {name=NGSPICE only_toplevel=false 
value="
.param temp=27
.control
save all
op
ac dec 100 10 100MEG
let vod=v(outp)-v(outn)
plot db(v(vod))
.endc
"}
C {devices/code_shown.sym} -790 140 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
.lib cornerCAP.lib cap_typ
"}
C {ota_folded_cascoded.sym} -170 20 0 0 {name=x1}
C {lab_wire.sym} -420 20 0 1 {name=p22 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} -420 0 0 1 {name=p26 sig_type=std_logic lab=bias_p_src}
C {lab_wire.sym} -420 -20 0 1 {name=p27 sig_type=std_logic lab=bias_p_casc}
C {lab_pin.sym} -360 -260 0 0 {name=p6 sig_type=std_logic lab=inp}
C {lab_wire.sym} -420 -60 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_wire.sym} -170 -110 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -420 -40 0 1 {name=p9 sig_type=std_logic lab=inn}
C {vsource.sym} 40 -210 0 0 {name=VDD value=3 savecurrent=false}
C {gnd.sym} 40 -170 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 40 -260 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {vsource.sym} -340 260 0 0 {name=V_pbias_src value=2.4 savecurrent=false}
C {gnd.sym} -340 300 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -180 210 0 0 {name=p17 sig_type=std_logic lab=bias_p_casc}
C {vsource.sym} -180 260 0 0 {name=V_pbias_casc value=1.7 savecurrent=false}
C {gnd.sym} -180 300 0 0 {name=l7 lab=GND}
C {lab_pin.sym} -340 210 0 0 {name=p18 sig_type=std_logic lab=bias_p_src}
C {vsource.sym} -40 260 0 0 {name=V_nbias_casc value=1.0 savecurrent=false}
C {gnd.sym} -40 300 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -40 210 0 0 {name=p19 sig_type=std_logic lab=bias_n_casc}
C {gnd.sym} 50 130 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -420 40 0 1 {name=p8 sig_type=std_logic lab=v_feedback}
C {vsource.sym} 130 260 0 0 {name=V_biasn_sink value=1.0 savecurrent=false}
C {gnd.sym} 130 300 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 130 210 0 0 {name=p31 sig_type=std_logic lab=v_feedback}
C {capa.sym} 90 -10 0 0 {name=C1
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 20 -10 0 0 {name=C2
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 30 -60 0 0 {name=p10 sig_type=std_logic lab=outp}
C {lab_wire.sym} 20 -40 0 0 {name=p11 sig_type=std_logic lab=outn}
C {lab_pin.sym} -360 -160 0 0 {name=p4 sig_type=std_logic lab=vcm_ref}
C {lab_pin.sym} -240 -160 0 0 {name=p5 sig_type=std_logic lab=vcm_ref}
