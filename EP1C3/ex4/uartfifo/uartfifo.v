`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company		: 
// Engineer		: 特权 franchises3
// Create Date	: 2009.05.21
// Design Name	: 
// Module Name	: uartfifo
// Project Name	: uartfifo
// Target Device: Cyclone EP1C3T144C8 
// Tool versions: Quartus II 8.1
// Description	: 
//				
// Revision		: V1.0
// Additional Comments	:  
// 欢迎加入EDN的FPGA/CPLD助学小组一起讨论：http://group.ednchina.com/1375/
////////////////////////////////////////////////////////////////////////////////
module uartfifo(
				clk,rst_n,
				rs232_tx
			);

input clk;			// 25MHz主时钟
input rst_n;		//低电平复位信号

output rs232_tx;		//RS232发送数据信号


wire[7:0] wrf_din;	//数据写入缓存FIFO输入数据总线
wire wrf_wrreq;		//数据写入缓存FIFO数据输入请求，高有效
wire[7:0] tx_data;	//串口待发送数据
wire tx_start;		//串口发送数据启动标志位，高有效
wire fifo232_rdreq;	//FIFO读请求信号，高有效
wire fifo_empty;	//FIFO空标志位，高有效

assign tx_start = ~fifo_empty;	//fifo有数据即启动串口模块发送数据

//例化232发送数据产生模块
datagene		uut_datagene(
						.clk(clk),
						.rst_n(rst_n),
						.wrf_din(wrf_din),
						.wrf_wrreq(wrf_wrreq)
						);
						
//例化FIFO						
fifo232			fifo232_inst (
						.clock(clk),
						.data(wrf_din),
						.rdreq(fifo232_rdreq),
						.wrreq(wrf_wrreq),
						.empty(fifo_empty),
						.q(tx_data)
						);						


//例化串口发送模块
uart_ctrl		uut_uartfifo(
						.clk(clk),
						.rst_n(rst_n),
						.tx_data(tx_data),
						.tx_start(tx_start),
						.fifo232_rdreq(fifo232_rdreq),
						.rs232_tx(rs232_tx)
						);





endmodule
