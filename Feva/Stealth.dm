proc
	Invisibility(mob/src)
		animate(src,alpha=50,time=10)
		spawn(10)
			src.invisibility=1
			src.sight |= (SEE_SELF)
			//src.see_invisible=1
			src<<"You are now invisible."
			src.OMessage(10,null,"<font color=red>[src]([src.key]) turns invisible.")
		spawn(25)
			animate(src,alpha=255,time=10)
			spawn(10)
				src.invisibility=0
				//src.see_invisible=0
				src<<"You are now visible."
				src.OMessage(10,null,"<font color=red>[src]([src.key]) turns visible.")
obj/Skills/Feva
	Stealth
		Cooldown=35
		verb/Invis()
			if(!Using&&!usr.invisibility)
				Cooldown()
				Invisibility(usr)