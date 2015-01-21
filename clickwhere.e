//Onclick function
//Requires: Button1 on mouse is clicked


//--------------------- bar1
//						space1
//---------------------	bar2
//						space2
//---------------------	bar3
//						space3
//--------------------- bar4
//						space4
//---------------------	bar5

clickwhere	blt		randomclick	bar5y2		y
			blt		randomclick	y			bar1y1
			blt		randomclick	staffx2		x
			blt     randomclick	x			staffx1

pickstaff	blt		setbar5			bar5y1		y		
			blt		setspace4		space4y1	y		
			blt		setbar4			bar4y1		y
			blt		setspace3		space3y1	y				
			blt		setbar3			bar3y1		y		
			blt		setspace2		space2y1	y		
			blt		setbar2			bar2y1		y		
			blt		setspace1		space1y1	y		
			blt		setbar1			bar1y1		y		

setbar5		cp		bar5select		one
			cp		track_num		one
			cp		note_L			note_to_write
			cp		note_num		num_40
			call	write_track		write_track_ra
			ret		clickwhere_ra


setbar4		cp		bar4select		one
			cp		track_num		one
			cp		note_L			note_to_write
			be 		gs   			write_sharp		one
			cp		note_num		num_43
			call	write_track		write_track_ra
			ret		clickwhere_ra	

gs			cp		note_num		num_44
			call	write_track		write_track_ra
			ret		clickwhere_ra	


setbar3		cp		bar3select		one
			cp		track_num		one
			cp		note_L			note_to_write
			cp		note_num		num_47
			call	write_track		write_track_ra
			ret		clickwhere_ra	

setbar2		cp		bar2select		one
			cp		track_num		one
			cp		note_L			note_to_write
			be 		ds   			write_sharp		one
			cp		note_num		num_50
			call	write_track		write_track_ra
			ret		clickwhere_ra
ds			cp		note_num		num_51
			call	write_track		write_track_ra
			ret		clickwhere_ra	

setbar1		cp		bar1select		one
			cp		track_num		one
			cp		note_L			note_to_write
			be 		fs2   			write_sharp		one
			cp		note_num		num_53
			call	write_track		write_track_ra	
			ret		clickwhere_ra

fs2			cp		note_num		num_54
			call	write_track		write_track_ra
			ret		clickwhere_ra	

setspace4	cp		space4select	one
			cp		track_num		one
			cp		note_L			note_to_write
			be 		fs   			write_sharp		one
			cp		note_num		num_41
			call	write_track		write_track_ra
			ret		clickwhere_ra

fs			cp		note_num		num_42
			call	write_track		write_track_ra
			ret		clickwhere_ra		

setspace3	cp		space3select	one
			cp		track_num		one
			cp		note_L			note_to_write
			be 		as   			write_sharp		one
			cp		note_num		num_45
			call	write_track		write_track_ra
			ret		clickwhere_ra
as			cp		note_num		num_46
			call	write_track		write_track_ra
			ret		clickwhere_ra	

setspace2	cp		space2select	one
			cp		track_num		one
			cp		note_L			note_to_write
			be 		cs   			write_sharp		one
			cp		note_num		num_48
			call	write_track		write_track_ra
			ret		clickwhere_ra
cs			cp		note_num		num_49
			call	write_track		write_track_ra
			ret		clickwhere_ra	

setspace1	cp		space1select	one
			cp		track_num		one
			cp		note_L			note_to_write
			cp		note_num		num_52
			call	write_track		write_track_ra
			ret		clickwhere_ra

randomclick	ret		clickwhere_ra





staffx1		.data	9
staffx2		.data	629

bar1select		.data 	0
bar1y1			.data	245
bar1y2			.data	250

space1select	.data 0
space1y1		.data 250
space1y2		.data 285

bar2select		.data 0
bar2y1	.data	285
bar2y2	.data	290

space2select	.data 0
space2y1	.data	290
space2y2	.data	325

bar3select		.data 0
bar3y1	.data	325
bar3y2	.data	330

space3select	.data 0
space3y1	.data	330
space3y2	.data	365

bar4select		.data 0
bar4y1	.data	365
bar4x2	.data	370

space4select	.data	0
space4y1	.data	370
space4y2	.data	405

bar5select		.data 0
bar5y1	.data	405
bar5y2	.data	410

note_to_write	.data 0