// Sets the locations of the last note

whichMeasure    cp      curnote         zero
                cp      num_measure     one
                cp      totalLength     zero
measureloop     cpfa    anote           track1          curnote
                sr      notelength      anote           num_8
                be      sRest           notelength      num_17
                be      retmes          notelength      zero
                div     invlength       num_16          notelength
                add     totalLength     totalLength     invlength           
sRet            add     curnote         curnote         one
                blt      setmeasure      num_15          totalLength
afterset        blt     measureloop     curnote         num_99
retmes          ret     whichMeasure_ra


sRest           add     totalLength     totalLength     one
                be      sRet            zero            zero


setmeasure      cpta    curnote             measurelocations    num_measure
                add     num_measure         num_measure one
                cp      totalLength         zero
                be      afterset            zero        zero



measurelocations    .data   0
                    .data   17
                    .data   33
                    .data   49
                    .data   65
                    .data   81

curnote     .data 0
anote       .data 0
invlength   .data 0
totalLength .data 0
notelength  .data 0
num_measure .data 1