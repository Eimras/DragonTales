mob
	Cross(a)
		if(ismob(a))
			//check their various buffs to see if they can pass through
			//check if they have the ghost armor power, and if they do and it is active let them pass
			var/mob/this = a
			for(var/obj/Skills/Buffs/Ghost_Armor/G in this)
				if(G.BuffUsing) return 1
			if(this.ActiveZanzo>0)//If someone is "Zanzing" or has a different fly state, yo
				return 1
			if(this.Flying==1&&Flying==1||this.Flying==0&&Flying==0||this.Flying==0&&Flying==null||this.Flying==null&&Flying==0)
				return 0
			else
				return 1
		else
			if(istype(a,/obj/Projectiles/fevProjectile))
				//world<<"[a:Owner]'s [a] is crashing into [src]"
				if(a:Owner==src)
					return 1 //The projectile will ignore it's Owner
				else
					a:Impact(src)
					return 0

				if(a:Piercing)
					return 1
			if(istype(a,/obj/Projectiles/Mystical))
				spawn a:AttackDamage()
				if(a:Owner==src)
					return 1
				else
					//a:Bump(src)
					spawn a:AttackDamage()
					return 1
	var
		ActiveZanzo=0//Is the user using Zanzoken?
		AfterImageStrike=0
		WildSense=0
	Move()//May need to be edited, etc to fit into your Move() proc if you're calling one

		if(ActiveZanzo)
			var/Original_Direction=src.dir
			//Zanzoken flick() ?
			if(ActiveZanzo==3)//Safety net, so only one afterimage is produced since the step() proc below calls Move()
				AfterImage(usr)
			if(ActiveZanzo==6)
				AfterImage2(usr)
				ActiveZanzo=3.1
			..() //Usual Move() procedure goes through
			while(ActiveZanzo>0)
				ActiveZanzo=round(ActiveZanzo)
				ActiveZanzo--
				step(src,src.dir)
			src.dir=Original_Direction//Player retains direction after using Zanzo [Blast Kiting?]

		else
			..()
		if(usr.Shadow)
			Shadow_Chase(usr)//Makes the Shadow follow

proc
	AfterImage(mob/m)
		var/obj/Afterimage/I = new
		I.icon=m.icon
		I.icon_state=m.icon_state
		I.overlays=m.overlays
		I.loc=m.loc
		I.dir=m.dir
		I.pixel_x=m.pixel_x
		I.pixel_y=m.pixel_y
		I.pixel_z=m.pixel_z
		I.name=m.name
		I.Owner=m
		I.density=0 //KOON: edited density to 0 to see if it will ignore being blown
	DashImage(mob/m)
		var/AMT=2
		while(AMT)
			AMT--
			var/obj/DashImage/I = new
			I.icon=m.icon
			I.icon_state="Flight"
			I.alpha=135
			I.overlays=m.overlays
			I.loc=m.loc
			I.dir=m.dir
			I.pixel_x=m.pixel_x
			I.pixel_y=m.pixel_y
			I.pixel_z=m.pixel_z
			I.name=m.name
			I.Owner=m
			I.density=0
	RecoverImage(mob/m)
		var/obj/RecoveryImage/I = new
		I.icon=m.icon
		I.icon_state=m.icon_state
		I.overlays=m.overlays
		I.loc=m.loc
		I.dir=m.dir
		I.pixel_x=m.pixel_x
		I.pixel_y=m.pixel_y
		I.pixel_z=m.pixel_z
		I.name=m.name
		I.Owner=m
		I.density=0
	AfterImage2(mob/m)
		var/mob/Player/Afterimage/I = new
		I.icon=m.icon
		I.overlays=m.overlays
		I.loc=m.loc
		I.dir=m.dir
		I.pixel_x=m.pixel_x
		I.pixel_y=m.pixel_y
		I.pixel_z=m.pixel_z
		I.name=m.name
		I.Power=m.Power
		I.Owner=m
		I.density=0
		for(var/mob/X in world)
			if(X.Target==m)
				//X<<"Your target has been swapped from [m]([m.type]) to [I]([I.type])"
				X.Target=I
obj/Afterimage
	Grabbable=0
	density=0
	New()
		spawn(2)
			animate(src,alpha=0,time=8)
			spawn(8)
				del src
obj/RecoveryImage
	Grabbable=0
	density=0
	New()
		spawn(2)
			animate(src,alpha=0,transform=matrix()*3,time=8)
			spawn(8)
				del src
obj/DashImage
	Grabbable=0
	density=0
	New()
		spawn(2)
			animate(src,pixel_x=rand(-8,8),pixel_y=rand(-8,8))
			animate(src,alpha=0,time=8)
			spawn(8)
				del src
mob/Player
	Afterimage
		Health=1000000
		density=1
		Grabbable=1

		New()
			spawn(2)
				density=0
				animate(src,alpha=0,time=8)
				spawn(8)
					del src
		Del()
			for(var/mob/m in world)
				if(m.Target==src)
					//m<<"Your target has been swapped from [src]([src.type]) to [Owner]([Owner.type])"
					m.Target=Owner
			..()

proc
	AfterImageStrike(mob/A,mob/Target)
		var/Zanzes=5
		while(Zanzes)
			sleep(1)
			Zanzes--
			AfterImage(A)
			A.Comboz(Target)
			if(Zanzes==0)
				A.dir=get_dir(A,Target)
				A.Melee()
			else
				if(prob(50))
					step_away(A,Target)
					if(prob(50))
						step_away(A,Target)
		A.AfterImageStrike--
		if(A.AfterImageStrike<=0)
			A.AfterImageStrike=0
			for(var/obj/Skills/Rank/AfterImageStrike/AIS in A.contents)
				AIS.Cooldown()
	WildSense(mob/A,mob/Target)
		A.ComboX(Target)
		A.dir=get_dir(A,Target)
		A.AttackHardness=2
		A.HeavyShot=1
		A.WildSense=0
		A.Melee(3,1,0,0)
		for(var/obj/Skills/Rank/WildSense/WS in A.contents)
			WS.Cooldown()