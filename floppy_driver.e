//Inputs are MIDI note number
//Outputs are current_period_1 through current_period_8 to floppy_controller
                     
floppy_driver    cpfa      temp                drive_note      curr_drive   //store the MIDI note in a temp value
                 cpfa      temp                MIDI_lookup     temp         //change temp to store the pulse delay instead of MIDI note
                 cpta      temp                note_out        curr_drive   //store the pulse delay in the note_out array
                 //Lookup table changes MIDI note number to output value, which is equal to
                 //(0.5 * clock speed)/(Desired note frequency). Clock is halved because the output signal period is
                 //2 clock cycles

                 out       201                 drive_1_note_out             //Output all pulse delays to out ports
                 out       202                 drive_2_note_out
                 out       203                 drive_3_note_out
                 out       204                 drive_4_note_out
                 out       205                 drive_5_note_out
                 out       206                 drive_6_note_out
                 out       207                 drive_7_note_out
                 out       208                 drive_8_note_out
                 out       209                 num_1                        //Set command to 1
floppy_wait      in        210                 floppy_in                    //Wait for floppy command not be 0
                 be        floppy_wait         floppy_in       num_0
                 out       209                 num_0                        //Set command to 0
floppy_wait2     in        210                 floppy_in                    //Wait for response to be 0
                 be        floppy_wait2        floppy_in       num_1
                 ret       floppy_driver_ra                                 //return (for normal driver use)

//DRIVE MAPPINGS:
//Drive 1 port:    201
//Drive 2 port:    202
//Drive 3 port:    203
//Drive 4 port:    204
//Drive 5 port:    205
//Drive 6 port:    206
//Drive 7 port:    207
//Drive 8 port:    208
//floppy_command:  209
//floppy_response: 210