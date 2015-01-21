//This file contains all variables
//MAKE SURE YOU DO NOT MAKE OTHER VARIBABLES WITH THESE NAMES

black     .data 0
white     .data 255
vga_max_r .data 479
vga_max_c .data 639
ra        .data 0
playcheck .data 0
//------------------------------
//Return addresses for functions
//------------------------------

//User Interface
clear_screen_ra      .data 0
write_staff_ra       .data 0
write_quarternote_ra .data 0
write_track_ra       .data 0
mouse_driver_ra      .data 0
MIDI_encode_ra       .data 0
mouse_cursor_ra      .data 0
clickwhere_ra        .data 0
write_noteboxes_ra   .data 0
write_borderBox_ra   .data 0
disp_from_array_ra   .data 0
printWhole_ra        .data 0
printHalf_ra         .data 0
printQuarter_ra      .data 0
printEighth_ra       .data 0
printSixteenth_ra    .data 0
write_load_box_ra    .data 0
save_clicked_ra      .data 0
load_clicked_ra      .data 0
note_sharp_ra        .data 0
note_clicked_ra      .data 0
write_boxnotebox_ra  .data 0
highlight_box_ra     .data 0
print16rest_ra       .data 0
draw_arrow_ra       .data 0
deletelast_ra         .data 0
whichMeasure_ra      .data 0
delete_clicked_ra   .data 0
arrow_clicked_ra    .data 0
measure_num_ra      .data 0
get_word_ret        .data 0
floppy_driver_ret   .data 0


//MIDI_Parser
MIDI_Parser_ra       .data 0
trksearch_ra         .data 0
get_word_ra          .data 0
trkcheck_ra          .data 0

//Division
mod_ra               .data 0
fixpoint_div_ra      .data 0
fixpoint_div2_ra     .data 0
timeconvert_ra       .data 0

//floppy_sequencer
floppy_sequencer_ra  .data 0
get_time_ra          .data 0
get_event_ra         .data 0
time_diff_ra         .data 0

//Drivers
vga_driver_ra        .data 0
floppy_driver_ra     .data 0

//serial port
array_ra             .data 0
serial_port_receive_ra .data 0

//------------------------------
//Time Variables
//------------------------------

//floppy_sequencer
start_time          .data 0
start_time1          .data 0
start_time2          .data 0
curr_time           .data 0
curr_time1           .data 0
curr_time2           .data 0
delta_t              .data 0
waiting_check        .data 0
timepassed1          .data 0
timepassed2          .data 0
ccpb1                .data 0
ccpb2                .data 0
cc1                  .data 0
cc2                  .data 0
timediff_check       .data 0

//------------------------------
//Counters
//------------------------------

//MIDI_Parser
i_trksearch          .data 0
i_trknum             .data 1
noteoncheck          .data 144   //0x0090 (note on event mask)
noteoffcheck         .data 128   //0x0080 (note off event mask)

//floppy_sequencer
wordcount            .data 0
curr_drive           .data 1
i_temp               .data 1

//------------------------------
//Indices
//------------------------------

//General
i                    .data 0     //I know that this is a dangerous one to use, but as long as its used inside
                                 //your own function and no other functions are called, then it should be ok

//------------------------------
//Temporary Values
//------------------------------

//General
temp                 .data 0

//floppy_sequencer
bigendcheck          .data 0
bigendtemp           .data 0
notetemp             .data 0
timepassed           .data 0
i_val                .data 0

//Division
_2X                  .data 0
X                    .data 0
Y                    .data 0
quotient             .data 0 
temp2                .data 0
temp3                .data 0
temp4                .data 0
remainder            .data 0
dividend1            .data 0
dividend2            .data 0
result1              .data 0
result2              .data 0

//------------------------------
//MIDI File Data
//------------------------------

//MIDI_Parser and floppy_sequencer
tracks               .data 0
tracks_valid         .data 0
timediv              .data 0
tempo1               .data 0
tempo2               .data 0

//----------------------------
//Current Measure
//----------------------------
daMeasure .data 0

//------------------------------
//Arrays
//------------------------------
//MIDI_Parser
trkhead              .data 0     //placeholder value so that index matches with track number
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

trkheadhalf          .data 0     //placeholder value so that index matches with track number
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

//floppy_sequencer
waiting              .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

trkpos               .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

ishalfwordarray      .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

end                  .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

togglehwarray        .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

start_time1_array    .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

start_time2_array    .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

cc1_array            .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

cc2_array            .data 0     //value placeholder
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

//floppy_driver
drive_note           .data 0     //empty placeholder for drive 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0
                     .data 0

note_out             .data 0     //empty placeholfer for drive 0                 
drive_1_note_out     .data 0     //this is an array, but each value is labeled so that the out ports can use specific values
drive_2_note_out     .data 0
drive_3_note_out     .data 0
drive_4_note_out     .data 0
drive_5_note_out     .data 0
drive_6_note_out     .data 0
drive_7_note_out     .data 0
drive_8_note_out     .data 0

//------------------------------
//Flags
//------------------------------

//General
errorcode            .data 0     //Variable that stores the error code for all functions
                                 //Errorcode definitions:
                                 //0: No error
                                 //1: Downloaded MIDI file has improper MIDI type (must be either type 0 or 1)
                                 //2: Downloaded MIDI file has too many parts for the player to play

