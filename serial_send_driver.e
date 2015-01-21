//--100-102. serial_send_command and serial_send_response implement the standard I/O protocol. The command parameter is serial_send_data, which contains an 8-bit value. There are no response parameters.100out	 bit 0: serial_send_command 101	in	bit 0: serial_send_response 102	out	 bits 7-0: serial_send_data[7:0]
send_serial_driver out    102   data_send               //set command parameter
                   out    100       on
send_response_on   in     101                send_computer_response
                   bne    send_response_on     send_computer_response   on
                   
                   out   100         off
send_response_off  in    101         send_computer_response
                   bne   send_response_off    send_computer_response   off
                   ret   send_serial_driver_ret
 //--data--//                  
//on                 .data   1
//off                .data   0
send_computer_response  .data  0   
send_command      .data   100
send_response     .data   101
send              .data   102
send_serial_driver_ret .data 0
data_send         .data   4
				  .data   5
				  .data   6
				  .data   7
