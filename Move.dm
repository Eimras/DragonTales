mob/var/Frozen
mob/var/tmp/Moving
mob/var/tmp/Knockbacked
mob/var/Decimals=0

proc
	TeleporterBump(var/A,var/Q)
		if(istype(A,/obj/Special/Teleporter2)||!(istype(A, /obj/Special/Teleporter2/SpecialTele)))
			var/obj/Special/Teleporter2/_tp=A
			if(istype(Q,/obj/Items/Tech/SpaceTravel))
				Q:loc=locate(_tp.gotoX,_tp.gotoY,_tp.gotoZ)
		if(istype(A,/obj/Special/Teleporter2/SpecialTele))
			var/obj/Special/Teleporter2/tele=A
			var/newz
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoAbove)
				newz=tele.z+1
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoBelow)
				newz=tele.z-1
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoDeep)
				newz=tele.z-2
			if(tele.type==/obj/Special/Teleporter2/SpecialTele/GoHigh)
				newz=tele.z+2
			if(istype(Q,/obj/Items/Tech/SpaceTravel))
				Q:loc=locate(tele.x,tele.y,newz)


	PlanetEnterBump(var/A,var/Q)
		if(istype(A,/obj/Planets))
//			if(istype(A,/obj/Planets/TropicThunder))
//				Q:loc=locate(rand(1,350),rand(1,350),1)
//			if(istype(A,/obj/Planets/CaliforniaUnderwater))
//				Q:loc=locate(rand(1,350),rand(1,350),4)
//			if(istype(A,/obj/Planets/DinosaurGames))
//				Q:loc=locate(rand(1,350),rand(1,350),7)
//			if(istype(A,/obj/Planets/AlienRuin))
//				Q:loc=locate(rand(1,240),rand(1,240),14)
//			else if(istype(A,/obj/Planets/AlienGrassland))
//				Q:loc=locate(rand(1,240),rand(251,500),14)
//			else if(istype(A,/obj/Planets/AlienOcean))
//				Q:loc=locate(rand(251,500),rand(1,240),14)
//			else if(istype(A,/obj/Planets/AlienDesolate))
//				Q:loc=locate(rand(251,500),rand(251,500),14)
			if(istype(A,/obj/Planets/Sanctuary))
				Q:loc=locate(rand(1,500),rand(1,500),18)
//			else if(istype(A,/obj/Planets/PirateColony))
//				if(Q:dir==NORTH)
//					Q:loc=locate(rand(1,500),499,6)
//				else if(Q:dir==EAST)
//					Q:loc=locate(2, rand(1,500), 6)
//				else if(Q:dir==WEST)
//					Q:loc=locate(498, rand(1,500), 6)
//				else if(Q:dir==SOUTH)
//					Q:loc=locate(rand(1,500), 1, 6)
//				else
//					Q:loc=locate(rand(1,500),499,6)
			else
				var/obj/Planets/LOL=A
				var/Wtf=LOL.Zz
				if(Wtf==3)
					Q:loc=locate(rand(140,160),rand(480,490),Wtf)
				else if(Wtf==4)
					Q:loc=locate(rand(152,172),65,Wtf)
				else if(Wtf==5)
					Q:loc=locate(rand(140,160),122,Wtf)
				else
					Q:loc=locate(rand(1,240),rand(1,240),Wtf)

		if(istype(A,/obj/Items/ShipAccessories/PodLauncher))
			var/obj/Items/ShipAccessories/PodLauncher/B=A
			for(var/obj/Items/Tech/SpaceTravel/Ship/X in world)
//				var/launchingdistance=5
				if(B.Password==X.Password)
					if(istype(Q,/mob/Players))
						Q<<"This is meant for pods to use."
						return
					Q:loc=X:loc
//					while(launchingdistance)
//						walk(Q,X.dir)
//						launchingdistance--


		if(istype(A,/obj/Turfs/Door))
			var/obj/Turfs/Door/B=A
