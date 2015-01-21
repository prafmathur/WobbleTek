//AUTHOR:      This MIDI parser software is written by Austin Rovinski for ENGR 100.
//PURPOSE:     This software is written for use with the E100 microprocessor. It is responsible for receiving
//             a pointer for a MIDI file and outputting the memory location of the first byte of data of each
//             track for up to 8 tracks. It also returns time division. An error occurs if there are more
//             than 8 parts. Errors are stored in variable "errorcode".
//DESCRIPTION: This software has an initializer followed by two main loops. The initializer gathers specific
//             data located in the header chunk of the MIDI file. The first loop searches for the memory
//             location of each of the track headers and then calls a function containing the second loop.
//             This loop checks whether the track contains musical data (e.g. notes) or only meta data
//             (useless stuff).
//INPUTS:      MIDI_array (pointer to the first byte of the MIDI file)
//OUTPUTS:     trkhead (array of pointers to location of first data for each channel), ticks (time division)
//
//OTHER NOTES: 1) trkhead[1] corresponds to the first track. trkhead[0] is just a placeholder so that track
//             number matches with both the number in the array and the drive number.
//             2) ***SMPTE time division not handled yet

//Parse header data
MIDI_Parser    cp        i                  num_4                    //Set i to start after MIDI header
               cp        ishalfword         num_0
               cpfa      i_val              MIDI_array     i         //dereference i
               blt       cont               i_val          num_2     //verify that file is either type 0 or 1
               cp        errorcode          num_1                    //if not, set errorcode to 1
               ret       MIDI_Parser_ra                              //return without executing
cont           call      get_word           get_word_ra              //get the next complete word
               cp        tracks             i_val                    //Set the number of tracks
               call      get_word           get_word_ra              //get the next complete word
               blt       SMTPE              i_val          num_0     //Determine time format (ticks or SMTPE)
               cp        timediv            i_val                    //Set time division to number of ticks
               be        incr               0              0         //Jump to increment

SMTPE          halt //handle SMTPE case here
                  
incr           call      get_word           get_word_ra              //get the next complete word

//search for locations of track headers
search         call      trksearch          trksearch_ra             //call tracksearch for each track in the file
               blt       seterror2          num_8          i_trknum  //set errorcode to 2 if there are more than 8 parts
               bne       search             i_trksearch    tracks    //loop back to search if not all tracks have been located
               cp        tracks_valid       i_trknum                 //Store the number of tracks with actual note data on them
               cp        i                  num_0                    //Reset variables for next function call
               cp        i_trksearch        num_0
               cp        i_trknum           num_1
               cp        noteoncheck        _0x0090
               be        no_tempo           tempo1         num_0
               call      fixpoint_div2      fixpoint_div2_ra         //Calculate clock cycles per beat
               ret       MIDI_Parser_ra                              //return to calling function
no_tempo       cp        tempo1             num_7
               cp        tempo2             _0xA120
               call      fixpoint_div2      fixpoint_div2_ra
               ret       MIDI_Parser_ra

               //main search function that looks for MTrk
trksearch      be        trkverify          i_val             MT
               and       temp               i_val             _0x00FF
               bne       cont2              temp              M
               cp        togglehalfword     num_1
cont2          call      get_word           get_word_ra 
               be        trksearch          0                 0

trkverify      call      get_word           get_word_ra 
               bne       trksearch          i_val             rk
               call      get_word           get_word_ra 
               call      get_word           get_word_ra 
               call      get_word           get_word_ra 
               cpta      i                  trkhead           i_trknum
               cpta      ishalfword         trkheadhalf       i_trknum
               call      trkcheck           trkcheck_ra 
               ret       trksearch_ra 

               //sub search function that looks for note on, tempo change, and end of track events
trkcheck       be        trkcheck_false     i_val             _0xFF2F
               be        settempo           i_val             _0xFF51
cont1          sr        temp               i_val             num_8
               be        trkcheck_true      temp              noteoncheck
               and       temp               i_val             _0x00FF
               be        skiphalfword       temp              noteoncheck
               be        skiphalfword       temp              _0x00FF
               call      get_word           get_word_ra 
               be        trkcheck           0                 0
skiphalfword   cp        togglehalfword     num_1
               call      get_word           get_word_ra 
               be        trkcheck           0                 0


trkcheck_false add       i_trksearch        i_trksearch       num_1       //increment i_trksearch but NOT i_trknum
               cpta      num_0              trkhead           i_trknum    //reset the trkhead
               cpta      num_0              trkheadhalf       i_trknum    //reset the trkhead halfword indicator
               ret       trkcheck_ra 

trkcheck_true  add      i_trksearch         i_trksearch       num_1       //increment i_trksearch
               add      noteoncheck         _0x0090           i_trknum
               add      i_trknum            i_trknum          num_1       //increment i_trknum
               ret      trkcheck_ra 

settempo       bne      cont1               tempo2            num_0
               bne      cont1               tempo1            num_0
               call     get_word            get_word_ra 
               and      tempo1              i_val             _0x00FF
               call     get_word            get_word_ra 
               cp       tempo2              i_val
               call     get_word            get_word_ra 
               be       trkcheck            0                 0

get_word       be       togglecheck1        ishalfword        num_1
               be       halfword1           togglehalfword    num_1
               add      i                   i                 num_1     //increment i
               cpfa     i_val               MIDI_array        i         //dereference i
               ret      get_word_ra 
togglecheck1   be       halfword2           togglehalfword    num_1
halfword1      cp       togglehalfword      num_0
               cp       ishalfword          num_1
               cpfa     i_val               MIDI_array        i         //dereference i
               sl       temp                i_val             num_8     //isolate the right byte and save it in temp
               add      i                   i                 num_1     //increment i
               cpfa     i_val               MIDI_array        i         //dereference i
               sr       i_val               i_val             num_8     //isolate the left byte and save it in i_val
               add      i_val               i_val             temp      //form the word from the isolated bytes
               ret      get_word_ra 
halfword2      cp       togglehalfword      num_0
               cp       ishalfword          num_0
               cpfa     i_val               MIDI_array        i         //dereference i
               ret      get_word_ra 

seterror2      cp       errorcode          num_2                        //set error code to 2
               ret      MIDI_Parser_ra 

_0xA120        .data    -24288
