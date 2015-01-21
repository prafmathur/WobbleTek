//writes all note boxes including sharp
//return address: write_noteboxes_ra



write_noteboxes			cp boxinputX1   num_250
						cp boxinputX2   num_300
						cp boxinputY1   num_100
						cp boxinputY2   num_150
						cp boxcolor		black		
loopnote                be restboxes   boxcount       num_6
                     	call   write_borderBox	write_borderBox_ra
                        add    boxinputX1      boxinputX1     num_60
                        add    boxinputX1p     boxinputX1p	num_60
                        add    boxinputX2      boxinputX2 	num_60
                        add    boxinputX2p		boxinputX2p	num_60
                        add    boxcount  		boxcount one
                        be	   loopnote 0 0
restboxes			    cp    boxcount  num_0
                        cp boxinputX1   num_550
						cp boxinputX2   num_600
						cp boxinputY1   num_40
						cp boxinputY2   num_90
						cp boxcolor		black		
looprest                be     endboxes            boxcount       num_1
                     	call   write_borderBox	write_borderBox_ra
                        add    boxinputX1      boxinputX1     num_60
                        add    boxinputX1p     boxinputX1p	num_60
                        add    boxinputX2      boxinputX2 	num_60
                        add    boxinputX2p		boxinputX2p	num_60
                        add    boxcount  		boxcount one
                        be	   looprest 0 0


endboxes        cp     boxcount     zero        
                ret    write_noteboxes_ra



boxcount .data 0

