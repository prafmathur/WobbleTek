//Writes a box where we will eventually put a quarter note
//return address: write_quarternote_ra



write_quarternote       cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black           //set color to black
                        cp     vga_driver_x1       num_310         //set x1
                        cp     vga_driver_y1       num_100          //set y1
                        cp     vga_driver_x2       num_360         //set x2
                        cp     vga_driver_y2       num_150         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        ret    write_quarternote_ra


