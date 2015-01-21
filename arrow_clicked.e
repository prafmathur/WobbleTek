arrow_clicked     blt    checkarrow2_y         y     num_90
               	  ret    arrow_clicked_ra 
checkarrow2_y     blt    check_left1_x          num_40    y
                  ret    arrow_clicked_ra 
check_left1_x     blt    arrow_clicked_return   x      num_60
                  blt    left_arrow_click       x      num_110    
                  blt    arrow_clicked_return   x      num_120
                  blt    right_arrow_click      x      num_170
                  ret   arrow_clicked_ra


left_arrow_click  be    arrow_clicked_return    daMeasure         zero
                  sub    daMeasure              daMeasure		one
                  cpfa   locAt                  measurelocations   daMeasure       
                  add    num_arrow_click      num_arrow_click     num_1
                  call   measure_num          measure_num_ra
                  be     arrow_clicked_return   black             black
right_arrow_click be    arrow_clicked_return    daMeasure         num_5
                  add    daMeasure              daMeasure       one
                  cpfa   locAt                  measurelocations  daMeasure               
                  sub    num_arrow_click      num_arrow_click     num_1
                  call   measure_num          measure_num_ra
arrow_clicked_return ret    arrow_clicked_ra 



num_arrow_click  .data 0
