              //fixed point multiplication
              //takes in two single-word integers (factor1, factor2)
              //returns their product (prod1, prod2)
              //product is stored as 2^15*prod1 + prod2
              
fixpoint_mult sr     m1     factor1   num_8
              and    m2     factor1   _0x00FF
              sr     m3     factor2   num_8
              and    m4     factor2   _0x00FF
              
              mult   prod1  m1        m3
              mult   temp2  m1        m4
              mult   temp3  m2        m3
              add    temp   temp2     temp3
              sr     temp   temp      num_8
              add    prod1  prod1     temp
              sl     prod1  prod1     num_1
              
              add    temp   temp2     temp3
              and    temp   temp      _0x00FF
              mult   temp2  m2        m4
              blt    shiftover1 temp2 num_0
shiftret      sr     temp3  temp2     num_8
              add    temp   temp      temp3
              and    temp2  temp2     _0x00FF
              sl     temp   temp      num_8
              add    prod2  temp      temp2
              blt    shiftover prod2  num_0
              ret    fixpoint_mult_ra
              
shiftover     and    prod2  prod2     _0x7FFF
              add    prod1  prod1     num_1
              ret    fixpoint_mult_ra

shiftover1    add    prod1  prod1    num_1
              and    temp2  temp2    _0x7FFF
              be     shiftret 0       0
m1 .data 0
m2 .data 0
m3 .data 0
m4 .data 0              
prod1 .data 0
prod2 .data 0
factor1 .data 0
factor2 .data 0
fixpoint_mult_ra .data 0

                
                
                //type 2 fixed point division
                //takes in a 2-word tempo stored as 2^16*tempo1 + tempo2
                //returns a fixed point dividend (result1, result2) stored as
                //result1 + 2^-15 * result2
                
fixpoint_div2   sl     X           tempo1       num_1        // copy tempo1 into the 2^15 place value
                cp     Y           tempo2                    // copy tempo2 into the 2^0  place value
                cp     quotient    num_200                   // copy 200 as the divisor
                
                blt    divide      num_-1       Y            // shift the 2^16 place into the first word
                and    Y           Y            _0x7FFF
                add    X           X            num_1
               
divide          sl     _2X         X            num_1        // 2*X
                div    temp3       _0x4000      quotient     // floor(2^14/Q)
                mult   result1     temp3        _2X          // 2X*floor(2^14/Q)
                div    temp        Y            quotient     // floor(Y/Q)
                add    result1     result1      temp         // 2X*floor(2^14/Q) + floor(Y/Q)
                cp     remainder   _0x4000                   // copy 2^14
                call   mod         mod_ra                    // 2^14 mod Q
                mult   temp        remainder    _2X          // (2^14 mod Q) * 2X
                div    temp2       temp         quotient     // floor(((2^14 mod Q) * 2X)/Q)
                add    result1     result1      temp2        // add ^^^ to result
                cp     remainder   temp                      // copy (2^14 mod Q) * 2X
                call   mod         mod_ra                    // ((2^14 mod Q) * 2X) mod Q
                cp     temp4       remainder
                cp     remainder   Y
                call   mod         mod_ra                    // Y mod Q
                add    result2     temp4        remainder    // (((2^14 mod Q) * 4X) mod Q) + (Y mod Q)
                mult   result2     result2      temp3        //  ^^^ * floor(2^14/Q)
                sl     result2     result2      num_1        //  result2 * 2
                blt    shift       result2      num_0
                be     div2        0            0
shift           and    result2     result2      _0x7FFF
                add    result1     result1      num_1
                be     div2        0            0
                
div2            cp     dividend1   result1
                cp     dividend2   result2
                cp     quotient    num_210
                call   fixpoint_div fixpoint_div_ra 
                
                cp     ccpb1       result1
                cp     ccpb2       result2
                ret    fixpoint_div2_ra 
          
                //time convert function
                //converts single word delta_t (units of MIDI ticks)
                //to number of clock cycles (cc1, cc2)
                //cc1 corresponds to number of slow clock cycles (23.8 Hz)
                //cc2 corresponds to number of fast clock cycles (781 kHz)
timeconvert     be    setzero      delta_t     num_0
                blt   dividetempo  delta_t     timediv       //If delta_t < timediv, timediv/delta_t
                div   factor1      delta_t     timediv
                cp    factor2      ccpb2
                call  fixpoint_mult fixpoint_mult_ra
                mult  cc1          ccpb1       factor1
                add   cc1          cc1         prod1
                cp    cc2          prod2
                ret   timeconvert_ra
        
dividetempo     div   quotient     timediv     delta_t       //If delta_t > timediv, delta_t/timediv
                cp    dividend1    ccpb1
                cp    dividend2    ccpb2
                call  fixpoint_div fixpoint_div_ra
                cp    cc1          result1
                cp    cc2          result2
                ret   timeconvert_ra 
                
setzero         cp    cc1          num_0
                cp    cc2          num_0
                ret   timeconvert_ra

                //type 1 fixed point division
                //takes in a fixed point number and integer quotient
                //(dividend1, dividend2, quotient), stored as
                //dividend1 + 2^-15 * dividend2, quotient
                //returns the fixed point dividend (result1, result2)
                //stored as result1 + 2^-15 * result2
fixpoint_div    div    result1     dividend1    quotient     // floor(dividend1/quotient)
                cp     remainder   dividend1                 // copy dividend1
                call   mod         mod_ra                    // dividend1 mod quotient
                sl     remainder   remainder    num_1        // remainder * 2     PC 220
                div    result2     _0x4000      quotient     // floor(2^14/quotient)
                mult   result2     result2      remainder    // result2 * remainder
                div    temp        dividend2    quotient     // floor(dividend2/quotient)
                add    result2     result2      temp         // floor(dividend2/quotient) + result2
                blt    shift2      result2      num_0        // shift the 2^0 bit over to the first word
                ret    fixpoint_div_ra 
shift2          and    result2     result2      _0x7FFF
                add    result1     result1      num_1
                ret    fixpoint_div_ra 
                
mod             blt    endmod      remainder    quotient     // remainder mod quotient PC260
                sub    remainder   remainder    quotient
                be     mod         0            0
endmod          ret    mod_ra 
