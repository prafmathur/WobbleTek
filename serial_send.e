

serial_send          cp     i           num_0                    //initialize i
send_serial_port_loop cpfa  i_val       MIDI_array     i         //dereference i
                     be     end_serial  i_val          _0xFFFF   //check for end flag
                     sr     data_send   i_val          num_8     //isolate left byte
                     call   send_serial_driver send_serial_driver_ret  //send first byte
                     and    data_send   i_val          _0x00FF   //isolate right byte
                     be     end_check   data_send      _0x00FF   //check for first hald of end flag
serial_port_cont     call   send_serial_driver send_serial_driver_ret  //send second byte
                     add    i           i              num_1     //increment i
                     be     send_serial_port_loop 0    0
                     


end_check            add    i_temp      i              num_1      //copy i+1 to i_temp
                     cpfa   temp        MIDI_array     i_temp     //dereference i_temp
                     sr     temp        temp           num_8      //isolate left byte
                     be     end_serial  temp           _0x00FF    //check for second half of end flag
                     be     serial_port_cont 0         0          //return to main loop

end_serial           cp     data_send   _0x00FF
                     call   send_serial_driver send_serial_driver_ret
                     call   send_serial_driver send_serial_driver_ret
                     ret    serial_send_ret


//data

waittemp .data 0
serial_send_ret .data 0
//i     .data    0
//i_val .data    0
//temp  .data    0
//i_temp .data   0
//_0x00FF .data  255
// .data    0
//num_1 .data    1
//_0xFFFF .data  -1

