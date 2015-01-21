//This file has arrays for the track information
//Each track will have 2 arrays
//one is for note type (length, such as whole note, quarter note, etc)
//the other is for note value (frequency)


//--------------IGNORE------------------------------------
//track2      .data 100   //offset of track 2 from track 1
//track3      .data 200   //offset of track 3 from track 1
//track4      .data 300   //offset of track 4 from track 1
//track5      .data 400   //offset of track 5 from track 1
//track6      .data 500   //offset of track 6 from track 1
//track7      .data 600   //offset of track 7 from track 1
//track8      .data 700   //offset of track 8 from track 1
//--------------IGNORE------------------------------------


i_t1        .data 100   //i values for each tracks
i_t2        .data 200   //i values for all other tracks start with offsets from track0
i_t3        .data 300      //with gaps of 100 in between each track
i_t4        .data 400
i_t5        .data 500
i_t6        .data 600
i_t7        .data 700
i_t8        .data 800



track0      .data 0     //placeholder for track 0, element 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 9
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 19
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 29
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 39
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 49
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 59
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 69
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 79
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 89
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 99
track1      .data 0    // E,qr = 0x0434     //element 100
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0    //element 109
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 119
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 129
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 139
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 149
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 159
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 169
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 179
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 189
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 199
track2      .data 0     //element 200
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 209
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 219
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 229
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 239
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 249
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 259
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 269
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 279
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 289
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 299
track3      .data 0     //element 300
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 309
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 319
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 329
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 339
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 349
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 359
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 369
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 379
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 389
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 399
track4      .data 0     //element 400
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 409
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 419
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 429
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 439
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 449
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 459
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 469
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 479
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 489
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 499
track5      .data 0     //element 500
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 509
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 519
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 529
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 539
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 549
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 559
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 569
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 579
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 589
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 599
track6      .data 0     //element 600
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 609
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 619
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 629
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 639
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 649
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 659
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 669
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 679
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 689
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 699
track7      .data 0     //element 700
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 709
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 719
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 729
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 739
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 749
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 759
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 769
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 779
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 789
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 799
track8      .data 0     //element 800
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 809
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 819
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 829
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 839
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 849
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 859
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 869
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 879
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 889
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0     //element 899

 