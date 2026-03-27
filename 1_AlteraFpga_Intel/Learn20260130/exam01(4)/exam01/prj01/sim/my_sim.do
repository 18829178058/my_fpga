cd    C:/Users/zxope/Desktop/exam01/prj01/sim
vlib  my_work;
vmap  my_work  my_work;
vlog  -work  my_work    ../src/*.v;
vsim  -voptargs=+acc  my_work.sub_tb;
view  wave  ;
delete wave  /*; 
add wave  -dec   /sub_tb/*;
add wave  -dec   /sub_ins/*;

run  100ns;






