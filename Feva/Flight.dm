atom
	var/obj/Shadow
proc
	Shadow_Chase(atom/movable/a)//Made to clean up the code a bit
		if(a.Shadow)
			a.Shadow.loc=a.loc
		/*	a.Shadow.step_x=a.step_x
			a.Shadow.step_y=a.step_y*/
			a.Shadow.dir=a.dir
			a.Shadow.icon_state=a.icon_state
		a.Shadow.invisibility=a.invisibility
	Create_Shadow(atom/movable/a,Pixel=0)
		if(a.Shadow)
			Shadow_Chase(a)
		else
			var/obj/Shadow/s=new
			a.Shadow=s
			s.pixel_z=-8
			s.icon=a.icon
			var/matrix/M=matrix()
			M.Scale(1,0.5)
			animate(s,transform=M)
			s.icon-=rgb(1000,1000,1000,200)
			//s.icon:Scale(s.icon:Width(),s.icon:Height()/2)
			a.Shadow.loc=a.loc

			a.Shadow.pixel_x=a.pixel_x
			a.Shadow.pixel_y=a.pixel_y

			a.Shadow.step_x=a.step_x
			a.Shadow.step_y=a.step_y
			a.Shadow.dir=a.dir
			a.Shadow.icon_state=a.icon_state
			s.invisibility=a.invisibility
obj/Shadow
	Grabbable=0

	/*verb
		Fly()
			if(usr.Flying)
				usr.Flying=0
			else
				icon_state="Flight"
				usr.Flying=1
				Create_Shadow(usr)
				Flight(usr)*/
proc
	RemoveShadow(mob/m)
		if(m.Shadow)
			del m.Shadow
	Flight(mob/m) //Handles Shadow Transformations and player flight 'bobbing'
		sleep(1)
		if(m.Flying)
			if(m.Fulton)
				m.overlays+=image('KunaiMod/Icons/fultonrecov.dmi',pixel_y=22)
			animate(m,pixel_z=30,time=5)
			var/matrix/State1=matrix()
			State1.Scale(0.85,0.425)
			animate(m.Shadow,alpha=190,transform=State1,time=5)
			spawn(5)
				var/matrix/State2=matrix()
				State2.Scale(0.95,0.475)
				animate(m,pixel_z=25,time=5)
				animate(m.Shadow,alpha=216,transform=State2,time=5)
				spawn(5)
					Flight(m)
		else
			animate(m,pixel_z=0,time=5)
			var/matrix/LandingState=matrix()
			LandingState.Scale(1,0.5)
			animate(m.Shadow,alpha=255,transform=LandingState,time=5)
			spawn(5)
				RemoveShadow(m)
				m.overlays-=image('KunaiMod/Icons/fultonrecov.dmi')
