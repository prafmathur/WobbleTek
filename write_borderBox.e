//function that writes a box with a 2px thick border when given
//x1, x2, y1, y2, color         

       
  
write_borderBox         add    boxinputX1p         boxinputX1 num_2    
                        sub    boxinputX2p         boxinputX2 num_2
                        add    boxinputY1p         boxinputY1 num_2
                        sub    boxinputY2p         boxinputY2 num_2

                        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    boxcolor           //set color to boxcolor
                        cp     vga_driver_x1       boxinputX1         //set x1
                        cp     vga_driver_y1       boxinputY1          //set y1
                        cp     vga_driver_x2       boxinputX2         //set x2
                        cp     vga_driver_y2       boxinputY1p         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    boxcolor           //set color to boxcolor
                        cp     vga_driver_x1       boxinputX1         //set x1
                        cp     vga_driver_y1       boxinputY2p          //set y1
                        cp     vga_driver_x2       boxinputX2         //set x2
                        cp     vga_driver_y2       boxinputY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    boxcolor           //set color to boxcolor
                        cp     vga_driver_x1       boxinputX1         //set x1
                        cp     vga_driver_y1       boxinputY1          //set y1
                        cp     vga_driver_x2       boxinputX1p         //set x2
                        cp     vga_driver_y2       boxinputY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    boxcolor           //set color to boxcolor
                        cp     vga_driver_x1       boxinputX2p         //set x1
                        cp     vga_driver_y1       boxinputY1          //set y1
                        cp     vga_driver_x2       boxinputX2         //set x2
                        cp     vga_driver_y2       boxinputY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        ret write_borderBox_ra

boxinputX1  .data 0
boxinputX1p .data 0
boxinputX2  .data 0
boxinputX2p .data 0
boxinputY1  .data 0
boxinputY1p .data 0
boxinputY2  .data 0
boxinputY2p .data 0
boxcolor    .data 0