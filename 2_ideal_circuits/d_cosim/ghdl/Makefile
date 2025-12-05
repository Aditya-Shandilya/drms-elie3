build:
	ngspice -- ghnggen -top timer_core 555.vhd
	ngspice ghnggen pwm.vhd
	ngspice ghnggen adc.vhd
	ngspice ghnggen mc.vhd

clean:
	*.obj *.so* *.vpi *.DLL *.cf *.raw
