//find_measures

//-------find_measures function below-------------------------

int totalLength = 0;                    // start a fresh count every run through the main loop, to see how many beats their are
for(i=0; i<100; i++){                   // loop through the track
    if(array[i]==0) break;              // You are done as soon as you hit a zero entry, so exit the loop to stop counting how many beats

    notelength = array[i] >> 8;         // Get the note length by shifting the value of the array right by 8 bits

    if(notelength == 17)                // If it's a sixteenth rest, add 1 to the total beat count, totalLength
        totalLength++;
    else
        totalLength += 16/notelength;   // If it isn't a rest, calculate how many beats it is with the formaula: beats = 16/notelength. add this totalLength

    if (totalLength == 16)              // As you are tallying up the number of beats, you want to keep track of the indeces of when you reach the ends of any measures
        measure2 = i+1;                 // which occur at multiples of sixteeen. I the measure location is that index PLUS ONE becuase the next measure starts
    if (totalLength == 32)              // starts after that beat
        measure3 = i+1;
    if (totalLength == 48)
        measure4 = i+1;
    if (totalLength == 64)
        measure5 = i+1;
    if (totalLength == 80)
        measure6 = i+1;
}

//---------find_measures function above---------------------

//      <--  -->  left and right arrows change a variable called "measure_state" when clicked.
//      "measure_state" should only allowed to be from 1 to 6

//      At the top of disp_from_array.e the index should now be determined by the value of "measure_state" instead of the old method
//      like so:

if(measure_state == 1)
    index = 0;

if(measure_state == 2)
    index = measure2;

if(measure_state == 3)
    index = measure3;

if(measure_state == 4)
    index = measure4;

if(measure_state == 5)
    index = measure5;

if(measure_state == 6)
    index = measure6;


//      The order of function calling in the main loop should be 
//      1. find_measures
//      2. disp_from_array