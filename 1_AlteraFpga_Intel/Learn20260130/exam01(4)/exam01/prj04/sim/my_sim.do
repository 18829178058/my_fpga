cd    C:/Users/zxope/Desktop/exam01/prj04/sim
vlib  work;
vmap  work  work;
vlog  -work  work    ../src/*.v;
vsim  -voptargs=+acc  work.mux_tb;
view  wave  ;
delete wave  /*; 
add wave  -dec   /mux_tb/*;
run  1000ns;






