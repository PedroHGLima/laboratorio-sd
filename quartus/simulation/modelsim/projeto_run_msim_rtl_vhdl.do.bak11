transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/OneDrive/Office/Estudos/Sistema Digitais/laboratorio-sd/quartus/subtraction.vhdl}
vcom -93 -work work {D:/OneDrive/Office/Estudos/Sistema Digitais/laboratorio-sd/quartus/fa.vhd}
vcom -93 -work work {D:/OneDrive/Office/Estudos/Sistema Digitais/laboratorio-sd/quartus/fourbitfa.vhd}
vcom -93 -work work {D:/OneDrive/Office/Estudos/Sistema Digitais/laboratorio-sd/quartus/Selecao.vhd}

vcom -93 -work work {D:/OneDrive/Office/Estudos/Sistema Digitais/laboratorio-sd/quartus/Selecao.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  Selecao

add wave *
view structure
view signals
run -all
