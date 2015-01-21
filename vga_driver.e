vga_driver       out 62 vga_driver_write                                                //set command parameters
                 out 63 vga_driver_x1
                 out 64 vga_driver_y1
                 out 65 vga_driver_x2
                 out 66 vga_driver_y2
                 out 67 vga_driver_color
                 out 60 vga_driver_on                                                   //set command to one

vga_response_on  in  61 vga_driver_response                                             //wait for response to be one
                 bne vga_response_on            vga_driver_response     vga_driver_on

                 in  68 vga_driver_color_read                                           //get response parameters
                 out 60 vga_driver_off                                                  //set command to zero

vga_response_off in  61 vga_driver_response                                             //wait for response to be zero
                 bne vga_response_off           vga_driver_response     vga_driver_off
                 ret vga_driver_ra                                                      //return

vga_driver_write      .data 1
vga_driver_on         .data 1
vga_driver_off        .data 0
vga_driver_x1         .data 0
vga_driver_y1         .data 0
vga_driver_x2         .data 100
vga_driver_y2         .data 100
vga_driver_color      .data 7
vga_driver_color_read .data 0
vga_driver_response   .data 0