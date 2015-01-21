//---------------------------------------------------------
// Checks to see if one of the high boxes is clicked. If so it will draw a 
//green box to indicate that this has happened. it will also set variables to be used by highlight_box
//to keep this square highlighted when something else is clicked
//---------------------------------------------------------
note_clicked      blt    check_rest2_y   num_40     y    //checks to see if it is in the correct y 
                  ret    note_clicked_ra                 //range for all because they all lie in the
check_rest2_y     blt    check_16rest_x        y    num_90   // same plane     
                  blt    return                y     num_100    //checks to see if it is in the correct y 
                  blt    check_sharp1_x        y     num_150   // same plane
                  ret    note_clicked_ra




check_sharp1_x    blt    check_sharp2_x    x           num_300 //checks to see if sharp box is clicked
                  be     check_whole1_x    num_0       num_0   //depending on its x coordinates
check_sharp2_x    blt    highlight_sharp   num_250     x 
                  be     check_whole1_x    num_0       num_0
highlight_sharp   bne    skip_change      write_sharp    num_1
                  cp     highlightcolor          black
                  cp     boxinputX1        num_250
                  cp     boxinputX2        num_300
                  cp     boxinputY1        num_100
                  cp     boxinputY2        num_150
                  cp     boxcolor          num_120
                  call   write_borderBox   write_borderBox_ra 
                  cp     sharpX1           num_250
                  cp     sharpX2           num_300
                  cp     sharpY1           num_100 
                  cp     sharpY2           num_150  
                  out     2                num_30
                  cp     write_sharp       num_0
                  be     check_whole1_x    num_0  num_0
skip_change       cp     boxinputX1        num_250
                  cp     boxinputX2        num_300
                  cp     boxinputY1        num_100
                  cp     boxinputY2        num_150
                  cp     highlightcolor          num_120
                  call   write_borderBox   write_borderBox_ra 
                  cp     sharpX1           boxinputX1
                  cp     sharpX2           boxinputX2
                  cp     sharpY1           boxinputY1 
                  cp     sharpY2           boxinputY2                   
                  
                  out     2                num_50
                  cp     write_sharp       num_1

check_whole1_x    blt    check_whole2_x      x       num_360      //whole high is clicked on x coords
                  be     check_half1_x       num_0   num_0
check_whole2_x    blt    highlight_whole     num_310      x      
                  be     check_half1_x       num_0   num_0
highlight_whole   cp     boxinputX1        num_310
                  cp     boxinputX2        num_360
                  cp     boxinputY1        num_100
                  cp     boxinputY2        num_150
                  cp     boxcolor             num_120
                  cp     highX1           boxinputX1
                  cp     highX2           boxinputX2
                  cp     highY1           boxinputY1 
                  cp     highY2           boxinputY2 
                  call   write_borderBox   write_borderBox_ra
                  cp     note_to_write     num_1
                  ret    note_clicked_ra  
                  
check_half1_x     blt    check_half2_x      x       num_420     //half high is clicked on x coords
                  be     check_quarter1_x   num_0   num_0
check_half2_x     blt    highlight_half     num_370      x      
                  be     check_quarter1_x       num_0   num_0
highlight_half    cp     boxinputX1        num_370
                  cp     boxinputX2        num_420
                  cp     boxinputY1        num_100
                  cp     boxinputY2        num_150
                  cp     boxcolor          num_120
                  cp     highX1           boxinputX1
                  cp     highX2           boxinputX2
                  cp     highY1           boxinputY1 
                  cp     highY2           boxinputY2 
                  call   write_borderBox   write_borderBox_ra
                  cp     note_to_write     num_2
                  ret    note_clicked_ra  

check_quarter1_x  blt    check_quarter2_x    x         num_480  //quarter high is clicked on x coords
                  be     check_eighth1_x     num_0     num_0
check_quarter2_x  blt    highlight_quarter   num_430    x      
                  be     check_eighth1_x       num_0     num_0
highlight_quarter cp     boxinputX1        num_430
                  cp     boxinputX2        num_480
                  cp     boxinputY1        num_100
                  cp     boxinputY2        num_150
                  cp     boxcolor          num_120
                  cp     highX1           boxinputX1
                  cp     highX2           boxinputX2
                  cp     highY1           boxinputY1 
                  cp     highY2           boxinputY2 
                  call   write_borderBox   write_borderBox_ra
                  cp     note_to_write     num_4
                 
                  ret    note_clicked_ra

check_eighth1_x   blt    check_eighth2_x     x         num_540 //1/8 high is clicked based on x  coords
                  be     check_sixteenth1_x  num_0     num_0
check_eighth2_x   blt    highlight_eighth   num_490    x      
                  be     check_sixteenth1_x       num_0     num_0
highlight_eighth  cp     boxinputX1        num_490
                  cp     boxinputX2        num_540
                  cp     boxinputY1        num_100
                  cp     boxinputY2        num_150
                  cp     boxcolor             num_120
                  cp     highX1           boxinputX1
                  cp     highX2           boxinputX2
                  cp     highY1           boxinputY1 
                  cp     highY2           boxinputY2 
                  call   write_borderBox   write_borderBox_ra                  
                  cp     note_to_write     num_8
                  
                ret    note_clicked_ra                  

check_sixteenth1_x  blt  check_sixteenth2_x    x         num_600 //sixteenth high click
                   be    return       num_0     num_0
check_sixteenth2_x  blt  highlight_sixteenth num_550    x      
                  be     return      num_0     num_0
highlight_sixteenth cp   boxinputX1        num_550
                  cp     boxinputX2        num_600
                  cp     boxinputY1        num_100
                  cp     boxinputY2        num_150
                  cp     boxcolor          num_120
                  cp     highX1           boxinputX1
                  cp     highX2           boxinputX2
                  cp     highY1           boxinputY1 
                  cp     highY2           boxinputY2 
                  call   write_borderBox   write_borderBox_ra
                  cp     note_to_write     num_16
                  ret    note_clicked_ra 

check_16rest_x    blt  check_16rest2_x    x         num_600 //sixteenth high click
                  be   return       num_0     num_0
check_16rest2_x   blt  highlight_16rest num_550    x      
                  be   return      num_0     num_0  
highlight_16rest  cp     boxinputX1        num_550
                  cp     boxinputX2        num_600
                  cp     boxinputY1        num_40
                  cp     boxinputY2        num_90
                  cp     boxcolor          num_120
                  cp     highX1           boxinputX1
                  cp     highX2           boxinputX2
                  cp     highY1           boxinputY1 
                  cp     highY2           boxinputY2 
                  call   write_borderBox   write_borderBox_ra
                  cp     note_to_write     num_17
                  out   2          num_60
return            ret    note_clicked_ra

highlightcolor .data 0



