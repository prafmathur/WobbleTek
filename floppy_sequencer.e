//AUTHOR:      This floppy sequencer software is written by Austin Rovinski for ENGR 100.
//PURPOSE:     This software is written for use with the E100 microprocessor. It is responsible for receiving
//             a pointer to an array that points to the memory location of the first byte of data of each
//             track for up to 8 tracks.
//DESCRIPTION: 
//INPUTS:      trkhead (pointer to an array of pointers to the first bytes of each track), timer
//OUTPUTS:     pulse delay (in microseconds) of each floppy drive
//
//OTHER NOTES: 

floppy_sequencer     cp        i_temp          num_1                         //initialize i_temp
                     cp        i               num_4
                     cp        curr_drive      num_1
init_loop            cpfa      temp            trkhead         i_temp        //copy trkhead array into position array
                     sub       temp            temp            num_1         //decrement temp so that get_word works on first run
                     cpta      temp            trkpos          i_temp        
                     cpfa      temp            trkheadhalf     i_temp        //copy trkheadhalf array into halfwordarray
                     cpta      temp            ishalfwordarray i_temp
                     add       i_temp          i_temp          num_1         //increment i_temp
                     blt       init_loop       i_temp          tracks_valid  //loop back until all tracks are copied
                     in        5               start_time1                   //get slow start time
                     in        211             start_time2                   //get fast start time

                     //start note loop
noteloop             cpfa      temp            end             curr_drive    //Check for end of track
                     be        skiptrack       temp            one
                     cpfa      i               trkpos          curr_drive    //load new track position
                     cpfa      ishalfword      ishalfwordarray curr_drive    //load new ishalfword
                     cpfa      togglehalfword  togglehwarray   curr_drive    //load new halfword toggle flag
                     cpfa      start_time1     start_time1_array curr_drive  //load new slow start time
                     cpfa      start_time2     start_time2_array curr_drive  //load new fast start time
                     cpfa      cc1             cc1_array       curr_drive    //load the slow time wait of the note
                     cpfa      cc2             cc2_array       curr_drive    //load the fast time wait of the note
                     cpfa      temp            waiting         curr_drive    //Check to see if a setnote is waiting for delta_t time
                     be        timediff        temp            num_1         //Else, carry on


                     //get delta t for the note event
get_time             call      get_word        get_word_ra                   //call a function to get the next complete word
                     blt       bigend          i_val           num_0         //checks for big endian number (the time is stored as two bits instead of one)
                     sr        delta_t         i_val           num_8         //isolate the single-byte time and store it in delta_t
                     cp        togglehalfword  num_1                         //toggle ishalfword, because the time was a half word long
                     be        get_event       0               0             //go on to get_event
                     
bigend               and       bigendcheck     i_val           _0x0080
                     bne       bigend_2        bigendcheck     _0x0080
                     
                     cp        togglehalfword  one
                     call      get_word        get_word_ra 
                     
bigend_2             and       bigendtemp      i_val           _0x7F00       //Isolate left byte without big-endian bit
                     and       i_val           i_val           _0x007F       //Isolate right byte without big-endian bit
                     sr        bigendtemp      bigendtemp      num_1         //shift the left byte to remove extra bit
                     be        bigend_cont     bigendcheck     num_0
                     add       bigendtemp      bigendtemp      _0x4000
bigend_cont          add       delta_t         bigendtemp      i_val         //set delta t to the converted number
                     
                     //check event type
get_event            call      get_word        get_word_ra                   //Get the next complete word
                     be        endoftrack      i_val           _0xFF2F       //if end of track message, goto endoftrack
                     be        tempochange     i_val           _0xFF51       //if i_val is 0xFF51, goto tempo change
                     sr        temp            i_val           num_8         //isolate left byte, store in temp variable
                     be        checkvelocity   temp            noteoncheck   //if event == note on, goto check_velocity
                     be        noteoff         temp            noteoffcheck  //if event == note off, goto note off

                     //else, figure out event type so it can be skipped
                     sr        temp            i_val           _0x000C       //Isolate the event mask, which is stored in the first nibble
                     be        meta_event      temp            _0x000F       //Check for meta events, because they have variable length
                     be        get_time        temp            _0x000C
                     be        get_time        temp            _0x000D
                     call      get_word        get_word_ra 
                     cp        togglehalfword  one
                     be        get_time        0               0
                     
meta_event           call      get_word        get_word_ra 
                     sr        wordcount       i_val           num_8
meta_loop            be        get_time        wordcount       one
                     call      get_word        get_word_ra 
                     be        meta_toggle     wordcount       num_2
                     sub       wordcount       wordcount       num_2
                     be        meta_loop       0               0
meta_toggle          cp        togglehalfword  one
                     be        get_time        0               0
                     