//			var/obj/Items/Tech/SpaceTravel/Z


			if(B.Password)
				var/happened
				for(var/obj/Items/Tech/SpaceTravel/L)
					if(L==Q)
						happened=1
						if(L.DoorPass==B.Password)
							B.Open()
	//						eee=1
						else if(L.DoorPass2==B.Password)
							B.Open()
	//						eee=1
						else if(L.DoorPass3==B.Password)
							B.Open()
						else
							var/Guess=input(L.who,"Manually transmit password to door.") as text
							if(Guess==B.Password)
								B.Open()
				if(!happened)
					var/eee
					for(var/obj/Items/Tech/DoorPass/L in Q)
						if(L.Password==B.Password)
							B.Open()
							if(istype(B,/obj/Turfs/Door/LazerDoor))
								if(B.DoorID)
									for(var/obj/Turfs/Door/LazerDoor/X in world)
										if(X.DoorID==B.DoorID)
											X.Open()
							eee=1
					for(var/obj/Items/Tech/DigitalKey/C in Q)
						if(C.Password==B.Password||C.Password2==B.Password||C.Password3==B.Password)
							B.Open()
							if(istype(B,/obj/Turfs/Door/LazerDoor))
								if(B.DoorID)
									for(var/obj/Turfs/Door/LazerDoor/X in world)
										if(X.DoorID==B.DoorID)
											X.Open()
							eee=1
					if(!eee&&!Q:Knockbacked)
						var/Guess=input(Q,"You must know the password to enter here") as text
						if(Guess==B.Password)
							B.Open()
							if(istype(B,/obj/Turfs/Door/LazerDoor))
								if(B.DoorID)
									for(var/obj/Turfs/Door/LazerDoor/X in world)
										if(X.DoorID==B.DoorID)
											X.Open()
						else
							if(istype(B,/obj/Turfs/Door/LazerDoor))
								Q << "The lazer door burns your hand!"
								Q:Burning+=0.20
								spawn()Q:Burning_Check()
			else
				B.Open()

mob/proc/MovementSpeed()
	var/Delay=2/SpeedMod
	if(src.Blocking)
		Delay=3/SpeedMod
	if(!src.Blocking)
		if(src.ESpeed||src.WillSpeed||src.LightningAura||src.ForceSpeed||src.LightningArmor||src.BreathHero||src.Sidecut||src.NanayaDash||src.Sidewhack||(src.InUBW&&src.MadeOfSwords)||(src.Race=="Half Demon"&&src.trans["active"]>=1)||src.Quicksilver)
			Delay=0.1
	if(Race!="Android"&&src.GateNumber<2&&!src.SatsuiNoHado&&!src.MachinaMod&&!src.WillSpeed&&!src.Resolve&&!src.Berserkering&&!(src.InUBW&&src.MadeOfSwords))
		if(!LastBreath)
			Delay*=((100/(sqrt(max(1,Health))*sqrt(max(1,Health))))/4)
	//	Delay*=EnergyMax/max((sqrt(max(1,Energy))*sqrt(max(1,Energy))),EnergyMax/100)/2
		if(Delay>49||src.BladeSlow)
			Delay=50
	if(src.ForceSpeed||src.BER)
		Jitters(src)
		src.pixel_x = 0
		src.pixel_y = 0
	if(Race=="Galvan")
		if(!src.KO&&src.Oxygen<src.MaxOxygen)
			src.Oxygen=min(src.Oxygen+(rand(3,9)),src.MaxOxygen)
	if(Shocked)
		Delay*=(Shocked+1)
	if(Flying)
		density=0
		Delay*=0.5
	if(Swim)
		Delay*=6
	if(Chilled)
		Delay*=1.5
	if(QuickChilled)
		Delay*=50
	if(src.Walking)
		Delay*=16
	if(src.Cuffed)
		Delay*=21
	if(src.TsukiScars)
		Delay*=21
	if(src.Sneaking)
		Delay*=35
	if(src.FatalStrike)
		Delay*=35
	if(src.Slow)
		Delay*=src.Slow/10
	if(src.Berserkering)
		if(src.BerserkerRise==1)
			Delay*=0.85
		else if(src.BerserkerRise==2)
			Delay*=0.75
		else if(src.BerserkerRise==3)
			Delay*=0.5
		else if(src.BerserkerRise==4)
			Delay*=0.25
		if(src.VisoredStage)
			Delay*=0.75
	if(src.dir==SOUTHWEST||src.dir==SOUTHEAST||src.dir==NORTHWEST||src.dir==NORTHEAST)
		Delay*=2
