comp:
	vcs -full64 -debug_all \
	-l comp.log -f filelist.f \
	-P /opt/synopsys/VERDI3_I_2014_03/share/PLI/VCS/LINUX64/novas.tab \
	   /opt/synopsys/VERDI3_I_2014_03/share/PLI/VCS/LINUX64/pli.a \

sim:
	./simv -l sim.log

wave:
	verdi -v -f ../../rtl/counter8.v ../tb/counter8_tb.v -ssf wave.fsdb

clr:
	rm -rf csrc simv* ucli.key *.log *.dump 
