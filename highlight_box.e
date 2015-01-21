//function that writes a box with a 2px thick border when given
//x1, x2, y1, y2, color         

highlight_box           add    highX1p         highX1 num_2    
                        sub    highX2p         highX2 num_2
                        add    highY1p         highY1 num_2
                        sub    highY2p         highY2 num_2
                        
                        
                        cp     vga_driver_write    one              //set vga_driver_write to one
                        cp     vga_driver_color    num_120          //set color to highlightcolor
                        cp     vga_driver_x1       highX1         //set x1
                        cp     vga_driver_y1       highY1          //set y1
                        cp     vga_driver_x2       highX2         //set x2
                        cp     vga_driver_y2       highY1p         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    num_120          //set color to highlightcolor
                        cp     vga_driver_x1       highX1         //set x1
                        cp     vga_driver_y1       highY2p          //set y1
                        cp     vga_driver_x2       highX2         //set x2
                        cp     vga_driver_y2       highY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    num_120           //set color to highlightcolor
                        cp     vga_driver_x1       highX1         //set x1
                        cp     vga_driver_y1       highY1          //set y1
                        cp     vga_driver_x2       highX1p         //set x2
                        cp     vga_driver_y2       highY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    num_120           //set color to highlightcolor
                        cp     vga_driver_x1       highX2p         //set x1
                        cp     vga_driver_y1       highY1          //set y1
                        cp     vga_driver_x2       highX2         //set x2
                        cp     vga_driver_y2       highY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box      
  

                        
/*                        //keep sharp highlight
                        add    sharpX1p         sharpX1 num_2    
                        sub    sharpX2p         sharpX2 num_2
                        add    sharpY1p         sharpY1 num_2
                        sub    sharpY2p         sharpY2 num_2
                        
                        
                cp      vga_driver_write    one              //set vga_driver_write to one
                        cp     vga_driver_color    highlightcolor          //set color to highlightcolor
                        cp     vga_driver_x1       sharpX1         //set x1
                        cp     vga_driver_y1       sharpY1          //set y1
                        cp     vga_driver_x2       sharpX2         //set x2
                        cp     vga_driver_y2       sharpY1p         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    highlightcolor          //set color to highlightcolor
                        cp     vga_driver_x1       sharpX1         //set x1
                        cp     vga_driver_y1       sharpY2p          //set y1
                        cp     vga_driver_x2       sharpX2         //set x2
                        cp     vga_driver_y2       sharpY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    highlightcolor           //set color to highlightcolor
                        cp     vga_driver_x1       sharpX1         //set x1
                        cp     vga_driver_y1       sharpY1          //set y1
                        cp     vga_driver_x2       sharpX1p         //set x2
                        cp     vga_driver_y2       sharpY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

		        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    highlightcolor           //set color to highlightcolor
                        cp     vga_driver_x1       sharpX2p         //set x1
                        cp     vga_driver_y1       sharpY1          //set y1
                        cp     vga_driver_x2       sharpX2         //set x2
                        cp     vga_driver_y2       sharpY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box   */

                        ret highlight_box_ra

highX1  .data 0
highX1p .data 0
highX2  .data 0
highX2p .data 0
highY1  .data 0
highY1p .data 0
highY2  .data 0
highY2p .data 0

sharpX1  .data 0
sharpX1p .data 0
sharpX2  .data 0
sharpX2p .data 0
sharpY1  .data 0
sharpY1p .data 0
sharpY2  .data 0
sharpY2p .data 0
