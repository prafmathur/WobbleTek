//--Serial port driver. Sterling Springgate March 21--

//--set command parameter to 1 through port 90--
serial_port_receive         out      90            num_1   

//--set response to 1 when ready through 91--
response_onn         in       91       computer_response
                    bne     response_onn   computer_response   num_1
//----recieve data through 92---                   
recieve_data        in      92           data_receive
                    out		2     data_receive
//--set command parameter back to 0--
					out     90            num_0
//--wait for response to be 0--
response_offf 	    in    	91 	computer_response   //get response until 0
  					bne 	response_offf  computer_response    num_0
					ret		serial_port_receive_ra
                   //bne       serial_port      count      num_4
                   //	halt		



count              .data   0
command            .data   90
response           .data   91
receive            .data   92
computer_response  .data   0
data_receive       .data   0
                   .data   0
