//Writes white to all pixels of the clear
//return address: clear_screen_ra

clear_screen cp     vga_driver_write    one     //set vga_driver_write to one
             cp     vga_driver_color    white   //set color to white
             cp     vga_driver_x1       zero
             cp     vga_driver_y1       zero
             cp     vga_driver_x2       vga_max_c
             cp     vga_driver_y2       vga_max_r
             call   vga_driver          vga_driver_ra
             ret    clear_screen_ra