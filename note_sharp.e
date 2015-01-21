note_sharp  cp     vga_driver_write    one                     //set vga_driver_write to one
            cp     vga_driver_color    num_200                 //set color to black

            //--for left vertical bar
            
            sub    noteY1           noteY1           num_20


            add    new_y               noteY1         num_3
            cp     vga_driver_y1       new_y                   //set y1
            
            add    new_x               noteX1        num_11
            cp     vga_driver_x1       new_x               //set noteX1
            
            add    new_y               noteY1        num_14   
            cp     vga_driver_y2       new_y                 //set y2 

            add    new_x               noteX1        num_11
            cp     vga_driver_x2       new_x                //set x2
            call   vga_driver          vga_driver_ra         //draw box
            //for right vertical bar
            add    new_y               noteY1         num_3
            cp     vga_driver_y1       new_y                   //set y1
            
            add    new_x               noteX1        num_19
            cp     vga_driver_x1       new_x               //set noteX1
            
            add    new_y               noteY1        num_14   
            cp     vga_driver_y2       new_y                 //set y2 


            add    new_x               noteX1        num_19
            cp     vga_driver_x2       new_x                //set x2
            call   vga_driver          vga_driver_ra         //draw box
           //for bottom horizontal bar
            add    new_y               noteY1         num_7
            cp     vga_driver_y1       new_y                   //set y1
            
            add    new_x               noteX1        num_8
            cp     vga_driver_x1       new_x               //set noteX1
            
           add    new_y               noteY1        num_7   
            cp     vga_driver_y2       new_y                 //set y2 

            add    new_x               noteX1        num_22
            cp     vga_driver_x2       new_x                //set x2
            call   vga_driver          vga_driver_ra         //draw box

            //for top horizontal bar
             add    new_y               noteY1         num_11
            cp     vga_driver_y1       new_y                   //set y1
            
            add    new_x               noteX1        num_8
            cp     vga_driver_x1       new_x                //set noteX1
            
            add    new_y               noteY1        num_11   
           cp     vga_driver_y2       new_y                 //set y2 

            add    new_x               noteX1        num_22
             cp     vga_driver_x2       new_x                //set x2
            call   vga_driver          vga_driver_ra         //draw box


            ret    note_sharp_ra