/*	if(Control)
		var/obj/Items/Tech/SpaceTravel/X=Control
		Delay=20/X.MaxSpeed*/
	Decimals+=Delay-round(Delay)
	if(round(Decimals)>1)
		Delay+=round(Decimals)
		Decimals-=round(Decimals)
	if(Knockbacked) Delay=1
	return Delay
mob/Move()
	if(!client&&!Knockbacked&&!Move_Requirements()) return
	var/Former_Location=loc
//	Moving=1
/*	var/Delay=2/SpeedMod
	if(src.Blocking)
		Delay=3/SpeedMod
	if(!src.Blocking)
		if(src.ESpeed||src.WillSpeed||src.LightningAura||src.ForceSpeed||src.LightningArmor||src.BreathHero||(src.InUBW&&src.MadeOfSwords)||(src.Race=="Half Demon"&&src.trans["active"]>=1)||src.Quicksilver)
			Delay=0.1
	if(Race!="Android"&&src.GateNumber<2&&!src.SatsuiNoHado&&!src.MachinaMod&&!src.WillSpeed&&!src.Resolve&&!src.Berserkering&&!(src.InUBW&&src.MadeOfSwords))
		if(!LastBreath)
			Delay*=((100/(sqrt(max(1,Health))*sqrt(max(1,Health))))/4)
	//	Delay*=EnergyMax/max((sqrt(max(1,Energy))*sqrt(max(1,Energy))),EnergyMax/100)/2
		if(Delay>49||src.BladeSlow)
			Delay=50
	if(src.ForceSpeed||src.BER)
		Jitters(src)
		src.pixel_x = 0
		src.pixel_y = 0
	if(Race=="Galvan")
		if(!src.KO&&src.Oxygen<src.MaxOxygen)
			src.Oxygen=min(src.Oxygen+(rand(3,9)),src.MaxOxygen)
	if(Shocked)
		Delay*=(Shocked+1)
	if(Flying)
		density=0
		Delay*=0.5
	if(Swim)
		Delay*=3
	if(Chilled)
		Delay*=1.5
	if(src.Slow)
		Delay*=src.Slow/10
	if(src.Berserkering)
		if(src.BerserkerRise==1)
			Delay*=0.85
		else if(src.BerserkerRise==2)
			Delay*=0.75
		else if(src.BerserkerRise==3)
			Delay*=0.5
		else if(src.BerserkerRise==4)
			Delay*=0.25
		if(src.VisoredStage)
			Delay*=0.75
	if(src.dir==SOUTHWEST||src.dir==SOUTHEAST||src.dir==NORTHWEST||src.dir==NORTHEAST)
		Delay*=2
/*	if(Control)
		var/obj/Items/Tech/SpaceTravel/X=Control
		Delay=20/X.MaxSpeed*/
	Decimals+=Delay-round(Delay)
	if(round(Decimals)>1)
		Delay+=round(Decimals)
		Decimals-=round(Decimals)*/
//	if(Knockbacked) Delay=0
//	spawn(MovementSpeed()) Moving=0
	..()
	Blok(src)
	density=1
	Edge_Check(Former_Location)
	if(!Knockbacked&&Target&&istype(Target,/obj/Others/Build)) Build_Lay(Target,src)
	if(Grab) Grab_Update()
	if(AFKTimer==0)
		overlays-=AFKIcon
