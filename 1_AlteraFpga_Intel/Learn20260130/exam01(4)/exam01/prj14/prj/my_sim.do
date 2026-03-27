cd    C:/Users/zxope/Desktop/exam01/prj14/prj
vlib  my_work;
vmap  my_work  my_work;
vlog  -work  my_work    ../src/*.v;
vsim  -voptargs=+acc  my_work.clk_gen_tb;
view  wave  ;
delete wave  /*; 
add wave  -dec   /clk_gen_tb/*;
run  1000ns;






