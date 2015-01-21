write_boxnotebox        cp boxinputX1   num_325      //write whole note in whole note button
                        cp boxinputX2   num_345
                        cp boxinputY1   num_120
			      cp boxinputY2   num_140
			      cp boxcolor black
			      call write_borderBox write_borderBox_ra
                
                        //write half note in half note button
                       
                        cp     boxinputX1       num_385         //set x1
                        cp     boxinputY1       num_120         //set y1
                        cp     boxinputX2       num_405         //set x2
                        cp     boxinputY2       num_140        //set y2 
                        cp    boxcolor black
                        call write_borderBox write_borderBox_ra
                        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black          //set color to black
                       
                        cp     vga_driver_x1       num_403         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_405         //set x2
                        cp     vga_driver_y2       num_120        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                         
                         //write quarter note in quarter note button
                        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black          //set color to black
                       
                        cp     vga_driver_x1       num_445         //set x1
                        cp     vga_driver_y1       num_120         //set y1
                        cp     vga_driver_x2       num_465         //set x2
                        cp     vga_driver_y2       num_140        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_463         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_465         //set x2
                        cp     vga_driver_y2       num_120        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                       //write eighth note in quarter note button
                        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black          //set color to black
                       
                        cp     vga_driver_x1       num_505         //set x1
                        cp     vga_driver_y1       num_120         //set y1
                        cp     vga_driver_x2       num_525         //set x2
                        cp     vga_driver_y2       num_140        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_523         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_525         //set x2
                        cp     vga_driver_y2       num_120        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_525         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_535         //set x2
                        cp     vga_driver_y2       num_112        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        //draw sixteenth note in sixteenth note button
                        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black          //set color to black
                       
                        cp     vga_driver_x1       num_565         //set x1
                        cp     vga_driver_y1       num_120         //set y1
                        cp     vga_driver_x2       num_585         //set x2
                        cp     vga_driver_y2       num_140        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_583         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_585         //set x2
                        cp     vga_driver_y2       num_120        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_585         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_595         //set x2
                        cp     vga_driver_y2       num_112        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        cp     vga_driver_x1       num_585         //set x1
                        cp     vga_driver_y1       num_114        //set y1
                        cp     vga_driver_x2       num_595         //set x2
                        cp     vga_driver_y2       num_116        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        //draw sharp
                        cp     vga_driver_x1       num_260         //set x1
                        cp     vga_driver_y1       num_118         //set y1
                        cp     vga_driver_x2       num_290         //set x2
                        cp     vga_driver_y2       num_120        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_260         //set x1
                        cp     vga_driver_y1       num_128        //set y1
                        cp     vga_driver_x2       num_290         //set x2
                        cp     vga_driver_y2       num_130        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_270         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_272         //set x2
                        cp     vga_driver_y2       num_140        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        cp     vga_driver_x1       num_278         //set x1
                        cp     vga_driver_y1       num_110        //set y1
                        cp     vga_driver_x2       num_280         //set x2
                        cp     vga_driver_y2       num_140        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        //draw sixteenthrest
                        cp     vga_driver_x1       num_580         //set x1
                        cp     vga_driver_y1       num_50          //set y1
                        cp     vga_driver_x2       num_582         //set x2
                        cp     vga_driver_y2       num_80         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_575         //set x1
                        cp     vga_driver_y1       num_55         //set y1
                        cp     vga_driver_x2       num_580         //set x2
                        cp     vga_driver_y2       num_57        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_575         //set x1
                        cp     vga_driver_y1       num_65        //set y1
                        cp     vga_driver_x2       num_580         //set x2
                        cp     vga_driver_y2       num_67        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_570         //set x1
                        cp     vga_driver_y1       num_50         //set y1
                        cp     vga_driver_x2       num_575         //set x2
                        cp     vga_driver_y2       num_59        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        cp     vga_driver_x1       num_570         //set x1
                        cp     vga_driver_y1       num_61         //set y1
                        cp     vga_driver_x2       num_575         //set x2
                        cp     vga_driver_y2       num_70        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                        

                        ret    write_boxnotebox_ra