//		spawn()src.GainLoop()
		spawn()src.callspawns()
	AFKTimer=AFKTimeLimit

mob/proc/Edge_Check(turf/Former_Location)
	for(var/obj/Special/PlanetLooperNS/A in loc)
		if(A.z==1) //Z plane check for Midgar
			if(y==500)
//				z=3
				y=2
			if(y==1)
//				z=2
				y=499

		if(A.z==2) //Z plane check for Midgar Outskirts/Kalm Region
			if(y==500)
//				z=1
				y=2
			if(y==1)
//				z=3
				y=499

		if(A.z==3) //Z plane check for Round Island Region
			if(y==500)
//				z=2
				y=2
			if(y==1)
//				z=1
				y=499

		if(A.z==4) //Z plane check for Kelvin Crater Region
			if(y==500)
//				z=6
				y=2
			if(y==1)
//				z=5
				y=499

		if(A.z==5) //Z plane check for Wee Town/Gold Saucer Region
			if(y==500)
//				z=4
				y=2
			if(y==1)
//				z=6
				y=499

		if(A.z==6) //Z plane check for Costa Del Sol/Temple of Arimanes Region
			if(y==500)
//				z=5
				y=2
			if(y==1)
//				z=4
				y=499

		if(A.z==7) //Z plane check for C.Canyon Region
			if(y==500)
//				z=8
				y=2
			if(y==1)
//				z=9
				y=499

		if(A.z==8) //Z plane check for Reactor/Nibelheim Region
			if(y==500)
//				z=9
				y=2
			if(y==1)
//				z=7
				y=499

		if(A.z==9) //Z plane check for Wutai Region
			if(y==500)
//				z=7
				y=2
			if(y==1)
//				z=8
				y=499

	for(var/obj/Special/PlanetLooperEW/A in loc) //East/West warper object.
		if(A.z==1) //Z plane check for Midgar
			if(x==500)
//				z=8
				x=2
			if(x==1)
//				z=5
				x=499

		if(A.z==2) //Z plane check for Midgar Outskirts/Kalm Region
			if(x==500)
//				z=7
				x=2
			if(x==1)
//				z=6
				x=499

		if(A.z==3) //Z plane check for Round Island Region
			if(x==500)
//				z=9
				x=2
			if(x==1)
//				z=4
				x=499

		if(A.z==4) //Z plane check for Kelvin Crater Region
			if(x==500)
//				z=3
				x=2
			if(x==1)
//				z=9
				x=499

		if(A.z==5) //Z plane check for Wee Town/Gold Saucer Region
			if(x==500)
//				z=1
				x=2
			if(x==1)
//				z=8
				x=499

		if(A.z==6) //Z plane check for Costa Del Sol/Temple of Arimanes Region
			if(x==500)
//				z=2
				x=2
			if(x==1)
//				z=7
				x=499

		if(A.z==7) //Z plane check for C.Canyon Region
			if(x==500)
//				z=6
				x=2
			if(x==1)
//				z=2
				x=499

		if(A.z==8) //Z plane check for Reactor/Nibelheim Region
			if(x==500)
//				z=5
				x=2
			if(x==1)
//				z=1
				x=499

		if(A.z==9) //Z plane check for Wutai Region
			if(x==500)
//				z=4
				x=2
			if(x==1)
//				z=3
				x=499

	for(var/mob/A in loc) if(A!=src&&A.Flying&&Flying)
		loc=Former_Location
		break
	for(var/obj/Turfs/Door/A in loc) if(A.density)
		loc=Former_Location
		Bump(A)
		break
	for(var/obj/Items/Tech/ReinforcedDoor/A in loc) if(A.density)
		loc=Former_Location
		break
	for(var/obj/Effects/Barrier/A in loc) if(A.density)
		loc=Former_Location
		break
	for(var/obj/Effects/ForceField/A in loc) if(A.density)
		loc=Former_Location
		break
	for(var/obj/Effects/PocketPortal/A in loc) if(A.density)
		loc=Former_Location
		Bump(A)
		break
	for(var/obj/Effects/PocketExit/A in loc) if(A.density)
		loc=Former_Location
		Bump(A)
		break
	for(var/obj/Special/Teleporter2/A in loc) if(A.density&&Flying)
		Bump(A)
		break
