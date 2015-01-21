draw_arrow              cp     boxinputX1       num_120         //set x1 draw box for right arrow
                        cp     boxinputY1       num_40         //set y1
                        cp     boxinputX2       num_170         //set x2
                        cp     boxinputY2       num_90        //set y2 
						cp boxcolor		black
						call write_borderBox write_borderBox_ra
						
			      cp     boxinputX1       num_60 //set x1 draw box for left arrow
                        cp     boxinputY1       num_40         //set y1
                        cp     boxinputX2       num_110         //set x2
                        cp     boxinputY2       num_90        //set y2 
						cp boxcolor		black
						call write_borderBox write_borderBox_ra
                        

                        //draw right arrow
                        cp     vga_driver_x1       num_130         //set x1 horizontal line
                        cp     vga_driver_y1       num_65          //set y1
                        cp     vga_driver_x2       num_160         //set x2
                        cp     vga_driver_y2       num_67         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                       //top right diagonal
                        cp     vga_driver_xs1       num_150         //set x1 horizontal line
                        cp     vga_driver_ys1       num_55          //set y1
                        cp     vga_driver_xs2       num_151         //set x2
                        cp     vga_driver_ys2       num_56         //set y2 
                        
                        cp     diag_count         num_0
right_top_diag          cp     vga_driver_x1       vga_driver_xs1         //set x1 horizontal line
                        cp     vga_driver_y1       vga_driver_ys1          //set y1
                        cp     vga_driver_x2       vga_driver_xs2        //set x2
                        cp     vga_driver_y2       vga_driver_ys2 
                        call   vga_driver          vga_driver_ra   //draw box
                        add    vga_driver_xs1     vga_driver_xs1     num_1
                        add    vga_driver_xs2     vga_driver_xs2     num_1
                        add    vga_driver_ys1     vga_driver_ys1     num_1
                        add    vga_driver_ys2     vga_driver_ys2     num_1
                        add    diag_count          diag_count         num_1
                        blt    right_top_diag          diag_count         num_11        
                        cp     diag_count        num_0
                         //bottom right diagonal
                        cp     vga_driver_xs1       num_150         //set x1 horizontal line
                        cp     vga_driver_ys1       num_75          //set y1
                        cp     vga_driver_xs2       num_151         //set x2
                        cp     vga_driver_ys2       num_76         //set y2 

right_bottom_diag       cp     vga_driver_x1       vga_driver_xs1         //set x1 horizontal line
                        cp     vga_driver_y1       vga_driver_ys1          //set y1
                        cp     vga_driver_x2       vga_driver_xs2        //set x2
                        cp     vga_driver_y2       vga_driver_ys2 
                        call   vga_driver        vga_driver_ra   //draw box
                        add    vga_driver_xs1     vga_driver_x1     num_1
                        add    vga_driver_xs2     vga_driver_x2     num_1
                        sub    vga_driver_ys1     vga_driver_ys1    num_1
                        sub    vga_driver_ys2     vga_driver_ys2    num_1
                        add    diag_count        diag_count         num_1
                        blt    right_bottom_diag          diag_count      num_11  
                        
                        
                        cp    diag_count           num_0
                        //draw left arrow
                        cp     vga_driver_x1       num_70         //set x1 horizontal line
                        cp     vga_driver_y1       num_65          //set y1
                        cp     vga_driver_x2       num_100         //set x2
                        cp     vga_driver_y2       num_67         //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                       //top right diagonal
                        cp     vga_driver_xs1       num_70         //set x1 horizontal line
                        cp     vga_driver_ys1       num_64          //set y1
                        cp     vga_driver_xs2       num_71         //set x2
                        cp     vga_driver_ys2       num_65         //set y2 

left_top_diag           cp     vga_driver_x1       vga_driver_xs1         //set x1 horizontal line
                        cp     vga_driver_y1       vga_driver_ys1          //set y1
                        cp     vga_driver_x2       vga_driver_xs2        //set x2
                        cp     vga_driver_y2       vga_driver_ys2 
                        call   vga_driver        vga_driver_ra   //draw box
                        add    vga_driver_xs1     vga_driver_xs1     num_1
                        add    vga_driver_xs2     vga_driver_xs2     num_1
                        sub    vga_driver_ys1     vga_driver_ys1     num_1
                        sub    vga_driver_ys2     vga_driver_ys2     num_1
                        add    diag_count        diag_count         num_1
                        blt    left_top_diag     diag_count         num_11        
                        cp     diag_count        num_0
                         //bottom right diagonal
                        cp     vga_driver_xs1       num_70         //set x1 horizontal line
                        cp     vga_driver_ys1       num_66          //set y1
                        cp     vga_driver_xs2       num_71         //set x2
                        cp     vga_driver_ys2       num_67         //set y2 

left_bottom_diag        cp     vga_driver_x1       vga_driver_xs1         //set x1 horizontal line
                        cp     vga_driver_y1       vga_driver_ys1          //set y1
                        cp     vga_driver_x2       vga_driver_xs2        //set x2
                        cp     vga_driver_y2       vga_driver_ys2 
                        call   vga_driver        vga_driver_ra   //draw box
                        add    vga_driver_xs1     vga_driver_x1     num_1
                        add    vga_driver_xs2     vga_driver_x2     num_1
                        add    vga_driver_ys1     vga_driver_ys1    num_1
                        add    vga_driver_ys2     vga_driver_ys2    num_1
                        add    diag_count        diag_count         num_1
                        blt    left_bottom_diag   diag_count      num_11    
                        
                        
                        ret  draw_arrow_ra
                        
                        
diag_count  .data  0
vga_driver_xs1 .data 0
vga_driver_xs2 .data 0
vga_driver_ys1  .data 0
vga_driver_ys2  .data 0
