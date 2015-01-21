//Author: Amir Alavi
//Function: It takes the user data for the composed music and converts it into a MIDI file
//Input: The array "track0" that has the note length and note number in each element
//Output: An array called "MIDI_array" that holds the midi file data

//--------------------HEADER---------------------------------------------------

//TO DO: write data for the header using the write_bits function
MIDI_encode     cp      encode_i            num_0                               //initialize index variable to zero
                cp      loop_count          num_0
                cp      num_tracks          num_0
                cp      encode_ishalfword   num_0
                cp      data                MT                                  // "MT"
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      data                hd                                  // "hd"
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      data                num_0                               // 0x0000
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      data                num_6                               // 0x0006
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      file_type_index     encode_i                            // store the value of encode_i (indexer) for where the file type must be written, to update later (we don't know the file type yet)
                cp      file_type_ishw      encode_ishalfword                   // store the value of encode_ishalfword for where the file type must be written to be updated later
                cp      data                num_0                               // <file type>
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      num_tracks_index    encode_i                            // store the value of encode_i for where the number of tracks must be written, to be updated later
                cp      num_tracks_ishw     encode_ishalfword                   // store the value of encode_ishalfword
                cp      data                num_0                               // <number of tracks>
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      data                num_16                              // 16 ticks per beat (allows for a note resolution of up to 64th notes)
                cp      write_length        num_1
                call    write_bits          write_bits_ra



//--------------------HEADER---------------------------------------------------


//--------------------TRACKS---------------------------------------------------

big_loop        be      encode_end          loop_count          num_8           //big loop is a loop that runs once per track it writes the track chunk
                                                                                //and then writes note on and off events and then loops around to start the next track
                cp      encode_channel      loop_count                          //each event (written later) has a channel number, which we will make the same as the
                                                                                //track number, so we set "encode_channel" to the track number
                bne     checkfor2           loop_count          num_0           //All of these branches are to check which track we are in to choose the appropriate
                cp      array_i             num_100                             //channel number
                be      write_chunk         num_0               num_0

checkfor2       bne     checkfor3           loop_count          num_1
                cp      array_i             num_200
                be      write_chunk         num_0               num_0

checkfor3       bne     checkfor4           loop_count          num_2
                cp      array_i             num_300
                be      write_chunk         num_0               num_0

checkfor4       bne     checkfor5           loop_count          num_3
                cp      array_i             num_400
                be      write_chunk         num_0               num_0

checkfor5       bne     checkfor6           loop_count          num_4
                cp      array_i             num_500
                be      write_chunk         num_0               num_0

checkfor6       bne     checkfor7           loop_count          num_5
                cp      array_i             num_600
                be      write_chunk         num_0               num_0

checkfor7       bne     is_eight            loop_count          num_6
                cp      array_i             num_700
                be      write_chunk         num_0               num_0

is_eight        cp      array_i             num_800

write_chunk     add     array_max           array_i             num_100         //We calculate the max index value by adding 100 to array_i's initial value (each track has 100 array elements)
//---------------------------------------------------------------------------------------------------------------------------                
check_if_empty  cpfa    array_val           track0              array_i         //get note_data of first element that has note length and number in its two bytes
                be      incr_big_loop       array_val           num_0           // if the track starts with zero, it is empty, and the user hasn't writtent to it, then we branch to incr_big_loop where we move on to the next track
                add     num_tracks          num_tracks          num_1
               
//-----------------------------------------------------------------------------------------------------------------------------

                cp      data                MT                                  //Here we start the track chunk by writing "MT"
                cp      write_length        num_1
                call    write_bits          write_bits_ra

                cp      data                rk                                  //Then we write "rk"
                cp      write_length        num_1
                call    write_bits          write_bits_ra


            
                cp      data                num_0                               //write zero for first  2 bytes of track size
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      tr_size_loc         encode_i                            //store location of where we have to write the second 2 bytes of track size.
                cp      tr_size_loc_ishw    encode_ishalfword                   //store the state of encode_ishalfword at this location so we can write correctly to it later
                cp      data                num_0                               //write zero for second byte of track size (this is temporary) we will change it later once we know how long the track is
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      tr_size_i           encode_i                            //store location of where we have to start counting track size from 
                cp      tr_size_ishw        encode_ishalfword                   //we want to calculate the track size later, we know whether or not the track started with a half-word (1 byte)



inner_loop      be      end_track           array_i             array_max       //This is the inner loop, that is responsible for running through the size 100 array that holds the data for the current track
                cpfa    array_val           track0              array_i         //get note_data that has note length and number in its two bytes
                add     array_i             array_i             num_1
                be      end_track           array_val           num_0           //If we have reached a value of zero in the track, the track is over
                sr      encode_length       array_val           num_8           //bit shift right by 8 bits to isolate length of note
                sl      encode_note         array_val           num_8           //do some shifting to isolate note number
                sr      encode_note         encode_note         num_8
            
                bne     not_rest            encode_length       num_17          //If the note_length is 17, that means its a rest. If it's not zero, its a note
                add     rest                rest                num_4         //If it's a rest, then we add 240 ticks (1/16th rest) to rest
                be      inner_loop          num_0               num_0           //go back to top of loop to check next note