//	for(var/obj/Special/PlanetLooper/A in loc) if(A.density&&Flying)
//		Bump(A)
//		break
	for(var/obj/Turfs/RoofGlass/A in loc) if(A.density&&Flying)
		loc=Former_Location
		Bump(A)
		break
	if(!Flying)
		var/turf/T=get_step(Former_Location,dir)
		if(T&&!T.Enter(src)) return
		for(var/obj/Turfs/Edges/A in loc)
			if(!(A.dir in list(dir,turn(dir,90),turn(dir,-90),turn(dir,45),turn(dir,-45))))
				loc=Former_Location
				break
		for(var/obj/Turfs/Edges/A in Former_Location) if(A.dir in list(dir,turn(dir,45),turn(dir,-45)))
			loc=Former_Location
			break
		for(var/obj/Special/Teleporter2/A in loc)
			if(A.density)
				Bump(A)
				TeleporterBump(A)
				break

/*

client/proc/setMacros()
	for(var/A in 1 to length(key_set))
		if(key_set[A] == "NORTH"||key_set[A] == "SOUTH"||key_set[A] == "WEST"||key_set[A] == "EAST")
			winset(src,"macro[A]","parent=macro;name=[copytext(key_set[A],0,1)][lowertext(copytext(key_set[A],1))];command=\"keypress [key_set[A]]\"")
			winset(src,"macro[length(key_set)+A]","parent=macro;name=[copytext(key_set[A],0,1)][lowertext(copytext(key_set[A],1))]+UP;command=\"keyrelease [key_set[A]]\"")
		else
			winset(src,"macro[A]","parent=macro;name=[uppertext(key_set[A])];command=\"keypress [key_set[A]]\"")
			winset(src,"macro[length(key_set)+A]","parent=macro;name=[uppertext(key_set[A])]+UP;command=\"keyrelease [key_set[A]]\"")

client/var/tmp/list/key_set = list(
"NORTH" = "NORTH",
"SOUTH" = "SOUTH",
"EAST" = "EAST",
"WEST" = "WEST",



)
client/var/tmp/list/Keys = list(
"NORTH" = FALSE,
"SOUTH" = FALSE,
"EAST" = FALSE,
"WEST" = FALSE,


)


mob/verb/keypress(k as text)
	set hidden = 1
	keyDown(client.key_set[k])

mob/verb/keyrelease(k as text)
	set hidden = 1
	keyUp(client.key_set[k])

mob/verb/keyDown(k as text)
	set hidden = 1
	client.Keys[k] = TRUE
mob/verb/keyUp(k as text)
	set hidden = 1
	client.Keys[k] = FALSE

var/global/list/active = list()
atom/movable/proc/keyupdate()

mob/New()
	..()
	spawn()for()
		sleep(MovementSpeed())
		for(var/atom/movable/A in active)
			if(Move_Requirements())
				A.keyupdate()

mob/keyupdate()
	var/d =0
	if(client.Keys["NORTH"]) d|=NORTH
	if(client.Keys["SOUTH"]) d|=SOUTH
	if(client.Keys["EAST"]) d|=EAST
	if(client.Keys["WEST"]) d|=WEST
	if(d&&d in list(NORTH,SOUTH,EAST,WEST,NORTHWEST,NORTHEAST,SOUTHWEST,SOUTHEAST))
		if(!Allow_Move(d))
		//	src<<"test"
			return
		dir=d
		step(src,d)


mob/Login()
	..()
	active |= src
	client.setMacros()
mob/Logout()
	..()
	active -= src
client
	North()
	South()
	East()
	West()
	Southwest()
	Northwest()
	Southeast()
	Northeast()*/