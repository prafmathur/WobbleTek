//--data_receive is an 8 value but we need 16 bit value so we will shift create temp shift it to the left to move from 00000000data to data00000000. then we will call serial_port again and with the new data_receive value add it on to temp to create a 16 bit value we can use--

//--calls serial_port driver--
array         call      serial_port_receive     serial_port_receive_ret
//--if call_index is two meaning we have gotten 2 values we go to combine to combine temp and data_receive
              be        combine         call_index    two 
//--copies data_recieve in to first_temp--
              cp        first_temp      data_receive
//--shifts first_temp left from 00000000data to data00000000
              sl        first_temp      first_temp    num_8
combine_cont1 be        receive_end     first_temp    _0xFF00
              cp        call_index      two
              be        array           0             0
//--combine first_temp and data_recieve to create a 16 bit value and send to the array at the next available index. index array_index by one then reset call_index back to zero
combine       be        receive_save    data_receive  _0x00FF
combine_cont2 add       data_receive    first_temp    data_receive
              cpta      data_receive    MIDI_array    array_index
              add       array_index     array_index   num_1
              cp        call_index      num_1
              be        array_return    data_receive  _0xFFFF
              be        array           0             0
array_return  ret       array_ra         
              
receive_save  cp        second_temp     data_receive
              be        combine_cont2   0             0

receive_end   add       second_temp     second_temp   first_temp
              bne       combine_cont1   second_temp   _0xFFFF
              cpta      _0xFF00         MIDI_array    array_index
              ret       array_ra

//num_8        .data   8
first_temp   .data   0
second_temp  .data   0
array_index  .data   0
call_index   .data   1
_0xFF00      .data   -256




