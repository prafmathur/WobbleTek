delete_clicked    blt    check_delete2_y     y              num_150
                  ret    delete_clicked_ra
check_delete2_y   blt    check_delete1_x     num_100         y
                  ret    delete_clicked_ra
check_delete1_x    blt   check_delete2_x     x               num_230
                  ret    delete_clicked_ra
check_delete2_x   blt    call_dlast  num_170           x                 
                  ret   delete_clicked_ra

call_dlast      call   deletelast      deletelast_ra
                out    2      num_8
delete_clicked_return ret    delete_clicked_ra 