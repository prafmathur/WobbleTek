//draw load box and L inside

write_load_box          cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    num_120          //set color to green
                       
                        cp     vga_driver_x1       num_120         //set x1
                        cp     vga_driver_y1       num_100         //set y1
                        cp     vga_driver_x2       num_170         //set x2
                        cp     vga_driver_y2       num_150        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        //draw vertical bar for L
                       cp     vga_driver_color    black          //set color to black
                        cp     vga_driver_x1       num_137         //set x1
                        cp     vga_driver_y1       num_117         //set y1
                        cp     vga_driver_x2       num_139         //set x2
                        cp     vga_driver_y2       num_134        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                       //Draw horizontal bar for L
                        cp     vga_driver_x1       num_137         //set x1
                        cp     vga_driver_y1       num_132         //set y1
                        cp     vga_driver_x2       num_154         //set x2
                        cp     vga_driver_y2       num_134        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box 
                        //draw load box border
                        cp     boxinputX1        num_120
                        cp     boxinputX2        num_170
                        cp     boxinputY1        num_100
                        cp     boxinputY2        num_150
                        cp     boxcolor          black
                        call   write_borderBox   write_borderBox_ra

                        //draw save box
                        cp     vga_driver_color    num_80          //set color to ????
                       
                        cp     vga_driver_x1       num_60         //set x1
                        cp     vga_driver_y1       num_100         //set y1
                        cp     vga_driver_x2       num_110         //set x2
                        cp     vga_driver_y2       num_150        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                       //draw S
                        // top horizontal bar
                        cp     vga_driver_write    one             //set vga_driver_write to one
                        cp     vga_driver_color    black          //set color to black
                       
                        cp     vga_driver_x1       num_77         //set x1
                        cp     vga_driver_y1       num_117         //set y1
                        cp     vga_driver_x2       num_94         //set x2
                        cp     vga_driver_y2       num_119        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                         //middle horizontal bar
                        cp     vga_driver_x1       num_77         //set x1
                        cp     vga_driver_y1       num_125         //set y1
                        cp     vga_driver_x2       num_94         //set x2
                        cp     vga_driver_y2       num_127        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box

                        //bottom horizontal bar
                        cp     vga_driver_x1       num_77         //set x1
                        cp     vga_driver_y1       num_134         //set y1
                        cp     vga_driver_x2       num_94         //set x2
                        cp     vga_driver_y2       num_136        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        //top left vertical bar
                        cp     vga_driver_x1       num_77         //set x1
                        cp     vga_driver_y1       num_117         //set y1
                        cp     vga_driver_x2       num_79         //set x2
                        cp     vga_driver_y2       num_127        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        //bottom right vertical bar
                        cp     vga_driver_x1       num_92         //set x1
                        cp     vga_driver_y1       num_125         //set y1
                        cp     vga_driver_x2       num_94         //set x2
                        cp     vga_driver_y2       num_136        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        //draw save border
                        cp     boxinputX1        num_60
                        cp     boxinputX2        num_110
                        cp     boxinputY2        num_100
                        cp     boxinputY2        num_150
                        cp     boxcolor          black
                        call   write_borderBox   write_borderBox_ra

                        //draw delete box
                        cp     vga_driver_color    num_200          //set color to ????
                       
                        cp     vga_driver_x1       num_180         //set x1
                        cp     vga_driver_y1       num_100         //set y1
                        cp     vga_driver_x2       num_230         //set x2
                        cp     vga_driver_y2       num_150        //set y2 
                        call   vga_driver          vga_driver_ra   //draw box
                        
                         //top right diagonal
                        cp     vga_driver_xs1       num_190         //set x1 horizontal line
                        cp     vga_driver_ys1       num_110          //set y1
                        cp     vga_driver_xs2       num_191         //set x2
                        cp     vga_driver_ys2       num_111         //set y2 
                        cp     vga_driver_color    black
                        cp     diag_count         num_0

right_diag              cp     vga_driver_x1       vga_driver_xs1         //set x1 horizontal line
                        cp     vga_driver_y1       vga_driver_ys1          //set y1
                        cp     vga_driver_x2       vga_driver_xs2        //set x2
                        cp     vga_driver_y2       vga_driver_ys2 
                        call   vga_driver          vga_driver_ra   //draw box
                        add    vga_driver_xs1     vga_driver_xs1     num_1
                        add    vga_driver_xs2     vga_driver_xs2     num_1
                        add    vga_driver_ys1     vga_driver_ys1     num_1
                        add    vga_driver_ys2     vga_driver_ys2     num_1
                        add    diag_count          diag_count         num_1
                        blt    right_diag          diag_count         num_30        
                       
                        cp     diag_count        num_0
                        cp     vga_driver_xs1       num_190         //set x1 horizontal line
                        cp     vga_driver_ys1       num_140          //set y1
                        cp     vga_driver_xs2       num_191         //set x2
                        cp     vga_driver_ys2       num_141         //set y2 
left_diag              cp     vga_driver_x1       vga_driver_xs1         //set x1 horizontal line
                        cp     vga_driver_y1       vga_driver_ys1          //set y1
                        cp     vga_driver_x2       vga_driver_xs2        //set x2
                        cp     vga_driver_y2       vga_driver_ys2 
                        call   vga_driver          vga_driver_ra   //draw box
                        add    vga_driver_xs1     vga_driver_xs1     num_1
                        add    vga_driver_xs2     vga_driver_xs2     num_1
                        sub    vga_driver_ys1     vga_driver_ys1     num_1
                        sub    vga_driver_ys2     vga_driver_ys2     num_1
                        add    diag_count          diag_count        num_1
                        blt    left_diag          diag_count         num_30 
                       
                       //draw delete box border
                                               //draw load box border
                        cp     boxinputX1        num_180
                        cp     boxinputX2        num_230
                        cp     boxinputY1        num_100
                        cp     boxinputY2        num_150
                        cp     boxcolor          black
                        call   write_borderBox   write_borderBox_ra

                        ret    write_load_box_ra





