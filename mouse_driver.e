mouse_driver    out 70              on                      //set command parameter
response_on     in  71              mouse_response
                bne response_on     mouse_response   on


getx            in  72              mouse_deltax
gety            in  73              mouse_deltay
getbut1         in  74              mouse_button1
getbut2         in  75              mouse_button2   
getbut3         in  76              mouse_button3

settozero       out 70              off
response_off    in  71              mouse_response
                bne response_off    mouse_response  off             
                ret mouse_driver_ra


on                  .data   1
off                 .data   0
mouse_deltax        .data   0
mouse_deltay        .data   0
mouse_button1       .data   0
mouse_button2       .data   0
mouse_button3       .data   0
mouse_response      .data   0
