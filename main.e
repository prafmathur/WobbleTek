//main function, for testing for now
//This should only contain "call"s

//----------------------------------------------------------------
// Initially Call Clear Screen, write staff, Note boxes, load box
//----------------------------------------------------------------
			call clear_screen clear_screen_ra
			call write_staff write_staff_ra
			call write_noteboxes write_noteboxes_ra
			call write_load_box write_load_box_ra
			call write_boxnotebox write_boxnotebox_ra
			call draw_arrow       draw_arrow_ra
			call measure_num      measure_num_ra
//----------------------------------------------------------

//----------------------------------------------------------
// Enter mouse loop
//-----------------------------------------------------------
mouseloop	call mouse_cursor mouse_cursor_ra
			be waitRelease mouse_button1 one 	  //go to waitRelease
			be mouseloop zero zero
//-----------------------------------------------------------

//-----------------------------------------------------------
// Wait for Release
//-----------------------------------------------------------
waitRelease call mouse_cursor mouse_cursor_ra
			be ifclick	mouse_button1	zero	//go to ifclick
			be waitRelease	zero zero			
//------------------------------------------------------------



//-----------------------------------------------------------
// If a click has occured
//-----------------------------------------------------------
		
ifclick		call save_clicked  save_clicked_ra
			call load_clicked  load_clicked_ra
			call clear_screen clear_screen_ra			//clear the screen
			call write_staff write_staff_ra				//write staff
			call draw_arrow  draw_arrow_ra              //draw arrow and boxes
			call write_noteboxes write_noteboxes_ra	   //write 
			call write_boxnotebox write_boxnotebox_ra
			call write_load_box write_load_box_ra
			call note_clicked note_clicked_ra
			call highlight_box highlight_box_ra
			call clickwhere clickwhere_ra				//write to the array based on what happened
			call delete_clicked delete_clicked_ra
			call whichMeasure whichMeasure_ra
			call arrow_clicked  arrow_clicked_ra
			call measure_num  measure_num_ra
			call disp_from_array disp_from_array_ra		//display notes from array
			be mouseloop zero zero						//return to mouseloop

//-----------------------------------------------------------



//include all of the functions
#include clear_screen.e
#include write_staff.e
#include write_noteboxes.e
#include mouse_cursor.e
#include track_data.e
#include clickwhere.e
#include write_track.e
#include write_borderBox.e
#include disp_from_array.e
#include printWhole.e
#include printHalf.e
#include printQuarter.e
#include printEighth.e
#include printSixteenth.e
#include print16rest.e
#include write_load_box.e
#include vga_driver.e
#include mouse_driver.e
#include load_clicked.e
#include note_sharp.e
#include write_boxnotebox.e
#include note_clicked.e
#include save_clicked.e
#include highlight_box.e
#include MIDI_encode.e
#include draw_arrow.e
#include deletelast.e
#include whichMeasure.e
#include delete_clicked.e
#include arrow_clicked.e
#include measure_num.e
#include serial_send.e
#include serial_send_driver.e
#include serial_receive.e
#include serial_receive_driver.e
#include MIDI_Parser.e
#include floppy_sequencer.e
#include division.e
#include floppy_driver.e
#include floppy_lookup_table.e

#include constants.e
