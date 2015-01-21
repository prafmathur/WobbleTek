load_clicked      blt    check_second_y     y     num_150
                  ret    load_clicked_ra
check_second_y    blt    check_first_x     num_100    y
                  ret    load_clicked_ra
check_first_x     blt    check_second_x    x      num_170
                  ret    load_clicked_ra
check_second_x    blt    call_midi_array   num_120    x 
			      ret 	load_clicked_ra

call_midi_array   call   array  array_ra
				  call   MIDI_Parser MIDI_Parser_ra
				  call 	 floppy_sequencer floppy_sequencer_ra
load_clicked_return ret    load_clicked_ra 

