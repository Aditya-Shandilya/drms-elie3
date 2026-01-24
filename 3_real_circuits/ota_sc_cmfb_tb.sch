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
N 640 -60 720 -60 {lab=vcm_ref}
N 520 -110 520 -100 {lab=vdd}
N -20 -60 400 -60 {lab=outp}
N -20 -40 400 -40 {lab=outn}
N -170 -110 520 -110 {lab=vdd}
N 20 -20 70 -20 {lab=clk_in}
N 10 200 10 220 {lab=clk_in}
N 10 280 10 290 {lab=GND}
N 260 280 260 290 {lab=GND}
N 260 200 260 220 {lab=biasn_ref}
N -420 -60 -320 -60 {lab=inp}
N -420 -40 -320 -40 {lab=inn}
N -420 40 -320 40 {lab=v_feedback}
N -420 20 -320 20 {lab=bias_n_casc}
N -420 0 -320 0 {lab=bias_p_src}
N -420 -20 -320 -20 {lab=bias_p_casc}
N 640 -40 720 -40 {lab=biasn_ref}
N -90 200 -90 220 {lab=vdd}
N -90 280 -90 290 {lab=GND}
N 410 280 410 290 {lab=GND}
N 410 200 410 220 {lab=bias_p_src}
N 570 280 570 290 {lab=GND}
N 570 200 570 220 {lab=bias_p_casc}
N 710 280 710 290 {lab=GND}
N 710 200 710 220 {lab=bias_n_casc}
N -170 90 -170 120 {lab=GND}
N 370 80 380 80 {lab=#net1}
N 380 40 380 80 {lab=#net1}
N 380 40 400 40 {lab=#net1}
N 370 20 370 50 {lab=#net2}
N 370 20 400 20 {lab=#net2}
N 400 60 400 110 {lab=v_feedback}
N 400 110 410 110 {lab=v_feedback}
N 520 100 520 120 {lab=GND}
N 180 120 520 120 {lab=GND}
N 180 120 180 130 {lab=GND}
N -170 120 180 120 {lab=GND}
N 290 -20 290 10 {lab=#net3}
N 270 -20 290 -20 {lab=#net3}
N 370 0 400 0 {lab=#net4}
N 370 0 370 10 {lab=#net4}
N 290 50 290 80 {lab=#net2}
N 270 20 290 20 {lab=#net2}
N 290 -20 400 -20 {lab=#net3}
N 290 50 370 50 {lab=#net2}
N 290 20 290 50 {lab=#net2}
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
tran 10n 5m
plot outp outn
plot v_feedback
.endc
"}
C {devices/code_shown.sym} -790 -100 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerCAP.lib cap_typ
.inc sg13g2_stdcell.spice
"}
C {ota_folded_cascoded.sym} -170 20 0 0 {name=x1}
C {sc_cmfb_cmos.sym} 520 0 0 0 {name=x2}
C {lab_wire.sym} 720 -40 0 0 {name=p15 sig_type=std_logic lab=biasn_ref}
C {lab_wire.sym} 720 -60 0 0 {name=p16 sig_type=std_logic lab=vcm_ref}
C {lab_wire.sym} -420 20 0 1 {name=p22 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} -420 0 0 1 {name=p26 sig_type=std_logic lab=bias_p_src}
C {lab_wire.sym} -420 -20 0 1 {name=p27 sig_type=std_logic lab=bias_p_casc}
C {lab_pin.sym} -490 200 0 0 {name=p6 sig_type=std_logic lab=inp}
C {clk_gen.sym} 220 10 0 0 {name=x3}
C {lab_wire.sym} -420 -60 0 1 {name=p2 sig_type=std_logic lab=inp}
C {lab_wire.sym} 190 -110 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -420 -40 0 1 {name=p9 sig_type=std_logic lab=inn}
C {vsource.sym} 10 250 0 0 {name=VCLK value=PULSE"PULSE(0 3 0 1n 1n 500n 1u)" savecurrent=false}
C {lab_wire.sym} 20 -20 0 1 {name=p10 sig_type=std_logic lab=clk_in}
C {lab_pin.sym} 10 200 0 0 {name=p11 sig_type=std_logic lab=clk_in}
C {gnd.sym} 10 290 0 0 {name=l3 lab=GND}
C {vsource.sym} 260 250 0 0 {name=V_biasn_ref value=0.7 savecurrent=false}
C {gnd.sym} 260 290 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 260 200 0 0 {name=p12 sig_type=std_logic lab=biasn_ref}
C {vsource.sym} -90 250 0 0 {name=VDD value=3 savecurrent=false}
C {gnd.sym} -90 290 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -90 200 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {lab_wire.sym} 410 110 0 1 {name=p14 sig_type=std_logic lab=v_feedback}
C {vsource.sym} 410 250 0 0 {name=V_pbias_src value=2.1 savecurrent=false}
C {gnd.sym} 410 290 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 570 200 0 0 {name=p17 sig_type=std_logic lab=bias_p_casc}
C {vsource.sym} 570 250 0 0 {name=V_pbias_casc value=1.7 savecurrent=false}
C {gnd.sym} 570 290 0 0 {name=l7 lab=GND}
C {lab_pin.sym} 410 200 0 0 {name=p18 sig_type=std_logic lab=bias_p_src}
C {vsource.sym} 710 250 0 0 {name=V_nbias_casc value=1.0 savecurrent=false}
C {gnd.sym} 710 290 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 710 200 0 0 {name=p19 sig_type=std_logic lab=bias_n_casc}
C {lab_wire.sym} 190 -60 0 0 {name=p20 sig_type=std_logic lab=outp}
C {lab_wire.sym} 190 -40 0 0 {name=p21 sig_type=std_logic lab=outn}
C {gnd.sym} 180 130 0 0 {name=l1 lab=GND}
C {sg13g2_stdcells/sg13g2_inv_1.sym} 330 10 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 330 80 0 0 {name=x5 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_wire.sym} -420 40 0 1 {name=p8 sig_type=std_logic lab=v_feedback}
