measure_num            cp     boxinputX1          num_290
			           cp     boxinputX2          num_299  
                       cp     boxinputY1          num_465
                       cp     boxinputY2          num_474 

			           cp     boxcolor		      black
                       call   write_borderBox     write_borderBox_ra
measure_num_loop       add    boxinputX1          boxinputX1  num_9
			           add    boxinputX2          boxinputX1  num_9
                       call   write_borderBox     write_borderBox_ra
                       add    measure_num_count   measure_num_count       num_1
                       blt    measure_num_loop    measure_num_count       num_5 
                       cp     measure_num_count   num_0
                       cp     box_inc             daMeasure
                       blt    less_than           box_inc                 num_6      
                       cp     box_inc             num_5    
less_than              blt    move_box            num_0                   box_inc
                       cp     box_inc             num_0 

move_box               mult   adjust_arrow        box_inc                 num_9
                       add    adjust_arrow        adjust_arrow            num_290
                       cp     vga_driver_write    one                               //set vga_driver_write to one
                       cp     vga_driver_color    black                             //set color to boxcolor
                       cp     vga_driver_x1       adjust_arrow                      //set x1
                       cp     vga_driver_x2       vga_driver_x1 
                       add    vga_driver_x2       vga_driver_x2           num_9 
                       cp     vga_driver_y1       num_465                           //set y1
                       cp     vga_driver_y2       num_474                           //set y2 
                       call   vga_driver          vga_driver_ra                    
                       ret    measure_num_ra


measure_num_count  .data 0
adjust_arrow       .data 0
box_inc            .data 1
