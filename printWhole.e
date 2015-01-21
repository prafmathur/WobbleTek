//print WholeNote

//takes in x1, y1 of whole note

printWhole				cp boxinputX1   noteX1
						add boxinputX2  boxinputX1  num_30
						cp boxinputY1   noteY1
						add boxinputY2   boxinputY1 num_30
						cp boxcolor		black

						call write_borderBox write_borderBox_ra
						be wholesharp	toggleSharp		one

						ret printWhole_ra	

wholesharp				call note_sharp	note_sharp_ra
						ret printWhole_ra
