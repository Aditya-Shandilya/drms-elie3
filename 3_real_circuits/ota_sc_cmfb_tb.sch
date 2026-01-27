v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -200 200 -200 220 {lab=vcm_ref}
N -200 280 -200 290 {lab=GND}
N -490 280 -490 300 {lab=vcm_ref}
N -370 280 -370 300 {lab=vcm_ref}
N -370 200 -370 220 {lab=inn}
N -490 200 -490 220 {lab=inp}
N -170 -110 -170 -100 {lab=vdd}
N 380 -60 460 -60 {lab=vcm_ref}
N 260 -110 260 -100 {lab=vdd}
N -320 -290 -320 -270 {lab=phi1}
N -320 -210 -320 -200 {lab=GND}
N 40 280 40 290 {lab=GND}
N 40 200 40 220 {lab=biasn_ref}
N -420 -60 -320 -60 {lab=inp}
N -420 -40 -320 -40 {lab=inn}
N -420 40 -320 40 {lab=v_feedback}
N -420 20 -320 20 {lab=bias_n_casc}
N -420 0 -320 0 {lab=bias_p_src}
N -420 -20 -320 -20 {lab=bias_p_casc}
N 380 -40 460 -40 {lab=biasn_ref}
N -90 200 -90 220 {lab=vdd}
N -90 280 -90 290 {lab=GND}
N 190 280 190 290 {lab=GND}
N 190 200 190 220 {lab=bias_p_src}
N 350 280 350 290 {lab=GND}
N 350 200 350 220 {lab=bias_p_casc}
N 490 280 490 290 {lab=GND}
N 490 200 490 220 {lab=bias_n_casc}
N -170 90 -170 120 {lab=GND}
N 260 100 260 120 {lab=GND}
N 50 120 50 130 {lab=GND}
N 40 -20 140 -20 {lab=phi1}
N 40 0 140 0 {lab=phi1_b}
N 40 20 140 20 {lab=phi2}
N 40 40 140 40 {lab=phi2_b}
N 40 60 140 60 {lab=v_feedback}
N -20 -40 140 -40 {lab=outn}
N -20 -60 140 -60 {lab=outp}
N -170 -110 260 -110 {lab=vdd}
N 50 120 260 120 {lab=GND}
N -170 120 50 120 {lab=GND}
N -120 -290 -120 -270 {lab=phi1_b}
N -120 -210 -120 -200 {lab=GND}
N 80 -290 80 -270 {lab=phi2}
N 80 -210 80 -200 {lab=GND}
N 300 -290 300 -270 {lab=phi2_b}
N 300 -210 300 -200 {lab=GND}
C {vsource.sym} -200 250 0 0 {name=VCM value=1.5 savecurrent=false}
C {lab_pin.sym} -200 200 0 0 {name=p1 sig_type=std_logic lab=vcm_ref}
C {gnd.sym} -200 290 0 0 {name=l2 lab=GND}
C {vsource.sym} -490 250 0 0 {name=VinP value=SIN"(0 10m 1k)"}
C {vsource.sym} -370 250 0 0 {name=VinN value=SIN"(0 -10m 1k 0 0 180)" }
C {lab_pin.sym} -370 200 0 0 {name=p3 sig_type=std_logic lab=inn}
C {lab_pin.sym} -490 300 0 0 {name=p4 sig_type=std_logic lab=vcm_ref}
C {lab_pin.sym} -370 300 0 0 {name=p5 sig_type=std_logic lab=vcm_ref}
C {code_shown.sym} -790 -330 0 0 {name=NGSPICE only_toplevel=false 
value="
.param temp=27
.control
save all
op
tran 2n 5u
plot outp outn
plot v_feedback
.endc
"}
C {devices/code_shown.sym} -790 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
.lib cornerCAP.lib cap_typ
"}
C {ota_folded_cascoded.sym} -170 20 0 0 {name=x1}
C {sc_cmfb_cmos.sym} 260 0 0 0 {name=x2}
C {lab_wire.sym} 460 -40 0 0 {name=p15 sig_type=std_logic lab=biasn_ref}
C {lab_wire.sym} 460 -60 0 0 {name=p16 sig_type=std_logic lab=vcm_ref}
C {lab_wire.sym} -420 20 0 1 {name=p22 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} -420 0 0 1 {name=p26 sig_type=std_logic lab=bias_p_src}
C {lab_wire.sym} -420 -20 0 1 {name=p27 sig_type=std_logic lab=bias_p_casc}
C {lab_pin.sym} -490 200 0 0 {name=p6 sig_type=std_logic lab=inp}
C {lab_wire.sym} -420 -60 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_wire.sym} 90 -110 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -420 -40 0 1 {name=p9 sig_type=std_logic lab=inn}
C {vsource.sym} -320 -240 0 0 {name=Vphi1 value="PULSE(0 3 0 1n 1n 0.45u 1u)" savecurrent=false}
C {gnd.sym} -320 -200 0 0 {name=Vphi3 lab=GND
value="PULSE(0 3 0 1n 1n 0.45u 1u)"}
C {vsource.sym} 40 250 0 0 {name=V_biasn_ref value=1.2 savecurrent=false}
C {gnd.sym} 40 290 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 40 200 0 0 {name=p12 sig_type=std_logic lab=biasn_ref}
C {vsource.sym} -90 250 0 0 {name=VDD value=3 savecurrent=false}
C {gnd.sym} -90 290 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -90 200 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {lab_wire.sym} 40 60 0 1 {name=p14 sig_type=std_logic lab=v_feedback}
C {vsource.sym} 190 250 0 0 {name=V_pbias_src value=2.4 savecurrent=false}
C {gnd.sym} 190 290 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 350 200 0 0 {name=p17 sig_type=std_logic lab=bias_p_casc}
C {vsource.sym} 350 250 0 0 {name=V_pbias_casc value=1.7 savecurrent=false}
C {gnd.sym} 350 290 0 0 {name=l7 lab=GND}
C {lab_pin.sym} 190 200 0 0 {name=p18 sig_type=std_logic lab=bias_p_src}
C {vsource.sym} 490 250 0 0 {name=V_nbias_casc value=1.0 savecurrent=false}
C {gnd.sym} 490 290 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 490 200 0 0 {name=p19 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} 40 -60 0 1 {name=p20 sig_type=std_logic lab=outp}
C {lab_wire.sym} 40 -40 0 1 {name=p21 sig_type=std_logic lab=outn}
C {gnd.sym} 50 130 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -420 40 0 1 {name=p8 sig_type=std_logic lab=v_feedback}
C {lab_wire.sym} 40 40 0 1 {name=p10 sig_type=std_logic lab=phi2_b}
C {lab_wire.sym} 40 20 0 1 {name=p23 sig_type=std_logic lab=phi2}
C {lab_wire.sym} 40 0 0 1 {name=p24 sig_type=std_logic lab=phi1_b}
C {lab_wire.sym} 40 -20 0 1 {name=p25 sig_type=std_logic lab=phi1}
C {lab_pin.sym} -320 -290 0 0 {name=p11 sig_type=std_logic lab=phi1}
C {vsource.sym} -120 -240 0 0 {name=Vphi1b value="PULSE(3 0 0 1n 1n 0.45u 1u)" savecurrent=false}
C {gnd.sym} -120 -200 0 0 {name=Vphi4 lab=GND
value="PULSE(0 3 0 1n 1n 0.45u 1u)"}
C {lab_pin.sym} -120 -290 0 0 {name=p28 sig_type=std_logic lab=phi1_b}
C {vsource.sym} 80 -240 0 0 {name=Vphi2 value="PULSE(0 3 0.5u 1n 1n 0.45u 1u)" savecurrent=false}
C {gnd.sym} 80 -200 0 0 {name=Vphi6 lab=GND
value="PULSE(0 3 0 1n 1n 0.45u 1u)"}
C {lab_pin.sym} 80 -290 0 0 {name=p29 sig_type=std_logic lab=phi2}
C {vsource.sym} 300 -240 0 0 {name=Vphi2b value="PULSE(3 0 0.5u 1n 1n 0.45u 1u)" savecurrent=false}
C {gnd.sym} 300 -200 0 0 {name=Vphi8 lab=GND
value="PULSE(0 3 0 1n 1n 0.45u 1u)"}
C {lab_pin.sym} 300 -290 0 0 {name=p30 sig_type=std_logic lab=phi2_b}
