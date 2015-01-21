//print quarter note

printQuarter		cp boxinputX1   noteX1
			add boxinputX2  boxinputX1  num_30
			cp boxinputY1   noteY1
			add boxinputY2   boxinputY1 num_30
			cp boxcolor		black

                        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    boxcolor           //set color to boxcolor
                        cp     vga_driver_x1       boxinputX1         //set x1
                        cp     vga_driver_y1       boxinputY1          //set y1
                        cp     vga_driver_x2       boxinputX2         //set x2
                        cp     vga_driver_y2       boxinputY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

						cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black           
                        cp     vga_driver_x1       boxinputX2         //set x1
                        sub    boxinputY1		   boxinputY1       num_60
                        cp     vga_driver_y1       boxinputY1          //set y1
                        add	   boxinputX2		   boxinputX2		num_3
                        cp     vga_driver_x2       boxinputX2         //set x2
                        cp     vga_driver_y2       boxinputY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        be Quartersharp   toggleSharp             one
                        ret printQuarter_ra       

Quartersharp              call note_sharp note_sharp_ra
                        ret printQuarter_ra


noteX1b .data 320
noteY1b .data 233