not_rest        cp      encode_delta_t      rest                                //Here we handle the case when the note is not a rest. Delta_t is the time from the last track event.
                cp      rest                num_0                               //reset rest to zero for the next note
                call    write_delta_t       write_delta_t_ra                    //This is equal to the rest from the previous note for a "note on" event.
encode_cont     cp      encode_type         num_9                               //The event type value of "note on" is 0x9
                cp      encode_velocity     num_50
                call    write_event         write_event_ra

                mult    encode_delta_t      num_16              num_4           //Now we calculate delta t for the "note off" event, which is equal to the note length.
                div     encode_delta_t      encode_delta_t      encode_length   //Do some math to get delta time in ticks. delta t = (960*4)/length
                call    write_delta_t       write_delta_t_ra
                cp      encode_type         num_8                               //The event type value of "note off" is 0x8
                cp      encode_velocity     num_0
                call    write_event         write_event_ra                      
                be      inner_loop          num_0               num_0           //go back to top of loop to check next note

end_track       cp      rest                num_0
                cp      data                num_0                               //DATE ADDED: 4/17
                cp      write_length        num_0
                call    write_bits          write_bits_ra
                cp      data                _0xFF2F                             //These last two calls to write_bits will write 0xFF2F00 to the file, indicating the end of the track.
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      data                num_0
                cp      write_length        num_0
                call    write_bits          write_bits_ra
                sub     track_size          encode_i            tr_size_i       //once we have checked all of the note data in the track and written the events, we need to calculate the track size in bytes and go back and write it
                mult    track_size          track_size          num_2           
                bne     ishw_check          tr_size_ishw        num_0           //Here, we do some math that depends on whether or not the track started and/or ended in a half-word
                add     track_size          track_size          num_1
                be      ishw_check          num_0               num_0

ishw_check      bne     end_track_cont      encode_ishalfword   num_0
                sub     track_size          track_size          num_1


end_track_cont  cp      index_temp          encode_i                            //Now we store the current "encode_i" and "encode_ishalfword" values in temporaries
                cp      ishw_temp           encode_ishalfword
                cp      encode_i            tr_size_loc                         //We replace them with the values that they were when we were writing the second byte of the track size
                cp      encode_ishalfword   tr_size_loc_ishw
                add     track_size          track_size          num_1           //DATE ADDED: 4/17
                cp      data                track_size                          //We write the calculated track size to that location
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      encode_i            index_temp                          //We restore "encode_i" and "encode_ishalfword" to their original values
                cp      encode_ishalfword   ishw_temp
                
incr_big_loop   add     loop_count          loop_count          num_1           //We increment the big loop loop_count
                be      big_loop            num_0               num_0           //Go back to the top of big_loop to start encoding the next track


encode_end      cp      index_temp          encode_i                            //store the current "encode_i" and "encode_ishalfword" values in temporaries
                cp      ishw_temp           encode_ishalfword
                be      encode_return       num_tracks          num_0
                be      wr_num_tracks       num_tracks          num_1
file_type_1     cp      encode_i            file_type_index
                cp      encode_ishalfword   file_type_ishw
                cp      data                num_1
                cp      write_length        num_1
                call    write_bits          write_bits_ra
wr_num_tracks   cp      encode_i            num_tracks_index
                cp      encode_ishalfword   num_tracks_ishw
                cp      data                num_tracks
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                cp      encode_i            index_temp                          //We restore "encode_i" and "encode_ishalfword" to their original values
                cp      encode_ishalfword   ishw_temp

encode_return   cp      data                _0xFFFF
                cp      write_length        num_1
                call    write_bits          write_bits_ra
                //halt
                ret     MIDI_encode_ra                                          //If we have encoded all 8 tracks, then we are done, and we return




//------------------------------------------------------------------------------------
//----------------write_delta_t-------------------------------------------------------
//This function puts delta t in big endian representation, and then writes it to the midi file
//Input:  encode_delta_t (not in big-endian)
//Output: encode_delta_t (in big-endian)

write_delta_t   and     encode_temp1        encode_delta_t      _0x3F80         //first check size of delta t (will it be 2 or 1 big endian bytes?)
                bne     deltat_size2        encode_temp1        num_0           //Branch if it will be two big-endian bytes long
                and     encode_delta_t      encode_delta_t      _0x007F
                cp      data                encode_delta_t
                cp      write_length        num_0
                call    write_bits          write_bits_ra                       //write the 1 big-endian byte delta t
                ret     write_delta_t_ra

deltat_size2    and     encode_temp1        encode_delta_t      _0x007F         //This executes if delta t will be 2 big-endian bytes
                sr      encode_temp2        encode_delta_t      num_7
                sl      encode_temp2        encode_temp2        num_8
                add     encode_temp1        encode_temp1        encode_temp2
                or      encode_delta_t      encode_temp1        _0x8000
                cp      data                encode_delta_t
                cp      write_length        num_1
                call    write_bits          write_bits_ra                       //write the 2 big-endian byte delta t
                ret     write_delta_t_ra
