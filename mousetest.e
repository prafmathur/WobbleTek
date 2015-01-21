        call    clear_screen    clear_screen_ra
        call    write_staff     write_staff_ra
loop    call    mouse_driver    mouse_driver_ra
        be      checky          mouse_deltax        zero
checky  be      loop            mouse_deltay        zero
//------write back old values
    //--px1
        cp      vga_driver_write    one
        cp      vga_driver_x1       x
        cp      vga_driver_x2       x
        cp      vga_driver_y1       y
        cp      vga_driver_y2       y
        cp      vga_driver_color    px1
        call    vga_driver          vga_driver_ra

    //--px2
        add     vga_driver_x1       vga_driver_x1   one
        add     vga_driver_x2       vga_driver_x2   one
        cp      vga_driver_color    px2
        call    vga_driver          vga_driver_ra

    //--px3
        add     vga_driver_x1       vga_driver_x1   one
        add     vga_driver_x2       vga_driver_x2   one
        cp      vga_driver_color    px3
        call    vga_driver          vga_driver_ra

    //--px4
        cp      vga_driver_x1       x
        cp      vga_driver_x2       x
        add     vga_driver_y1       vga_driver_y1   one
        add     vga_driver_y2       vga_driver_y2   one
        cp      vga_driver_color    px4
        call    vga_driver          vga_driver_ra
    //--px5
        add     vga_driver_x1       vga_driver_x1   one
        add     vga_driver_x2       vga_driver_x2   one
        cp      vga_driver_color    px5
        call    vga_driver          vga_driver_ra
    //--px6
        add     vga_driver_x1       vga_driver_x1   one
        add     vga_driver_x2       vga_driver_x2   one
        cp      vga_driver_color    px6
        call    vga_driver          vga_driver_ra
    //--px7
        cp      vga_driver_x1       x
        cp      vga_driver_x2       x
        add     vga_driver_y1       vga_driver_y1   one
        add     vga_driver_y2       vga_driver_y2   one
        cp      vga_driver_color    px7
        call    vga_driver          vga_driver_ra
    //--px8
        add     vga_driver_x1       vga_driver_x1   one
        add     vga_driver_x2       vga_driver_x2   one
        cp      vga_driver_color    px8
        call    vga_driver          vga_driver_ra
    //--px9
        add     vga_driver_x1       vga_driver_x1   one
        add     vga_driver_x2       vga_driver_x2   one
        cp      vga_driver_color    px9
        call    vga_driver          vga_driver_ra

//--update cursor
        add     x                   x               mouse_deltax
        add     y                   y               mouse_deltay

//--checks range of mouse-------------
xhi     blt     set639  xrange  x               
xlo     blt     set479  yrange  y
yhi     blt     xzero   x       zero
ylo     blt     yzero   y       zero
//------------------------------
//-----Read old pixels----------
readpx  cp      vga_driver_write     zero
        //y = 1
        cp      vga_driver_x1        x  
        cp      vga_driver_y1        y
        call    vga_driver          vga_driver_ra
        cp      px1                 vga_driver_color_read

        add     vga_driver_x1       vga_driver_x1   one
        call    vga_driver          vga_driver_ra
        cp      px2                 vga_driver_color_read

        add     vga_driver_x1       vga_driver_x1   one
        call    vga_driver          vga_driver_ra
        cp      px3                 vga_driver_color_read


        //y = 2
        cp      vga_driver_x1       x
        add     vga_driver_y1       vga_driver_y1   one
        call    vga_driver          vga_driver_ra
        cp      px4                 vga_driver_color_read

        add     vga_driver_x1       vga_driver_x1   one
        call    vga_driver          vga_driver_ra
        cp      px5                 vga_driver_color_read
        
        add     vga_driver_x1       vga_driver_x1   one
        call    vga_driver          vga_driver_ra
        cp      px6                 vga_driver_color_read

        //y = 3
        cp      vga_driver_x1       x
        add     vga_driver_y1       vga_driver_y1   one
        call    vga_driver          vga_driver_ra
        cp      px7                 vga_driver_color_read

        add     vga_driver_x1       vga_driver_x1   one
        call    vga_driver          vga_driver_ra
        cp      px8                 vga_driver_color_read
        
        add     vga_driver_x1       vga_driver_x1   one
        call    vga_driver          vga_driver_ra
        cp      px9                 vga_driver_color_read

        


//------Write new pixels----------------
        cp      vga_driver_write    one    
        cp      vga_driver_color    black  
        cp      vga_driver_x1       x     
        cp      vga_driver_y1       y     
        add     xplus2              x       two
        add     yplus2              y       two
        cpfa    vga_driver_x2       xplus2  zero   
        cpfa    vga_driver_y2       yplus2  zero
        call    vga_driver          vga_driver_ra 
//-----------------------------------------
    



        be      loop    zero    zero

set639  cp      x       xrange
        be      xlo     zero    zero
set479  cp      y       yrange
        be      yhi     zero    zero
xzero   cp      x       zero
        be      ylo     zero    zero
yzero   cp      y       zero
        be      readpx  zero    zero


x               .data   0
y               .data   0
xrange          .data   639
yrange          .data   479
mousetest_ra    .data   0

xplus2          .data   0
yplus2          .data   0
two             .data   2

px1             .data 0
px2             .data 0 
px3             .data 0 
px4             .data 0
px5             .data 0
px6             .data 0
px7             .data 0
px8             .data 0
px9             .data 0



#include        mouse_driver.e
#include        vga_driver.e
#include        constants.e
#include        clear_screen.e
#include        write_staff.e
