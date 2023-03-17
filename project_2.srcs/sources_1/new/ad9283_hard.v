`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 01:08:36
// Design Name: 
// Module Name: ad9283_hard
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ad9283_hard(
        input           CLK       ,
		input           RST_n     ,
		// ADC 9283 interface
		output           ADC_CLK   ,

		input      [7:0] ADC_Din   ,
		output reg [7:0] data_out
    );
    
      //Internal signals
    reg       clock     ;
    reg [50:0]counter   ;
    
    // Assignment of the final result on the output signal.   
    assign ADC_CLK      = clock;
    
    // Counter logic to generate clock signal for ADC
    always@(posedge CLK)
    begin 
        if(RST_n)
            counter <= 0;
        else
        begin
            counter <= counter + 1'b1;
           clock   <= counter[2];
        end
    end
    
    always@(posedge CLK)
    begin
        if(RST_n)
            data_out    <=  0;
        else
            data_out    <=  121;        
    end  
    
    
    
endmodule
