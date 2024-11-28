onerror {quit -f}
vlib work
vlog -work work orientacion.vo
vlog -work work orientacion.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ubicacion_vlg_vec_tst
vcd file -direction orientacion.msim.vcd
vcd add -internal ubicacion_vlg_vec_tst/*
vcd add -internal ubicacion_vlg_vec_tst/i1/*
add wave /*
run -all
