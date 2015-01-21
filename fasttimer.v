

/* Copyright (c) 2006, Peter M. Chen.  All rights reserved.  This software is
 * supplied as is without expressed or implied warranties of any kind.
 */
 //This code has been modified to run at a faster clock speed
 
module timerfast(
    input wire clock,
    input wire clock_781k,
    input wire clock_valid,
    input wire reset,
    output reg [15:0] timer_out);           // real-time clock (each clock tick
                                            // is 1.28 us, i.e. 781250 Hz)
    wire clock_781k_sync;
    reg clock_781k_sync_last;
    reg clock_781k_sync_last1;

    synchronizer u1 (clock, clock_781k, clock_781k_sync);

    always @(posedge clock) begin
	clock_781k_sync_last1 <= clock_781k_sync_last;
	clock_781k_sync_last <= clock_781k_sync;
    end

    // Detect a positive edge of clock_781k by sampling it, rather than
    // via (posedge clock_781k).  This reduces timing warnings when using
    // a 50 MHz clock.
    always @(posedge clock) begin

        if (clock_valid == 1'b0) begin
	end else if (reset == 1'b1) begin
            timer_out[14:0] <= 15'h0;
        end else if (clock_781k_sync_last1 == 1'b0 && clock_781k_sync_last == 1'b1) begin
	    timer_out[14:0] <= timer_out[14:0] + 15'h1;
        end
    end

    // timer_out goes from 32767 back to 0 (no negative values)
    always @* begin
        timer_out[15] = 1'b0;
    end

endmodule