//MIDI_Parser and floppy_sequencer
ishalfword     .data     0
togglehalfword .data     0

//floppy_driver
floppy_in      .data     0

//------------------------------
//Constants
//------------------------------

//Decimal numbers
zero     .data 0
one      .data 1
two      .data 2
three    .data 3
four     .data 4
eight    .data 8
new_x    .data 0
new_y    .data 0
write_sharp .data 0
num_-1   .data -1
num_0    .data 0
num_1    .data 1
num_2    .data 2
num_3    .data 3
num_4    .data 4
num_5    .data 5
num_6    .data 6
num_7    .data 7
num_8    .data 8
num_9    .data 9 
num_10   .data 10
num_11   .data 11
num_12   .data 12
num_13   .data 13
num_14   .data 14
num_15   .data 15
num_16   .data 16
num_17   .data 17 
num_18   .data 18
num_19   .data 19                
num_20   .data 20
num_22   .data 22
num_30   .data 30
num_33   .data 33
num_34   .data 34
num_35   .data 35
num_36   .data 36
num_37   .data 37
num_38   .data 38
num_39   .data 39
num_40   .data 40
num_41   .data 41
num_42   .data 42
num_43   .data 43
num_44   .data 44
num_45   .data 45
num_46   .data 46
num_47   .data 47
num_48   .data 48
num_49   .data 49
num_50   .data 50
num_51   .data 51 
num_52   .data 52
num_53   .data 53
num_54   .data 54
num_55   .data 55
num_56   .data 56
num_57   .data 57
num_59   .data 59
num_60   .data 60
num_61   .data 61
num_64   .data 64
num_65   .data 65
num_66   .data 66
num_67   .data 67
num_70   .data 70
num_71   .data 71
num_74   .data 74
num_75   .data 75
num_76   .data 76
num_77   .data 77
num_79   .data 79
num_80   .data 80
num_90   .data 90
num_92   .data 92
num_94   .data 94
num_99   .data 99
num_100  .data 100
num_102  .data 102
num_105  .data 105
num_110  .data 110
num_111  .data 111
num_112  .data 112
num_114  .data 114
num_116  .data 116
num_117  .data 117
num_118  .data 118
num_119  .data 119
num_120  .data 120
num_125  .data 125
num_127  .data 127
num_128  .data 128
num_129  .data 129
num_130  .data 130
num_131  .data 131
num_132  .data 132
num_134  .data 134
num_135  .data 135
num_136  .data 136
num_137  .data 137    
num_138  .data 138
num_139  .data 139
num_140  .data 140
num_141  .data 141
num_142  .data 142
num_144  .data 144
num_145  .data 145
num_148  .data 148
num_150  .data 150
num_151  .data 151
num_152  .data 152
num_154  .data 154
num_155  .data 155
num_160  .data 160
num_170  .data 170
num_180  .data 180
num_190  .data 190
num_191  .data 191
num_200  .data 200
num_210  .data 210
num_230  .data 230
num_240  .data 240
num_250  .data 250
num_260  .data 260
num_262  .data 262
num_270  .data 270
num_272  .data 272
num_278  .data 278
num_280  .data 280
num_288  .data 288
num_290  .data 290
num_299  .data 299
num_300  .data 300
num_310  .data 310
num_312  .data 312
num_315  .data 315
num_317  .data 317
num_319  .data 319
num_320  .data 320
num_321  .data 321
num_325  .data 325
num_327  .data 327
num_330  .data 330
num_340  .data 340
num_345  .data 345
num_350  .data 350
num_358  .data 358
num_360  .data 360
num_370  .data 370
num_385  .data 385
num_393  .data 393
num_398  .data 398
num_400  .data 400 
num_403  .data 403
num_410  .data 410
num_420  .data 420
num_430  .data 430
num_445  .data 445
num_463  .data 463
num_465  .data 465
num_474  .data 474
num_475  .data 475
num_480  .data 480
num_490  .data 490
num_500  .data 500
num_505  .data 505
num_523  .data 523
num_525  .data 525
num_535  .data 535
num_540  .data 540
num_550  .data 550
num_560  .data 560 
num_565  .data 565
num_570  .data 570
num_572  .data 572
num_575  .data 575
num_580  .data 580
num_582  .data 582
num_583  .data 583
num_585  .data 585
num_595  .data 595
num_600  .data 600
num_700  .data 700
num_629  .data 629
num_800  .data 800
num_960  .data 960
num_1000 .data 1000

//Hex numbers
_0x000C  .data 12
_0x000D  .data 13
_0x000F  .data 15
_0x0051  .data 81
_0x007F  .data 127
_0x0080  .data 128                //0x0090 note off event mask
_0x0081  .data 129
_0x0090  .data 144                //0x0090 note on event mask
_0x0091  .data 145
_0x00FF  .data 255
_0x1000  .data 4096
_0x3F80  .data 16256
_0x4000  .data 16384
_0x7F00  .data 32512
_0x7FFF  .data 32767
_0x8000  .data -32768
_0xFF2F  .data -209               //Meta-event: End of track
_0xFF51  .data -175               //Meta-event: Tempo change
_0xFFFF  .data -1
//Other Constants
MT       .data 19796              //0x4D54
M        .data 77                 //0x004D
rk       .data 29291              //0x726B


MIDI_array   .data   0
