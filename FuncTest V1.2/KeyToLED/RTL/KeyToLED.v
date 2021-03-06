/****************************************Copyright (c)**************************************************
**                                      Dongdong   Studio 
**                                     
**---------------------------------------File Info-----------------------------------------------------
** File name:			KeyToLED
** Last modified Date:	2012-7-8
** Last Version:		1.0
** Descriptions:		Respond to the Key and send to the LED
**------------------------------------------------------------------------------------------------------
** Created by:		    dongdong
** Created date:		2009-10-18
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
module KeyToLED( 
//input 
input         [3:0]       key  ,
//output 
output wire   [7:0]       LED  

              );

//reg define 

//parameter define 

/*******************************************************************************************************
**                              Main Program    
**  
********************************************************************************************************/

// key 0 ctrl LED 0 & LED 4
// key 1 ctrl LED 1 & LED 5
// key 2 ctrl LED 2 & LED 6
// key 3 ctrl LED 3 & LED 7

// when key is pressed , key input low level, else key input high level
assign LED = ~{ key, key } ;                //key value display in beep

endmodule
//end of RTL code                       
