//display from array function


disp_from_array	cp      index		locAt	
				cp      measureCount zero
disploop		cpfa 	note 		track1 		index
//--------------------------------------------------
//		Get values of note length and number
//--------------------------------------------------
				sr 		note_length note 		num_8
				sl 		noteNum 	note 		num_8
				sr		noteNum		noteNum		num_8
//---------------------------------------------------
// 		If note_length = 0, write a rest
//---------------------------------------------------

				be      writeRest	note_length		zero

//-------------------------------------------------------------
//	From low E to high Fsharp, select which note must be played
//--------------------------------------------------------------
				be 	writeE		noteNum	num_40
				be 	writeF		noteNum	num_41
				be 	writeFs		noteNum num_42
				be 	writeG		noteNum	num_43
				be 	writeGs		noteNum num_44
				be 	writeA		noteNum	num_45
				be 	writeAs		noteNum num_46
				be 	writeB		noteNum	num_47
				be 	writeC 		noteNum	num_48
				be 	writeCs		noteNum num_49
				be 	writeD		noteNum	num_50
				be 	writeDs		noteNum num_51
				be 	writeE2		noteNum	num_52
				be 	writeF2		noteNum	num_53
				be 	writeF2s	noteNum	num_54
//--------------------------------------------------------------
//			Increments index in array, adds to X offset
//--------------------------------------------------------------
retloc			add 	index 		index 		one
				cp 		yoffset		num_393
				blt     disploop	measureCount num_16
//--------------------------------------------------------------
exitloop		cp 		xoffset		num_20
				ret 	disp_from_array_ra
				



writeRest		add xoffset	xoffset num_35
				add measureCount	measureCount one
				be retloc 0 0



//--------------------------------------------------------------
//	Sets Values of X and Y for print functions
//--------------------------------------------------------------
writeE 					cp  noteX1      	xoffset
						cp 	toggleSharp		zero
						cp  noteY1			yoffset
						be 	 printNote 0 0

writeF 					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_20
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeFs					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_20
						cp 	toggleSharp	one
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeG 					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_40
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeGs					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_40
						cp 	toggleSharp	one
						cp  noteY1		yoffset
						be 	 printNote 0 0						

writeA 					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_60
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeAs 				cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_60
						cp 	toggleSharp	one
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeB 					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_80
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeC 					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_100
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeCs 				cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_100
						cp 	toggleSharp	one
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeD 					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_120
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeDs 				cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_120
						cp 	toggleSharp	one
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeE2					cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_140
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeF2 				cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_160
						cp 	toggleSharp		zero
						cp  noteY1		yoffset
						be 	 printNote 0 0

writeF2s 				cp 	noteX1		xoffset
						sub	yoffset		yoffset		num_160
						cp 	toggleSharp	one
						cp  noteY1		yoffset
						be 	 printNote 0 0

//----------------------------------------------------------------------


//-----------------------------------------------------------------------
//			Prints note based on length
//-----------------------------------------------------------------------
printNote				be whole		note_length	num_1
						be half			note_length	num_2
						be quarter		note_length	num_4
						be eighth		note_length	num_8
						be sixteenth	note_length	num_16
                        be sxteenrest   note_length num_17

whole					call	printWhole		printWhole_ra
						add     measureCount	measureCount	num_16
						add     xoffset			xoffset			num_560
						be      retloc	0	0
half					call	printHalf		printHalf_ra
						add     measureCount	measureCount	num_8
						add     xoffset			xoffset			num_280
						be      retloc	0	0
quarter					call	printQuarter	printQuarter_ra
						add     measureCount	measureCount	num_4
						add     xoffset			xoffset			num_140
						be      retloc	0	0
eighth					call	printEighth		printEighth_ra
						add     measureCount	measureCount	num_2
						add     xoffset			xoffset			num_70
						be      retloc	0	0
sixteenth				call	printSixteenth	printSixteenth_ra
						add     measureCount	measureCount	one
						add     xoffset			xoffset			num_35
						be      retloc	0	0
sxteenrest              call	print16rest	 print16rest_ra
						add     measureCount	measureCount	one
						add     xoffset			xoffset			num_35
						be      retloc	0	0
//-------------------------------------------------------------------------





				
note 		.data 0
note_length	.data 0
noteNum	.data 0
toggleSharp .data 0
xoffset		.data 20
yoffset		.data 393
noteX1		.data 0
noteY1		.data 0
measureCount	.data 0
index		.data	0
locAt	.data 0
