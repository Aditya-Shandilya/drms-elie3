build:
	ngspice -- vlnggen -top timer_core 555.v
	ngspice vlnggen pwm.v
	ngspice vlnggen adc.v
	ngspice vlnggen mc.v

clean:
	*.obj *.so* *.vpi *.DLL *.cf *.raw
