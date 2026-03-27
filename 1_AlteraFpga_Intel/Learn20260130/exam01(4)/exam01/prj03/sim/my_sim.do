cd    C:/Users/zxope/Desktop/exam01/prj03/sim
vlib  my_work;
vmap  my_work  my_work;
vlog  -work  my_work    ../src/*.v;
vsim  -voptargs=+acc  my_work.mux_tb;
view  wave  ;
delete wave  /*; 
add wave  -dec   /mux_tb/*;
run  1000ns;






