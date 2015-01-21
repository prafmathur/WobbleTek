//Writes the music staff in black to the screen
//return address: write_staff_ra

write_staff      cp     vga_driver_write    one             //set vga_driver_write to one
                 cp     vga_driver_color    num_8           //set color to black
                 cp     vga_driver_x1       num_9           //set x1 for lowest line
                 cp     vga_driver_y1       num_405         //set y1 for lowest line
                 cp     vga_driver_x2       num_629         //set x2 for lowest line
                 cp     vga_driver_y2       num_410         //set y2 for lowet line
                 call   vga_driver          vga_driver_ra   //draw the lowest line of the staff

write_staff_loop be     write_staff_end     write_staff_i   num_4 //draw other 4 lines above the first line
                 sub    vga_driver_y1       vga_driver_y1   num_40
                 sub    vga_driver_y2       vga_driver_y2   num_40
                 call   vga_driver          vga_driver_ra
                 add    write_staff_i       write_staff_i   one
                 be     write_staff_loop    zero            zero

write_staff_end cp     write_staff_i   zero 
                ret    write_staff_ra



write_staff_i .data 0
num_405 .data   405