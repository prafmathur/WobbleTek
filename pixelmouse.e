        call    clear_screen        clear_screen_ra
        call    write_staff         write_staff_ra
//loop    call    mouse_driver        mouse_driver_ra
//------write back old values
//Reprints the pixel where the cursor used to be
    //--px1
loop    cp     vga_driver_write     one
        cp     vga_driver_x1        x
        cp     vga_driver_x2        x
        cp     vga_driver_y1        y
        cp     vga_driver_y2        y
        cp     vga_driver_color     px1
        call   vga_driver           vga_driver_ra

 
//----update cursor coordinates by getting deltax and deltay from driver
        call    mouse_driver    mouse_driver_ra 
        add     x               x               mouse_deltax
        add     y               y               mouse_deltay

//---Puts mouse whithin range of VGA-----
xhi     blt     set639  xrange  x               
xlo     blt     set479  yrange  y
yhi     blt     xzero   x       zero
ylo     blt     yzero   y       zero
//------------------------------

//-----Read new pixel----------
//stores the color of the pixel where
//the cursor currently is, to print it back later

new_px  cp      vga_driver_write     zero
        cp      vga_driver_x1        x  
        cp      vga_driver_y1        y
        call    vga_driver          vga_driver_ra
        cp      px1                 vga_driver_color_read
       
//------Write cursor----------------
//writes one black pixel to the screen
//where the cursor is

disp    cp      vga_driver_write    one    
        cp      vga_driver_color    black  
        cp      vga_driver_x1       x     
        cp      vga_driver_y1       y
        cp      vga_driver_x2       x
        cp      vga_driver_y2       y
        call    vga_driver          vga_driver_ra 
//-----------------------------------------

        be      loop    zero    zero    //------loop back around
//-----------------------------------------
//This code snippet makes sure
//that the mouse coordinates are 
//within the ranges x:0-639, y:0-479

set639  cp      x       xrange
        be      xlo     zero    zero
set479  cp      y       yrange
        be      yhi     zero    zero
xzero   cp      x       zero
        be      ylo     zero    zero
yzero   cp      y       zero
        be      new_px  zero    zero
//-----------------------------------

//------Data-------------------------
x       .data   0
y       .data   0
xrange  .data   639
yrange  .data   479

px1     .data   126

#include mouse_driver.e
#include vga_driver.e
#include constants.e
#include clear_screen.e
#include write_staff.e