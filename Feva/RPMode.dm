obj
	Effects
		RPMode
			icon='RPMode.dmi'
proc
	RPMode(mob/m,State)
		var/obj/Effects/RPMode/RP=new
		RP.loc=m.loc
		RP.icon_state=State

		animate(RP,transform=matrix()*3,time=10)
		spawn(10)
			animate(RP,transform=matrix()*3,alpha=0,time=10)
		spawn(20)
			del RP