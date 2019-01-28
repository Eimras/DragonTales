obj/Skills/Feva
	AfterImage
		verb
			AA()
				set name = "After Image"
				set category="Skills"
				var/Duration=100
				while(Duration)
					sleep(1)
					Duration--
					Jitters(usr)
		/*			usr.Boss=0
				usr.Boss=1*/

proc
	Jitters(mob/A)
		var
			BaseX=A.pixel_x
			BaseY=A.pixel_y
		animate(A,pixel_x=BaseX+rand(-16,16),pixel_y=BaseY+rand(-16,16),time=1)
		spawn(1)
			if(prob(50))
				AfterImage(A)
			animate(A,pixel_x=BaseX,pixel_y=BaseY,time=1)