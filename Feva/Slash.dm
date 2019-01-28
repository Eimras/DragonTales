proc
	Slash(atom/movable/M)
		var/obj/Effects/Slash/P = new
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
		P.pixel_x+=rand(-8,8)
		P.pixel_y+=rand(-8,8)
	PunchEffect(atom/movable/M, var/PixelX, var/PixelY)
		var/obj/Effects/Punch_Effect/P = new
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
		P.pixel_x+=PixelX
		P.pixel_y+=PixelY
	StaffEffect(atom/movable/M)
		var/obj/Effects/Staff_Effect/P = new
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
		P.pixel_x+=rand(-8,8)
		P.pixel_y+=rand(-8,8)
	HitEffect(atom/movable/M)
		var/obj/Effects/Hit_Effect/P = new
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
		P.pixel_x+=rand(-8,8)
		P.pixel_y+=rand(-8,8)
	SweepingKick(atom/movable/M)
		var/obj/Effects/SweepingKick/P = new
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
	//	P.pixel_x+=rand(-8,8)
	//	P.pixel_y+=rand(-8,8)
	SweepingBlade(atom/movable/M, var/size=1)
		var/obj/Effects/SweepingBlade/P = new
		P.transform*=size
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
		//P.pixel_x+=rand(-8,8)
		//P.pixel_y+=rand(-8,8)
	SweepingBroom(atom/movable/M, var/size=1)
		var/obj/Effects/SweepingBroom/P = new
		P.transform*=size
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
		//P.pixel_x+=rand(-8,8)
		//P.pixel_y+=rand(-8,8)
	WolfFangFist(atom/movable/M,Direc)
		var/obj/Effects/WolfFangFist/P = new
		P.dir=Direc
		P.Target=M
		P.Target_Watch()
		/*P.loc=M.loc
		P.step_x=M.step_x
		P.step_y=M.step_y*/
		P.pixel_z=M.pixel_z
		//P.pixel_x+=rand(-8,8)
		//P.pixel_y+=rand(-8,8)
obj/Effects
	WolfFangFist
		icon='WolfFang3.dmi'
		pixel_x=-66
		pixel_y=-66
		var/Target
		New()
			sleep(0)
			flick("Attack",src)
			spawn(5)

				animate(src,alpha=0,time=5)
			spawn(10)
				del src
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						loc=Target:loc
						goto Start
	SweepingKick
		icon='SweepingKick.dmi'
		pixel_x=-32
		pixel_y=-32
		var/Target
		New()
			sleep(0)
			var/matrix/State1=matrix()
			State1.Scale(1.5,1.5)
			animate(src, transform = turn(State1, pick(45,-45,0,-90,90,135.-135,180)),time=0)
			spawn(5)

				animate(src,alpha=0,time=9)
			spawn(10)
				del src
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						loc=Target:loc
						goto Start
	SweepingBlade
		icon='CircleWind.dmi'
		pixel_x=-32
		pixel_y=-32
		var/Target
		New()
			sleep(0)
			spawn(5)

				animate(src,alpha=0,time=5)
			spawn(10)
				del src
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						loc=Target:loc
						goto Start


	SweepingBroom
		icon='KunaiMod/Icons/sweepbroom.dmi'
		pixel_x=-32
		pixel_y=-32
		var/Target
		New()
			sleep(0)
			spawn(5)

				animate(src,alpha=0,time=5)
			spawn(10)
				del src
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						loc=Target:loc
						goto Start


	Slash
		icon='Slash.dmi'
		pixel_x=-32
		pixel_y=-32
		var/Target
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						//invisibility=Target:invisibility
						loc=Target:loc
						goto Start
		New()
			sleep(0)
			animate(src, transform = turn(matrix(), pick(45,-45,0,-90,90,135.-135,180)),time=0)
			spawn(1)

				animate(src,alpha=0,time=5)
			spawn(6)
				del src
	Hit_Effect
		icon='Hit Effect.dmi'
		pixel_x=-32
		pixel_y=-32
		var/Target
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						//invisibility=Target:invisibility
						loc=Target:loc
						goto Start
		New()
			walk_to(src,Target)
			spawn(1)
				animate(src,alpha=0,time=6)
			spawn(6)
				del src
	Punch_Effect
		icon='PunchingHands.dmi'
		var/Target
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						//invisibility=Target:invisibility
						loc=Target:loc
						goto Start
		New()
			walk_to(src,Target)
			sleep(0)
			animate(src, transform = turn(matrix(), pick(45,-45,0,-90,90,135.-135,180)),time=0)
			spawn(3)
				del src
	Staff_Effect
		icon='KunaiMod/Icons/BONKY.dmi'
		pixel_x=-32
		pixel_y=-32
		var/Target
		proc
			Target_Watch()
				Start
				spawn(1)
					if(Target)
						//invisibility=Target:invisibility
						loc=Target:loc
						goto Start
		New()
			walk_to(src,Target)
			sleep(0)
			animate(src, transform = turn(matrix(), pick(45,-45,0,-90,90,135.-135,180)),time=0)
			spawn(3)
				del src