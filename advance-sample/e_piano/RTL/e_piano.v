/****************************************Copyright (c)**************************************************
**                                      Dongdong   Studio 
**                                     
**---------------------------------------File Info-----------------------------------------------------
** File name:			e_piano
** Last modified Date:	2009-10-20
** Last Version:		1.0
** Descriptions:		e_piano
**------------------------------------------------------------------------------------------------------
** Created by:		    dongdong
** Created date:		2009-10-20
** Version:				1.0
** Descriptions:		The original version
**
**------------------------------------------------------------------------------------------------------
** Modified by:			
** Modified date:		
** Version:				
** Descriptions:		
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/
module e_piano      ( 
					//input 
					sys_clk,
					sys_rst_n,
					key,
				    //output 
					beep
                    );

//input ports

input                    sys_clk;      //system clock;
input                    sys_rst_n;    //system reset, low is active;
input [WIDTH-1:0]        key;          //system reset, low is active;

//output ports
output                   beep;

//reg define 

reg    [22:0]                  count;    
reg                            song_reg;
reg  [19:0]                    delay;
//wire define 

wire                           beep;

//parameter define 
parameter WIDTH = 4;

/*******************************************************************************************************
**                              Main Program    
**  
********************************************************************************************************/
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) begin 
        count <= 22'b0;
    end
    else if((count == delay)&&(!(delay ==20'd65535))) begin
        count <= 22'd0;
    end
    else
        count <= count+1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (sys_rst_n ==1'b0) begin 
        song_reg <= 1'b0;
    end
    else if((count == delay)&&(!(delay ==20'd65535))) begin
        song_reg <= !song_reg;
    end
end
 
always @(key) begin
    case(key)
    4'b0001: delay=20'd47774;  //zhong yin 1     523.3HZ
    4'b0010: delay=20'd42568;  //zhong yin 2     587.3HZ
    4'b0100: delay=20'd37919;  //zhong yin 3     659.3HZ
    4'b1000: delay=20'd35791;  //zhong yin 4     698.5HZ
    default: delay=20'd65535;
    endcase
end

assign beep = song_reg; 


endmodule
//end of RTL code                       