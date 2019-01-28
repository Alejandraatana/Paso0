#Alejandra Rodriguez Sanchez Ing. en Computacion
all:tb_trans

tb_trans:bib_mult.o datos.o resultado.o coeficientes.o buffDat.o operaciones.o contMod11.o ffD.o contMod250.o control.o trans.o tb_trans.o
	ghdl -e --ieee=synopsys tb_trans 
	./tb_trans --stop-time=60500ns --vcd=tb_trans.vcd
	gtkwave tb_trans.vcd ondas.sav

trans.o:trans.vhdl
	ghdl -a --ieee=synopsys trans.vhdl

tb_trans.o:tb_trans.vhdl
	ghdl -a --ieee=synopsys tb_trans.vhdl

bib_mult.o:bib_mult.vhdl
	ghdl -a --ieee=synopsys bib_mult.vhdl

datos.o:datos.vhdl
	ghdl -a --ieee=synopsys datos.vhdl

resultado.o:resultado.vhdl
	ghdl -a --ieee=synopsys resultado.vhdl

control.o:control.vhdl
	ghdl -a --ieee=synopsys control.vhdl
	
contMod11.o:contMod11.vhdl
	ghdl -a --ieee=synopsys contMod11.vhdl
		
contMod250.o:contMod250.vhdl
	ghdl -a --ieee=synopsys contMod250.vhdl

coeficientes.o:coeficientes.vhdl
	ghdl -a --ieee=synopsys coeficientes.vhdl
	
buffDat.o:buffDat.vhdl
	ghdl -a --ieee=synopsys buffDat.vhdl
	
operaciones.o:operaciones.vhdl
	ghdl -a --ieee=synopsys operaciones.vhdl
	
ffD.o:ffD.vhdl
	ghdl -a --ieee=synopsys ffD.vhdl
	
clean:
	rm *.o tb_trans *.vcd *.cf
