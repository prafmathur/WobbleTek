print16rest           cp boxinputX1   noteX1
			          add boxinputX1  boxinputX1     num_30
			          add boxinputXS2  boxinputX1    num_2  
			          sub boxinputXS5  boxinputX1    num_5
			          sub boxinputXS10 boxinputX1    num_10
			          
			cp boxinputY1   noteY1               
                        cp     vga_driver_color    black 
                        cp     vga_driver_x1       boxinputX1         //set x1
                        cp     vga_driver_y1       num_310          //set y1
                        cp     vga_driver_x2       boxinputXS2         //set x2
                        cp     vga_driver_y2       num_340         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       boxinputXS5         //set x1
                        cp     vga_driver_y1       num_315        //set y1
                        cp     vga_driver_x2       boxinputX1         //set x2
                        cp     vga_driver_y2       num_317        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       boxinputXS5         //set x1
                        cp     vga_driver_y1       num_325        //set y1
                        cp     vga_driver_x2       boxinputX1         //set x2
                        cp     vga_driver_y2       num_327        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       boxinputXS10        //set x1
                        cp     vga_driver_y1       num_310         //set y1
                        cp     vga_driver_x2       boxinputXS5         //set x2
                        cp     vga_driver_y2       num_319       //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       boxinputXS10         //set x1
                        cp     vga_driver_y1       num_321       //set y1
                        cp     vga_driver_x2       boxinputXS5         //set x2
                        cp     vga_driver_y2       num_330        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        ret   print16rest_ra
                        
boxinputXS2  .data 0
boxinputXS5  .data 0
boxinputXS10 .data 0
boxinputY30  .data 0

