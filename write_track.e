//write_track

//This function updates the track data arrays with a new note
//It takes in 3 inputs:
    //track # (1-8)
    //note length
    //note number (0-127)
write_track     be      wr_tr_1         track_num   num_1       //Determine which track the note is in
                be      wr_tr_2         track_num   num_2
                be      wr_tr_3         track_num   num_3
                be      wr_tr_4         track_num   num_4
                be      wr_tr_5         track_num   num_5
                be      wr_tr_6         track_num   num_6
                be      wr_tr_7         track_num   num_7
                be      wr_tr_8         track_num   num_8
                cp      write_error     one                     //if code reaches this point, then track number was out of range
                ret     write_track_ra

wr_tr_1         sl      note_data       note_L      num_8       //Shift note length 8 bits left, so that it is in byte 1, and store result in note_data
                add     note_data       note_data   note_num    //add note number to note_data so that byte 0 has the note number
                cpta    note_data       track0      i_t1        //Finally, write note_data, which now contains both note length and number, to the track
                add     i_t1            i_t1        one         //increment the i (index) value for the track so it is ready for the next run
                ret     write_track_ra                          //return

wr_tr_2         sl      note_data       note_L      num_8
                add     note_data       note_data   note_num
                cpta    note_data       track0      i_t2
                add     i_t2            i_t2        one
                ret     write_track_ra

wr_tr_3         sl      note_data       note_L      num_8
                add     note_data       note_data   note_num
                cpta    note_data       track0      i_t3
                add     i_t3            i_t3        one
                ret     write_track_ra

wr_tr_4         sl      note_data       note_L      num_8
                add     note_data       note_data   note_num
                cpta    note_data       track0      i_t4
                add     i_t4            i_t4        one
                ret     write_track_ra

wr_tr_5         sl      note_data       note_L      num_8
                add     note_data       note_data   note_num
                cpta    note_data       track0      i_t5
                add     i_t5            i_t5        one
                ret     write_track_ra

wr_tr_6         sl      note_data       note_L      num_8
                add     note_data       note_data   note_num
                cpta    note_data       track0      i_t6
                add     i_t6            i_t6        one
                ret     write_track_ra

wr_tr_7         sl      note_data       note_L      num_8
                add     note_data       note_data   note_num
                cpta    note_data       track0      i_t7
                add     i_t7            i_t7        one
                ret     write_track_ra

wr_tr_8         sl      note_data       note_L      num_8
                add     note_data       note_data   note_num
                cpta    note_data       track0      i_t8
                add     i_t8            i_t8        one
                ret     write_track_ra

track_num   .data 0     //track number
note_L      .data 0     //note length
note_num    .data 0     //note number
write_error .data 0     //error code, 1 if track number out of range
note_data   .data 0