//----------------write_delta_t-------------------------------------------------------
//------------------------------------------------------------------------------------


            

//------------------------------------------------------------------------------------
//--------------------write_event-----------------------------------------------------
//This function writes the event type value, channel number, parameter 1 (note number), and parameter 2 (velocity) for an event
//Inputs: encode_type (the event type value), encode_channel, encode_note (the note number), encode_velocity
//Output: writes these values to the midi file

write_event     cp      type_channel        encode_type                         //event type and channel number are both 4 bits, so we put them together
                sl      type_channel        type_channel    num_4               //into one half-word (1 byte = 8 bits) and write both at same time
                or      type_channel        type_channel    encode_channel
                cp      data                type_channel
                cp      write_length        num_0
                call    write_bits          write_bits_ra
                cp      data                encode_note
                cp      write_length        num_0
                call    write_bits          write_bits_ra
                cp      data                encode_velocity
                call    write_bits          write_bits_ra
                ret     write_event_ra
//--------------------write_event-----------------------------------------------------
//------------------------------------------------------------------------------------





//------------------------------------------------------------------------------------
//--------------------write_bits-----------------------------------------------------
//This is probably THE MOST CRITICAL PART OF MIDI_encode. It all depends on this working. This function is responsible for actually writing any data to the midi file.
//because some of the data is not a full 2-byte word, we need some way of keeping track of which part of a word we want to write to. Therefore, we have an
//"encode_ishalfword" parameter. If it's a 1, then we are currently trying to write to a location that has a half-word in the first 8 bits. If it's a zero, then the location is empty.
//We also have a parameter called "encode_length" which is the length of the current data we are trying write. If it's a one, then the data is a full word (2 bytes). If it's a zero
//then the data is a half word (1 byte). This function takes in these two values as inputs, and decides how to properly write the data. It is also responsible for then updating "encode_ishalfword"
//depending on whether or not it ended on a half-word. It also increments "encode_i" if necessary.

//Inputs:  encode_ishalfword, encode_length, data
//Outputs: encode_ishalfword(if needs to change), encode_i (if incremented), data (written to midi file)

write_bits      add     wr_bts_counter      wr_bts_counter      num_1
                be      ishw0_check_ln      encode_ishalfword   num_0
                be      ishw1_length0       write_length        num_0
                //---------ishw=1, length=1-----------
                cpfa    encode_temp1        MIDI_array          encode_i
                sr      encode_temp2        data                num_8
                add     encode_temp1        encode_temp1        encode_temp2
                cpta    encode_temp1        MIDI_array          encode_i
                add     encode_i            encode_i            num_1
                cpfa    encode_temp1        MIDI_array          encode_i
                and     encode_temp1        encode_temp1        _0x00FF
                sl      data                data                num_8
                add     data                encode_temp1        data
                cpta    data                MIDI_array          encode_i
                ret     write_bits_ra

ishw0_check_ln  be      ishw0_length0       write_length        num_0
                //---------ishw=0, length=1-----------
                cpta    data                MIDI_array          encode_i
                add     encode_i            encode_i            num_1
                ret     write_bits_ra

ishw1_length0   cpfa    encode_temp1        MIDI_array          encode_i
                add     data                encode_temp1        data
                cpta    data                MIDI_array          encode_i
                add     encode_i            encode_i            num_1
                cp      encode_ishalfword   num_0
                ret     write_bits_ra

ishw0_length0   sl      data                data                num_8
                cpta    data                MIDI_array          encode_i
                cp      encode_ishalfword   num_1
                ret     write_bits_ra
//--------------------write_bits-----------------------------------------------------
//------------------------------------------------------------------------------------



//----Data---------

    //for debugging
wr_bts_counter      .data 0

    //-------------
empty_i             .data 0
num_tracks          .data 0
file_type_index     .data 0
file_type_ishw      .data 0
num_tracks_index    .data 0
num_tracks_ishw     .data 0



track_size          .data 0
tr_size_i           .data 0     //Placeholder for where track chunk started
tr_size_ishw        .data 0     //to remember the value  of encode_ishalfword at location where the track data starts

tr_size_loc         .data 0     //Placeholder for where we must write the second 2 bytes of track size
tr_size_loc_ishw    .data 0     //stores the value of encode_ishalfword for where we must write track size

loop_count          .data 0
array_i             .data 0
array_max           .data 0
array_val           .data 0

encode_note         .data 0
encode_length       .data 0
rest                .data 0

encode_delta_t      .data 0
index_temp          .data 0
ishw_temp           .data 0
encode_temp1        .data 0
encode_temp2        .data 0
encode_temp3        .data 0

encode_i            .data 0
hd                  .data 26724 //hd= 0x6864

write_delta_t_ra    .data 0

//----------write_event data----
write_event_ra      .data 0
type_channel        .data 0
encode_velocity     .data 50
encode_channel      .data 0
encode_type         .data 0

//----------write_bits data----
write_bits_ra       .data 0
write_length        .data 0
data                .data 0
encode_ishalfword   .data 0