noteoff              cpta      num_0           drive_note      curr_drive    //pass in 0 to driver call
                     cp        togglehalfword  one
                     call      get_word        get_word_ra 
                     call      timeconvert     timeconvert_ra 
                     be        timediff        0               0             //goto set note
                     
checkvelocity        and       notetemp        i_val           _0x00FF       //isolate the right byte (note number) and save it in a temp variable
                     call      get_word        get_word_ra                   //get the next word
                     sr        i_val           i_val           num_8         //isolate the velocity
                     be        noteoff         i_val           num_0         //if the note velocity is 0, then it is counted as a note off event
                     cp        i_val           notetemp                      //move the note value back to the i_val      
                     cp        togglehalfword  num_1                         //toggle ishalfword, because the time was a half word long

                     //else goto set note

setnote              cpta      i_val           drive_note      curr_drive    //pass in MIDI note number to driver call
                     be        timediff        delta_t         num_0
                     call      timeconvert     timeconvert_ra                //convert delta_t (in MIDI ticks) to number of clock cycles

                     //check if delta_t time or longer has passed                     
timediff             in        5               curr_time1                    //get current slow time
                     in        211             curr_time2                    //get current fast time
                    // add       curr_time2      cc2             num_1
                     sub       timepassed1     curr_time1      start_time1   //find time passed for slow time
                     sub       timepassed2     curr_time2      start_time2   //find time passed for fast time
                     blt       fixtime1        timepassed1     num_0         //make slow time passed positive
timediff2            blt       fixtime2        timepassed2     num_0         //make fast time passed positive
timediff3            blt       waiting_true    timepassed1     cc1           //skip function if slow time hasn't been reached yet
                     be        timecheck       timepassed1     cc1           //skip function if fast time hasn't been reached yet
                     cp        waiting_check   num_0                         //Set waiting_check to FALSE
                     be        timediffcont    0               0             //return to calling function
waiting_true         cp        waiting_check   num_1                         //set timediff_check to FALSE
                     be        timediffcont    0               0             //return to calling function

fixtime1             sub       timepassed1     timepassed1     _0x8000       //make time positive
                     be        timediff2       0               0             //jump back to function
                     
fixtime2             sub       timepassed2     timepassed2     _0x8000       //make time positive
                     sub       timepassed1     timepassed1     num_1         //subtract one to the slow time difference
                     be        timediff3       0               0             //jump back to function

timecheck            blt       waiting_true    timepassed2     cc2
                     cp        waiting_check   num_0

timediffcont         be        nexttrack       waiting_check   num_1         //go to next track if delta t hasn't been reached yet
                     cp        start_time1     curr_time1                    //Reset slow start time
                     cp        start_time2     curr_time2                    //Reset fast start time
                     call      floppy_driver   floppy_driver_ra              //call floppy driver
                     be        nexttrack       0               0             //go to the next track

tempochange          halt
                     //if ishalfword == 1, increment i twice, save left byte
                     //shift left byte over to right
                     //save right byte, shift over to left
                     //increment i, save left byte, shift over to right
                     //add second and third bytes together
                     //if ishalfword == 0, increment i
                     //save right byte, increment i
                     //save byte
                     //handle timing
                     //go back to loop

nexttrack            cpta      i               trkpos          curr_drive    //save the memory location of the current drive
                     cpta      ishalfword      ishalfwordarray curr_drive    //save whether the data starts in the middle of a word
                     cpta      togglehalfword  togglehwarray   curr_drive    //save whether the halfword needs to be toggled
                     cpta      start_time1     start_time1_array curr_drive  //save the slow start time
                     cpta      start_time2     start_time2_array curr_drive  //save the fast start time
                     cpta      cc1             cc1_array       curr_drive    //save the slow time wait of the note
                     cpta      cc2             cc2_array       curr_drive    //save the fast time wait of the note
                     cpta      waiting_check   waiting         curr_drive    //save whether the drive is waiting on delta t
skiptrack            add       curr_drive      curr_drive      num_1         //increment the current drive
                     add       noteoncheck     noteoncheck     num_1         //increment note on and off checks
                     add       noteoffcheck    noteoffcheck    num_1
                     blt       noteloop        curr_drive      tracks_valid  //loop back if drive is < # of tracks with notes in them
                     cp        curr_drive      num_1                         //reset the curr_drive count
                     cp        noteoncheck     _0x0090                       //reset note on check
                     cp        noteoffcheck    _0x0080                       //reset note off check
                     be        noteloop        0               0             //loop back to noteloop

endoftrack           cp        i_temp          num_0
end_sequencer        cp        curr_drive      num_1                         //reset the curr_drive count
                     cp        noteoncheck     _0x0090                       //reset note on check
                     cp        noteoffcheck    _0x0080                       //reset note off check
                     ret       floppy_sequencer_ra 
