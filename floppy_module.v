



module floppy_module(
     input wire clock_98k,
     input wire reset,
     input wire [15:0]current_period_out,    //Inputs that control the current amount of time in the period.
     output reg [1:0] GPIO_0)
     
     reg [7:0] current_position;       //Registers to store the current position of the floppy drive read/write head
     reg current_state_step;           //Registers to store the value of each GPIO pin (high/low)
     reg current_state_direction;
     reg [15:0] current_tick;          //Register that stores the number of clock ticks that have passed
     
     always @(posedge clock_98k) begin
               //Handle all control signals for the floppy drives
               if (reset == 1'b0) begin                                   //only work if reset signal is 0
                    if (current_period_out > 16'b0) begin
                         current_tick <= current_tick + 16'b1;
                         if (current_tick >= current_period_out) begin
                              //Switch directions if end has been reached
                              if (current_position >= 8'd158) begin
                                   current_state_direction <= 1'b1;
                                   GPIO_0[1] <= 1'b1;                          //direction pin is set to HIGH
                              end else if (current_position <= 8'b0) begin
                                   current_state_direction <= 1'b0;
                                   GPIO_0[1] <= 1'b0;                          //direction pin is set to LOW
                              end
                              //Update current_position
                              if (current_state_direction == 1'b1 && current_position > 8'd0) begin
                                   current_position <= current_position - 8'b1;
                              end else if (current_position < 8'd158) begin
                                   current_position <= current_position + 8'b1;
                              end
                              //Pulse the control pin
                              GPIO_0[0] <= current_state_step;                    //step pin is pulsed
                              current_state_step <= ~current_state_step;
                              current_tick <= 16'b0;
                         end
                    end
     
               //reset
               end else begin
                    //move read/write head back to 0
                    if (current_position > 8'b0) begin
                         GPIO_0[1] = 1'b1;                      //Direction pin is set to HIGH to go in reverse
                         GPIO_0[0] <= ~GPIO_0[0];               //Pulse step pin
                         current_position <= current_position - 8'b1;
                    end
     
     end
endmodule
