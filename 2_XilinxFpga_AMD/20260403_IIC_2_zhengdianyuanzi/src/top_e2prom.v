 module top_e2prom(
	input sys_clk , //系统时钟
	input sys_rst_n , //系统复位
	//eeprom interface
	output iic_scl , //eeprom 的时钟线 scl
	inout iic_sda , //eeprom 的数据线 sda
	//user interface
	output led //led 显示 eeprom 读写测试结果
	);
	
	//parameter define
	parameter SLAVE_ADDR = 7'b1010000 ; //器件地址(SLAVE_ADDR)
	parameter BIT_CTRL = 1'b1 ; //字地址位控制参数(16b/8b)
	parameter CLK_FREQ = 26'd50_000_000 ; //i2c_dri 模块的驱动时钟频率(CLK_FREQ)
	parameter I2C_FREQ = 18'd250_000 ; //I2C 的 SCL 时钟频率
	parameter L_TIME = 17'd125_000 ; //led 闪烁时间参数
	parameter MAX_BYTE = 16'd256 ; //读写测试的字节个数
	
	//wire define
	wire dri_clk ; //I2C 操作时钟
	wire i2c_exec ; //I2C 触发控制
	wire [15:0] i2c_addr ; //I2C 操作地址
	wire [ 7:0] i2c_data_w; //I2C 写入的数据
	wire i2c_done ; //I2C 操作结束标志
	wire i2c_ack ; //I2C 应答标志 0:应答 1:未应答
	wire i2c_rh_wl ; //I2C 读写控制
	wire [ 7:0] i2c_data_r; //I2C 读出的数据
	wire rw_done ; //EEPROM 读写测试完成
	wire rw_result ; //EEPROM 读写测试结果 0:失败 1:成功
	
	//*****************************************************
	//** main code
	//*****************************************************
	
	//EEPROM 读写测试模块
	e2prom_rw #(
	.MAX_BYTE (MAX_BYTE ) //读写测试的字节个数
	) u_EEPROM_rw(
	.clk (dri_clk ), //时钟信号
	.rst_n (sys_rst_n ), //复位信号
	//i2c interface
	.i2c_exec (i2c_exec ), //I2C 触发执行信号
	.i2c_rh_wl (i2c_rh_wl ), //I2C 读写控制信号
	.i2c_addr (i2c_addr ), //I2C 器件内地址
	.i2c_data_w (i2c_data_w), //I2C 要写的数据
	.i2c_data_r (i2c_data_r), //I2C 读出的数据
	.i2c_done (i2c_done ), //I2C 一次操作完成
	.i2c_ack (i2c_ack ), //I2C 应答标志
	//user interface
	.rw_done (rw_done ), //EEPROM 读写测试完成
	.rw_result (rw_result ) //EEPROM 读写测试结果 0:失败 1:成功
	);
	
	//i2c 驱动模块
	i2c_dri #(
	.SLAVE_ADDR (SLAVE_ADDR), //EEPROM 从机地址
	.CLK_FREQ (CLK_FREQ ), //模块输入的时钟频率
	.I2C_FREQ (I2C_FREQ ) //IIC_SCL 的时钟频率
	) u_i2c_dri(
	.clk (sys_clk ), 
	.rst_n (sys_rst_n ), 
	//i2c interface
	.i2c_exec (i2c_exec ), //I2C 触发执行信号
	.bit_ctrl (BIT_CTRL ), //器件地址位控制(16b/8b)
	.i2c_rh_wl (i2c_rh_wl ), //I2C 读写控制信号
	.i2c_addr (i2c_addr ), //I2C 器件内地址
	.i2c_data_w (i2c_data_w), //I2C 要写的数据
	.i2c_data_r (i2c_data_r), //I2C 读出的数据
	.i2c_done (i2c_done ), //I2C 一次操作完成
	.i2c_ack (i2c_ack ), //I2C 应答标志
	.scl (iic_scl ), //I2C 的 SCL 时钟信号
	.sda (iic_sda ), //I2C 的 SDA 信号
	//user interface
	.dri_clk (dri_clk ) //I2C 操作时钟
	);
	
	//led 指示模块
	rw_result_led #(.L_TIME(L_TIME ) //控制 led 闪烁时间
	) u_rw_result_led(
	.clk (dri_clk ), 
	.rst_n (sys_rst_n ),
	
	.rw_done (rw_done ), 
	.rw_result (rw_result ),
	.led (led )
	);
	
	endmodule