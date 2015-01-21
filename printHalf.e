//print half


//takes in x1, y1 of half note

printHalf		cp boxinputX1   noteX1
			add boxinputX2  boxinputX1  num_30
			cp boxinputY1   noteY1
		
                	add boxinputY2   boxinputY1 num_30
			cp boxcolor		black
			call write_borderBox write_borderBox_ra
		
                	cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black           
                        
                        cp     vga_driver_x2       boxinputX2         //set x1
                        sub    boxinputY1          boxinputY1       num_60
                        cp     vga_driver_y1       boxinputY1          //set y1
                        sub	   boxinputX2	   boxinputX2		num_2
                        cp     vga_driver_x1       boxinputX2         //set x2
                        cp     vga_driver_y2       boxinputY2         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        be halfsharp   toggleSharp             one
                        ret printHalf_ra       

halfsharp              call note_sharp note_sharp_ra
                        ret printHalf_ra

noteX1a .data 200
noteY1a .data 352
