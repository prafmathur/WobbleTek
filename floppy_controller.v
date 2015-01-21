//AUTHOR:      This controller software is written by Austin Rovinski (Team WobbleTek) for ENGR 100.
//PURPOSE:     This software is written for use with the Altera DE2 board. It is responsible for receiving
//             input from the floppy sequencer and outputting control signals to the floppy drives.
//DESCRIPTION: This code makes use of several arrays of registers to store information about the position
//             of the read/write head, period of the current note, and the state of the step and drive pins.
//             Every time the busy state is cycled, the program checks if the step pin needs to be pulsed,
//             if the direction needs to be reversed, as well as updates the value of registers.
//INPUTS:      Clocks (98 kHz and 12.5 MHz), period of note for drives 1-8 (microseconds), floppy_command,
//             reset command, clock_valid signal
//OUTPUTS:     Control signals to floppy drives 1-8
//
//OTHER NOTES: 1) Need to merge floppy module to inside this module rather than in top.v

module floppy_controller(
     input wire clock_98k,             //Clock for the PWM. The input to play a specific note frequency
                                       //is the clock speed (in Hz) divided by the note frequency. e.g.
                                       //to play a note of 440 Hz, the input must be (clock speed)/(note)
                                       // = 98000/440 ~= 223
     input wire clock_valid,           //signal to verify that clock is stable
     input wire reset,                 //reset signal
                                      
     input wire [15:0] current_period_in_1,  //Inputs that control the current amount of time in the period.
     input wire [15:0] current_period_in_2,
     input wire [15:0] current_period_in_3,
     input wire [15:0] current_period_in_4,
     input wire [15:0] current_period_in_5,
     input wire [15:0] current_period_in_6,
     input wire [15:0] current_period_in_7,
     input wire [15:0] current_period_in_8,
     
     input wire floppy_command,
     output reg floppy_response,
     
     output reg [15:0] current_period_out_1,  //Outputs to individual floppy modules.
     output reg [15:0] current_period_out_2,
     output reg [15:0] current_period_out_3,
     output reg [15:0] current_period_out_4,
     output reg [15:0] current_period_out_5,
     output reg [15:0] current_period_out_6,
     output reg [15:0] current_period_out_7,
     output reg [15:0] current_period_out_8,
     
     output reg [15:0] hexdigit_out,
     output reg [15:0] hexdigit_out1,
     output reg [15:0] LED_RED);
     
     parameter state_reset =        3'h0;
     parameter state_wait =         3'h1;
     parameter state_receive =      3'h2;
     parameter state_acknowledge1 = 3'h3;
     parameter state_acknowledge2 = 3'h4;
     
     reg [2:0] state;
     reg [2:0] next_state;
     reg period_write;
     reg response_write;

     always @* begin
     
          //default values
          next_state = state_reset;
          period_write = 1'b0;
          response_write = 1'b0;
          
          hexdigit_out[15:0] = current_period_out_2[15:0];
          hexdigit_out1[15:0] = current_period_out_2[15:0];
          LED_RED[8:5] = state;
                
          case (state) 
               
               state_reset: begin
                    next_state = state_wait;
               end
                              
               state_wait: begin
                    if (floppy_command == 1'b0) begin
                         next_state = state_wait;
                    end else begin
                         next_state = state_receive;
                    end
               end
               
               //Get data from driver ports and store them in registers
               state_receive: begin
                    period_write = 1'b1;
                    next_state = state_acknowledge1;
               end
               
               //Set floppy_response to 1 to signal that all data has been received
               state_acknowledge1: begin
                    response_write = 1'b1;
                    next_state = state_acknowledge2;
               end
               
               //wait until floppy_command becomes 0 to show that response has been acknowleged
               state_acknowledge2: begin
                    if (floppy_command == 1'b1) begin
                                     response_write = 1'b1;
                         next_state = state_acknowledge2;
                    end else begin
                         next_state = state_wait;
                    end
               end
          endcase
     end
     
     always @(posedge clock_98k) begin

          //synchronize period registers with I/O
          if (period_write == 1'b1) begin
               current_period_out_1 <= current_period_in_1;
               current_period_out_2 <= current_period_in_2;
               current_period_out_3 <= current_period_in_3;
               current_period_out_4 <= current_period_in_4;
               current_period_out_5 <= current_period_in_5;
               current_period_out_6 <= current_period_in_6;
               current_period_out_7 <= current_period_in_7;
               current_period_out_8 <= current_period_in_8;
          end
          if (response_write == 1'b1) begin
 	    	     floppy_response <= 1'b1;
          end else begin
               floppy_response <= 1'b0;
          end

          //if clock valid is 1 and reset is 0, state <= next state
          if (clock_valid == 1'b0) begin
          end else if (reset == 1'b1) begin
               current_period_out <= 16'b0;
               state <= state_reset;
          end else begin
               state <= next_state;
          end
     end
endmodule
