cd    C:/Users/zxope/Desktop/exam01/prj08/sim
vlib  my_work;
vmap  my_work  my_work;
vlog  -work  my_work    ../src/*.v;
vsim  -voptargs=+acc  my_work.decoe3to8_tb;
view  wave  ;
delete wave  /*; 
add wave  -dec   /decoe3to8_tb/*;

run  100ns;






