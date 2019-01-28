var/list/worldObjectList = new // Looped through during the saving of objects

proc/find_savableObjects()
	for(var/obj/_object in world) // Find all objects in the world
		if(!_object.z||_object.z==0) continue
		if(_object in global.worldObjectList)
			if(!_object.z||_object.z==0)
				global.worldObjectList-=_object
				del(_object)
			else continue // If it's already in the world object list, skip it.
		if(_object.Savable==1) global.worldObjectList+=_object // If it's NOT, and we want it saved, add it to the world object list.

proc/Save_Custom_Turfs()
	set background = 1
	world<<"<small>Server: Saving Custom Turfs..."
	var/Amount=0
	var/E=1
	var/savefile/F=new("Saves/Map/CustomTurfs[E]")
	var/list/Types=new
	var/list/Healths=new
	var/list/Levels=new
	var/list/Builders=new
	var/list/Xs=new
	var/list/Ys=new
	var/list/Zs=new
	var/list/Icons=new
	var/list/Icons_States=new
	var/list/Densitys=new
	var/list/isRoof=new
	var/list/Opacitys=new
	var/list/FlyOver=new
	var/list/isOutside=new
	var/list/isUnderwater=new
	var/list/LogPEndurance=new
	var/list/Destructable=new

	for(var/turf/CustomTurf/A in CustomTurfs)
		if(A)
			Types+=A.type
			Healths+="[num2text(round(A.Health),100)]"
			Levels+="[num2text(A.Level,100)]"
			Builders+=A.Builder
			Xs+=A.x
			Ys+=A.y
			Zs+=A.z
			Icons+=A.icon
			Icons_States+=A.icon_state
			Densitys+=A.density
			isRoof+=A.Roof
			Opacitys+=A.opacity
			FlyOver+=A.FlyOverAble
			isOutside+=A.isOutside
			isUnderwater+=A.isUnderwater
			LogPEndurance+=A.LogPEndurance
			Destructable+=A.Destructable
			Amount+=1
			if(Amount % 20000 == 0)
				F["Types"]<<Types
				F["Healths"]<<Healths
				F["Levels"]<<Levels
				F["Builders"]<<Builders
				F["Xs"]<<Xs
				F["Ys"]<<Ys
				F["Zs"]<<Zs
				F["Icons"]<<Icons
				F["Icons_States"]<<Icons_States
				F["Densitys"]<<Densitys
				F["isRoof"]<<isRoof
				F["Opacitys"]<<Opacitys
				F["FlyOver"]<<FlyOver
				F["isOutside"]<<isOutside
				F["isUnderwater"]<<isUnderwater
				F["LogPEndurance"]<<LogPEndurance
				F["Destructable"]<<Destructable
				E ++
				F=new("Saves/Map/CustomTurfs[E]")
				Types=new
				Healths=new
				Levels=new
				Builders=new
				Xs=new
				Ys=new
				Zs=new
				Icons=new
				Icons_States=new
				Densitys=new
				isRoof=new
				Opacitys=new
				FlyOver=new
				isOutside=new
				isUnderwater=new
				LogPEndurance=new
				Destructable=new

	if(Amount % 20000 != 0)
		F["Types"]<<Types
		F["Healths"]<<Healths
		F["Levels"]<<Levels
		F["Builders"]<<Builders
		F["Xs"]<<Xs
		F["Ys"]<<Ys
		F["Zs"]<<Zs
		F["Icons"]<<Icons
		F["Icons_States"]<<Icons_States
		F["Densitys"]<<Densitys
		F["isRoof"]<<isRoof
		F["Opacitys"]<<Opacitys
		F["FlyOver"]<<FlyOver
		F["isOutside"]<<isOutside
		F["isUnderwater"]<<isUnderwater
		F["LogPEndurance"]<<LogPEndurance
		F["Destructable"]<<Destructable

	world<<"<small>Server: Custom Turfs Saved([Amount])."

proc/Load_Custom_Turfs()
	set background = 1
	if(fexists("Saves/Map/CustomTurfs1"))
		world<<"<small>Server: Loading Custom Turfs..."
		var/Amount=0
		var/DebugAmount= 0
		var/E=1
		load
		if(!fexists("Saves/Map/CustomTurfs[E]"))
			goto end
		var/savefile/F=new("Saves/Map/CustomTurfs[E]")
		sleep(1)
		var/list/Types=F["Types"]
		var/list/Healths=F["Healths"]
		var/list/Levels=F["Levels"]
		var/list/Builders=F["Builders"]
		var/list/Xs=F["Xs"]
		var/list/Ys=F["Ys"]
		var/list/Zs=F["Zs"]
		var/list/Icons=F["Icons"]
		var/list/Icons_States=F["Icons_States"]
		var/list/Densitys=F["Densitys"]
		var/list/isRoof=F["isRoof"]
		var/list/Opacitys=F["Opacitys"]
		var/list/FlyOver=F["FlyOver"]
		var/list/isOutside=F["isOutside"]
		var/list/isUnderwater=F["isUnderwater"]
		var/list/LogPEndurance=F["LogPEndurance"]
		var/list/Destructable=F["Destructable"]
		Amount = 0
		for(var/A in Types)
			Amount+=1
			DebugAmount += 1
			var/turf/CustomTurf/T=new A(locate(text2num(list2params(Xs.Copy(Amount,Amount+1))),text2num(list2params(Ys.Copy(Amount,Amount+1))),text2num(list2params(Zs.Copy(Amount,Amount+1)))))
			T.icon= Icons[Amount]
			T.icon_state= Icons_States[Amount]
			T.density=text2num(list2params(Densitys.Copy(Amount,Amount+1)))
			T.opacity=text2num(list2params(Opacitys.Copy(Amount,Amount+1)))
			T.Roof=text2num(list2params(isRoof.Copy(Amount,Amount+1)))
			T.Health=text2num(list2params(Healths.Copy(Amount,Amount+1)))
			T.Level=text2num(list2params(Levels.Copy(Amount,Amount+1)))
			T.Builder=list2params(Builders.Copy(Amount,Amount+1))
			T.FlyOverAble=text2num(list2params(FlyOver.Copy(Amount,Amount+1)))
			T.isOutside=text2num(list2params(isOutside.Copy(Amount,Amount+1)))
			T.isUnderwater=text2num(list2params(isUnderwater.Copy(Amount,Amount+1)))
			T.LogPEndurance=text2num(list2params(LogPEndurance.Copy(Amount,Amount+1)))
			T.Destructable=text2num(list2params(Destructable.Copy(Amount,Amount+1)))
			CustomTurfs+=T // Turfs is the global list for all objects placed by players.
			if(T.Builder)
				if(T.isOutside)
					switch(T.z)
						if(2)
							new/area/Outside/Planet/Earth(T)
						if(999)
							new/area/Outside/Planet/Namek(T)
//						if(3)
//							new/area/Outside/Planet/Vegeta(T)
						if(4)
							new/area/Outside/Planet/Ice(T)
						if(3)
							new/area/Outside/Planet/Arconia(T)
						if(10)
							new/area/Outside/Planet/Heaven(T)
						if(9)
							new/area/Outside/Planet/Hell(T)
						if(8)
							new/area/Outside/Planet/Afterlife(T)
						if(12)
							if(T.isUnderwater)
								new/area/Outside/Planet/AlienOcean/AOUnderwater(T)
							else
								new/area/Outside/Planet/AlienOcean/AOUnderground(T)
						if(4)
							if(T.isUnderwater)
								new/area/Outside/Planet/Earth/Underwater(T)
							else
								new/area/Outside/Planet/Earth/EarthUnderground(T)
						if(15)
							if(T.isUnderwater)
								new/area/Outside/Planet/Earth/Underwater(T)
							else
								new/area/Outside/Planet/Earth/EarthUnderground(T)
						if(18)
							new/area/Outside/Planet/Sanctuary(T)
						if(20)
							if(T.isUnderwater)
								new/area/Outside/Planet/Sanctuary/SanctuaryUnderwater(T)
							else
								new/area/Outside/Planet/Sanctuary/SanctuaryUnderground(T)
//						if(5)
//							if(T.isUnderwater)
//								new/area/Outside/Planet/Vegeta/VegetaUnderwater(T)
//							else
//								new/area/Outside/Planet/Vegeta/VegetaUnderground(T)
						if(23)
							if(T.isUnderwater)
								new/area/Outside/Planet/Namek/NamekUnderwater(T)
							else
								new/area/Outside/Planet/Namek/NamekUnderground(T)
						if(24)
							if(T.isUnderwater)
								new/area/Outside/Planet/Ice/IceUnderwater(T)
							else
								new/area/Outside/Planet/Ice/IceUnderground(T)
						if(5)
							if(T.isUnderwater)
								new/area/Outside/Planet/Arconia/ArconiaUnderwater(T)
							else
								new/area/Outside/Planet/Arconia/ArconiaUnderground(T)
						else
							new/area/Outside(T)
				else
					new/area/Inside(T)

			for(var/obj/Turfs/Edges/B in T) if(!B.Builder) del(B)
			for(var/obj/Turfs/Surf/B in T) if(!B.Builder) del(B)
			for(var/obj/Turfs/Trees/B in T) if(!B.Builder) del(B)
			for(var/obj/Turfs/B in T) if(!B.Builder) del(B)

			if(Amount == 20000)
				sleep(1)
				break

		if(Amount == 20000)
			E ++
			goto load

		end
		world<<"<small>Server: Custom Turfs Loaded ([DebugAmount] in [E] Files.)"

proc/Save_Turfs()
	set background = 1
	world<<"<small>Server: Saving Map..."
	var/Amount=0
	var/E=1
	var/savefile/F=new("Saves/Map/File[E]")
	var/list/Types=new
	var/list/Healths=new
	var/list/Levels=new
	var/list/Builders=new
	var/list/Xs=new
	var/list/Ys=new
	var/list/Zs=new
	var/list/FlyOver=new
	var/list/isOutside=new
	var/list/isUnderwater=new
	var/list/LogPEndurance=new
	var/list/Destructable=new

//	debuglog << "[__FILE__]:[__LINE__] We got this far for mapfile[E]"

	for(var/turf/A in Turfs)
		if(A)
			Types+=A.type
			Healths+="[num2text(round(A.Health),100)]"
			Levels+="[num2text(A.Level,100)]"
			Builders+=A.Builder
			Xs+=A.x
			Ys+=A.y
			Zs+=A.z
			FlyOver+=A.FlyOverAble
			isOutside+=A.isOutside
			isUnderwater+=A.isUnderwater
			LogPEndurance+=A.LogPEndurance
			Destructable+=A.Destructable
			Amount+=1
			if(Amount % 20000 == 0)
				F["Types"]<<Types
				F["Healths"]<<Healths
				F["Levels"]<<Levels
				F["Builders"]<<Builders
				F["Xs"]<<Xs
				F["Ys"]<<Ys
				F["Zs"]<<Zs
				F["FlyOver"]<<FlyOver
				F["isOutside"]<<isOutside
				F["isUnderwater"]<<isUnderwater
				F["LogPEndurance"]<<LogPEndurance
				F["Destructable"]<<Destructable
				E ++
				F=new("Saves/Map/File[E]")
				Types=new
				Healths=new
				Levels=new
				Builders=new
				Xs=new
				Ys=new
				Zs=new
				FlyOver=new
				isOutside=new
				isUnderwater=new
				LogPEndurance=new
				Destructable=new

//	debuglog << "[__FILE__]:[__LINE__] We got this far for mapfile[E]"

	if(Amount % 20000 != 0)
		F["Types"]<<Types
		F["Healths"]<<Healths
		F["Levels"]<<Levels
		F["Builders"]<<Builders
		F["Xs"]<<Xs
		F["Ys"]<<Ys
		F["Zs"]<<Zs
		F["FlyOver"]<<FlyOver
		F["isOutside"]<<isOutside
		F["isUnderwater"]<<isUnderwater
		F["LogPEndurance"]<<LogPEndurance
		F["Destructable"]<<Destructable

//	debuglog << "[__FILE__]:[__LINE__] Map saved mapfile[E] :: Total amount of crap: [Amount]"

	world<<"<small>Server: Map Saved([Amount])."

proc/Load_Turfs()
	set background = 1
	if(fexists("Saves/Map/File1"))
		world<<"<small>Server: Loading Map..."
		var/Amount=0
		var/DebugAmount= 0
		var/E=1
		load
		if(!fexists("Saves/Map/File[E]"))
			goto end
		var/savefile/F=new("Saves/Map/File[E]")
		sleep(1)
		var/list/Types=F["Types"]
		var/list/Healths=F["Healths"]
		var/list/Levels=F["Levels"]
		var/list/Builders=F["Builders"]
		var/list/Xs=F["Xs"]
		var/list/Ys=F["Ys"]
		var/list/Zs=F["Zs"]
		var/list/FlyOver=F["FlyOver"]
		var/list/isOutside=F["isOutside"]
		var/list/isUnderwater=F["isUnderwater"]
		var/list/LogPEndurance=F["LogPEndurance"]
		var/list/Destructable=F["Destructable"]
		Amount = 0
		for(var/A in Types)
			Amount+=1
			DebugAmount += 1
			var/turf/T=new A(locate(text2num(list2params(Xs.Copy(Amount,Amount+1))),text2num(list2params(Ys.Copy(Amount,Amount+1))),text2num(list2params(Zs.Copy(Amount,Amount+1)))))
			T.Health=text2num(list2params(Healths.Copy(Amount,Amount+1)))
			T.Level=text2num(list2params(Levels.Copy(Amount,Amount+1)))
			T.Builder=list2params(Builders.Copy(Amount,Amount+1))
			T.FlyOverAble=text2num(list2params(FlyOver.Copy(Amount,Amount+1)))
			T.isOutside=text2num(list2params(isOutside.Copy(Amount,Amount+1)))
			T.isUnderwater=text2num(list2params(isUnderwater.Copy(Amount,Amount+1)))
			T.LogPEndurance=text2num(list2params(LogPEndurance.Copy(Amount,Amount+1)))
			T.Destructable=text2num(list2params(Destructable.Copy(Amount,Amount+1)))
			if(istype(T,/turf/Special/EventStars))
				T.icon_state="[rand(1,2500)]"
			Turfs+=T // Turfs is the global list for all objects placed by players.
			if(T.Builder)
				if(T.isOutside)
					switch(T.z)
						if(2)
							new/area/Outside/Planet/Earth(T)
						if(999)
							new/area/Outside/Planet/Namek(T)
//						if(3)
//							new/area/Outside/Planet/Vegeta(T)
						if(4)
							new/area/Outside/Planet/Ice(T)
						if(3)
							new/area/Outside/Planet/Arconia(T)
//						if(2)
//							new/area/Outside/Planet/Heaven(T)
						if(9)
							new/area/Outside/Planet/AlienOcean(T)
						if(8)
							new/area/Outside/Planet/Afterlife(T)
						if(12)
							if(T.isUnderwater)
								new/area/Outside/Planet/AlienOcean/AOUnderwater(T)
							else
								new/area/Outside/Planet/AlienOcean/AOUnderground(T)
						if(4)
							if(T.isUnderwater)
								new/area/Outside/Planet/Earth/Underwater(T)
							else
								new/area/Outside/Planet/Earth/EarthUnderground(T)
						if(15)
							if(T.isUnderwater)
								new/area/Outside/Planet/Earth/Underwater(T)
							else
								new/area/Outside/Planet/Earth/EarthUnderground(T)
						if(18)
							new/area/Outside/Planet/Sanctuary(T)
						if(20)
							if(T.isUnderwater)
								new/area/Outside/Planet/Sanctuary/SanctuaryUnderwater(T)
							else
								new/area/Outside/Planet/Sanctuary/SanctuaryUnderground(T)
//						if(5)
//							if(T.isUnderwater)
//								new/area/Outside/Planet/Vegeta/VegetaUnderwater(T)
//							else
//								new/area/Outside/Planet/Vegeta/VegetaUnderground(T)
						if(23)
							if(T.isUnderwater)
								new/area/Outside/Planet/Namek/NamekUnderwater(T)
							else
								new/area/Outside/Planet/Namek/NamekUnderground(T)
						if(24)
							if(T.isUnderwater)
								new/area/Outside/Planet/Ice/IceUnderwater(T)
							else
								new/area/Outside/Planet/Ice/IceUnderground(T)
						if(5)
							if(T.isUnderwater)
								new/area/Outside/Planet/Arconia/ArconiaUnderwater(T)
							else
								new/area/Outside/Planet/Arconia/ArconiaUnderground(T)
						else
							new/area/Outside(T)
				else
					new/area/Inside(T)

			for(var/obj/Turfs/Edges/B in T) if(!B.Builder) del(B)
			for(var/obj/Turfs/Surf/B in T) if(!B.Builder) del(B)
			for(var/obj/Turfs/Trees/B in T) if(!B.Builder) del(B)
			for(var/obj/Turfs/B in T) if(!B.Builder) del(B)

			if(Amount == 20000)
				sleep(1)
				break

		if(Amount == 20000)
			E ++
			goto load

		end
		world<<"<small>Server: Map Loaded ([DebugAmount] in [E] Files.)"
//	spawn()SpawnMaterial()





var/list/Builds=new // Builds is a list used to display icons in the buildpanel for players. This is NOT the things they have already built!
var/list/AdminBuilds=new //This is for /turf/Special, which is (normally) admin accessable only.
proc/Add_Builds()
	for(var/A in typesof(/turf))
		var/turf/C=new A(locate(1,1,1))
		if(C.Buildable&&C.type!=/turf)
			if(!istype(C,/turf/IconsX))
				var/obj/Others/Build/B=new
				B.icon=C.icon
				B.icon_state=C.icon_state
				B.Creates=C.type
				B.name="-[C.name]-"
				Builds+=B
		del(C)
	for(var/A in typesof(/obj/Turfs))
		var/obj/B=new A
		if(B.Buildable&&B.type!=/obj/Turfs)
			if(!istype(B,/obj/Turfs/IconsX)&&!istype(B,/obj/Turfs/IconsXLBig))
				var/obj/Others/Build/C=new
				C.icon=B.icon
				C.icon_state=B.icon_state
				C.Creates=B.type
				C.name="-[B.name]-"
				Builds+=C
	for(var/A in typesof(/turf/Special))
		var/turf/C=new A(locate(1,1,1))
		if(C.type!=/turf/Special)
			var/obj/Others/Build/B=new
			B.icon=C.icon
			B.icon_state=C.icon_state
			B.Creates=C.type
			B.name="-[C.name]-"
			AdminBuilds+=B
	for(var/A in typesof(/obj/Special))
		var/obj/B=new A
		if(B.type!=/obj/Special)
			var/obj/Others/Build/C=new
			C.icon=B.icon
			C.icon_state=B.icon_state
			C.Creates=B.type
			C.name="-[B.name]-"
			AdminBuilds+=C
var/list/Builds2=new
proc/Add_Builds2()
	for(var/A in typesof(/turf))
		var/turf/C=new A(locate(1,1,1))
		if(C.Buildable&&C.type!=/turf)
			if(istype(C,/turf/IconsX))
				var/obj/Others/Build/B=new
				B.icon=C.icon
				B.icon_state=C.icon_state
				B.Creates=C.type
				B.name="-[C.name]-"
				Builds+=B
		del(C)
	for(var/A in typesof(/obj/Turfs))
		var/obj/B=new A
		if(B.Buildable&&B.type!=/obj/Turfs)
			if(istype(B,/obj/Turfs/IconsX)||istype(B,/obj/Turfs/IconsXLBig))
				var/obj/Others/Build/C=new
				C.icon=B.icon
				C.icon_state=B.icon_state
				C.Creates=B.type
				C.name="-[B.name]-"
				Builds+=C
	/*
	for(var/A in typesof(/obj/Turfs/Trees))
		var/obj/B=new A
		if(B.Buildable&&B.type!=/obj/Turfs/Trees)
			var/obj/Others/Build/C=new
			C.icon=B.icon
			C.icon_state=B.icon_state
			C.Creates=B.type
			C.name="[B.name]-B"
			Builds+=C
	for(var/A in typesof(/obj/Turfs/Edges))
		var/obj/B=new A
		if(B.Buildable&&B.type!=/obj/Turfs/Trees)
			var/obj/Others/Build/C=new
			C.icon=B.icon
			C.icon_state=B.icon_state
			C.Creates=B.type
			C.name="[B.name]-B"
			Builds+=C
	for(var/A in typesof(/obj/Turfs/Surf))
		var/obj/B=new A
		if(B.Buildable&&B.type!=/obj/Turfs/Trees)
			var/obj/Others/Build/C=new
			C.icon=B.icon
			C.icon_state=B.icon_state
			C.Creates=B.type
			C.name="[B.name]-B"
			Builds+=C
	*/

obj/Others/Build
	var/Creates
	verb/IndoorOutdoorToggle()
		set src in world
		if(usr.Inside==0)
			usr.Inside=1
			usr<<"You will now build 'inside' turfs that will not be affected by weather."
		else if(usr.Inside==1)
			usr.Inside=0
			usr<<"You will now build 'outside' turfs that will be affected by weather."
	verb/ShallowToggle()
		set src in world
		if(usr.ShallowMode==0)
			usr.ShallowMode=1
			usr<<"You will now build 'shallow' water that will not drain your energy when entered."
		else if(usr.ShallowMode==1)
			usr.ShallowMode=0
			usr<<"You will now build water tiles that drain your energy when entered."
	verb/UnderwaterToggle()
		set src in world
		if(usr.UnderwaterMode==0)
			usr.UnderwaterMode=1
			usr<<"You will now build Underwater tiles if on the proper Z plane."
		else if(usr.UnderwaterMode==1)
			usr.UnderwaterMode=0
			usr<<"You will now build Underground tiles if on the proper Z plane."


	Click()
		if(!usr.BuildGiven)
			usr<<"The Build verb has yet to be enabled for you. Unlock Fly to proceed."
			return
		if(usr.AntiBuild)
			usr<<"You've been forbidden from building."
			return
		if(istype(src,/turf/IconsX/Icon59))
			return
		if(usr.Target==src)
			usr<<"You have deselected [src]"
			usr.Target=null
			return
		Build_Lay(src,usr)
		if(usr.Target!=src)
			usr.Target=src
			usr<<"You have selected [src]"

proc/Build_Lay(obj/Others/Build/O,mob/P)
	var/mob/L=P
	if(P.Control) L=P.Control
	var/atom/C=new O.Creates(locate(L.x,L.y,L.z))
	C.Builder=P.ckey
	if(istype(C,/obj/Turfs/Door))
		C.Password=input(P,"Enter a password or leave blank") as text
		if(!C) return
		if(C.Password) if(isobj(C)) C.Grabbable=0
	if(istype(C,/obj/Turfs/Sign)) C.desc=input(P,"What do you want to write on the sign?") as message
	if(istype(C,/turf/Special/EventStars))
		C.icon_state="[rand(1,2500)]"
	if(usr.TurfInvincible)
		C:Destructable=0
	else
		C:Destructable=1
	if(!isturf(C))
		C.Savable=1
		worldObjectList+=C
		if(istype(C,/obj/Turfs/CustomObj1))
			C.icon=P.CustomObj1Icon
			C.icon_state=P.CustomObj1State
			C.layer=P.CustomObj1Layer
			C.density=P.CustomObj1Density
			C.pixel_x=P.CustomObj1X
			C.pixel_y=P.CustomObj1Y

	else
		C.Savable=0
		var/turf/_turf=C
		if(istype(C,/turf/CustomTurf))
			var/turf/CustomTurf/CT=C
			C.icon=usr.CustomTurfIcon
			C.icon_state=usr.CustomTurfState
			CT.Roof=usr.CustomTurfRoof
			C.density=usr.CustomTurfDensity
			C.opacity=usr.CustomTurfOpacity
		if(usr.ShallowMode==1)
			_turf.Shallow=1
		if(usr.Inside)
			new/area/Inside(locate(L.x,L.y,L.z))
		else
			C.isOutside=1
			switch(L.z)
				if(2)
					new/area/Outside/Planet/Earth(locate(L.x,L.y,L.z))
				if(99)
					new/area/Outside/Planet/Namek(locate(L.x,L.y,L.z))
//				if(3)
//					new/area/Outside/Planet/Vegeta(locate(L.x,L.y,L.z))
				if(4)
					new/area/Outside/Planet/Ice(locate(L.x,L.y,L.z))
				if(3)
					new/area/Outside/Planet/Arconia(locate(L.x,L.y,L.z))
				if(10)
					new/area/Outside/Planet/Heaven(locate(L.x,L.y,L.z))
				if(9)
					new/area/Outside/Planet/AlienOcean(locate(L.x,L.y,L.z))
				if(8)
					new/area/Outside/Planet/Afterlife(locate(L.x,L.y,L.z))
				if(12)
					if(usr.UnderwaterMode)
						new/area/Outside/Planet/AlienOcean/AOUnderwater(locate(L.x,L.y,L.z))
						C.isUnderwater=1
					else
						new/area/Outside/Planet/AlienOcean/AOUnderground(locate(L.x,L.y,L.z))
						C.isUnderwater=0
				if(4)
					if(usr.UnderwaterMode)
						new/area/Outside/Planet/Earth/Underwater(locate(L.x,L.y,L.z))
						C.isUnderwater=1
					else
						new/area/Outside/Planet/Earth/EarthUnderground(locate(L.x,L.y,L.z))
						C.isUnderwater=0
				if(18)
					new/area/Outside/Planet/Sanctuary(locate(L.x,L.y,L.z))
				if(20)
					if(usr.UnderwaterMode)
						new/area/Outside/Planet/Sanctuary/SanctuaryUnderwater(locate(L.x,L.y,L.z))
						C.isUnderwater=1
					else
						new/area/Outside/Planet/Sanctuary/SanctuaryUnderground(locate(L.x,L.y,L.z))
						C.isUnderwater=0
//				if(5)
//					if(usr.UnderwaterMode)
//						new/area/Outside/Planet/Vegeta/VegetaUnderwater(locate(L.x,L.y,L.z))
//						C.isUnderwater=1
//					else
//						new/area/Outside/Planet/Vegeta/VegetaUnderground(locate(L.x,L.y,L.z))
//						C.isUnderwater=0
				if(23)
					if(usr.UnderwaterMode)
						new/area/Outside/Planet/Namek/NamekUnderwater(locate(L.x,L.y,L.z))
						C.isUnderwater=1
					else
						new/area/Outside/Planet/Namek/NamekUnderground(locate(L.x,L.y,L.z))
						C.isUnderwater=0
				if(24)
					if(usr.UnderwaterMode)
						new/area/Outside/Planet/Ice/IceUnderwater(locate(L.x,L.y,L.z))
						C.isUnderwater=1
					else
						new/area/Outside/Planet/Ice/IceUnderground(locate(L.x,L.y,L.z))
						C.isUnderwater=0
				if(5)
					if(usr.UnderwaterMode)
						new/area/Outside/Planet/Arconia/ArconiaUnderwater(locate(L.x,L.y,L.z))
						C.isUnderwater=1
					else
						new/area/Outside/Planet/Arconia/ArconiaUnderground(locate(L.x,L.y,L.z))
						C.isUnderwater=0
				else
					new/area/Outside(locate(L.x,L.y,L.z))
		for(var/obj/Turfs/E in C)
			if(E!=/obj/Special/Teleporter2)
				del(E)
		if(!istype(C,/turf/CustomTurf))
			Turfs+=C
		else
			CustomTurfs+=C

/*proc/Save_Objects()
	var/foundobjects=0
	var/savefile/F=new("Saves/Itemsave")
	var/list/L=new
	var/callnum = 250
	//for(var/obj/A) if(A.Savable&&A.z)
//	debuglog << "[__FILE__]:[__LINE__] Save_Objects() started"
	if(!global.worldObjectList.len)
		world<<"<small>Server: No objects to be saved. Skipping itemsave."
		return

	for(var/obj/A in global.worldObjectList)
		//if(istype(A,/obj/Items/Tech/Drill)) continue
//		if(istype(A,/obj/PlanetFlag)) continue
//		if(istype(A,/obj/Planets)) continue
/*		var/icon/I = ("[A]")
		var/w = I.Width()
		var/h = I.Height()
		if(w>=97||h>=97)
			A.icon = null*/
		if(!A.z||A.z==0) continue
		foundobjects+=1
		A.Saved_X=A.x
		A.Saved_Y=A.y
		A.Saved_Z=A.z
		L+=A
		if(foundobjects == callnum)
//			debuglog << "[__FILE__]:[__LINE__] Save_Objects() DURING FOR LOOP. Objects: ([foundobjects])"
			world<<"Sleeping 2.5 seconds before continuing item save."
			sleep(25)
			callnum+=250
/*
	world << "THE TITANIC HAS SUNK. [list2params(L)]"
	debuglog << "THE TITANIC HAS SUNK. [list2params(L)]"

	for(var/atom/_item in L)
		world << "[_item] :: [_item.name] [_item.type] ([_item.x],[_item.y],[_item.z])"
		debuglog << "[_item] :: [_item.name] [_item.type] ([_item.x],[_item.y],[_item.z])"
*/

//	debuglog << "[__FILE__]:[__LINE__] Save_Objects() BEFORE writing it to the file."
	F["SavedItems"] << L
//	debuglog << "[__FILE__]:[__LINE__] Save_Objects() AFTER writing it to the file. Objects: ([foundobjects])"
	world<<"<small>Server: Items saved ([foundobjects] Items)"

proc/Load_Objects()
	world<<"<small>Server: Loading Items..."
	var/amount=0
	if(fexists("Saves/Itemsave"))
		var/savefile/F=new("Saves/Itemsave")
		var/list/L=new
		F["SavedItems"]>>L
		for(var/obj/A in L)
			amount+=1
			A.loc=locate(A.Saved_X,A.Saved_Y,A.Saved_Z)
			global.worldObjectList+=A
	world<<"<small>Server: Items Loaded ([amount])."*/

obj/var
	Saved_X
	Saved_Y
	Saved_Z

proc/Save_Objects()
	set background = 1
	world<<"<small>Server: Saving Objects..."
	var/Amount=0
	var/E=1
	var/savefile/F=new("Saves/Itemsave/File[E]")
	var/list/Types=new
	for(var/obj/A in global.worldObjectList) if(A.Savable&&A.z)
		A.Saved_X=A.x
		A.Saved_Y=A.y
		A.Saved_Z=A.z
		Types+=A
		Amount+=1
		if(Amount % 250 == 0)
			F["Types"]<<Types
			E++
			F=new("Saves/Itemsave/File[E]")
			Types=new
	if(Amount % 250 != 0)
		F["Types"]<<Types
	hacklol
	if(fexists("Saves/Itemsave/File[E++]"))
		fdel("Saves/Itemsave/File[E++]")
		world<<"<small>Server: Objects DEBUG system check: extra objects file deleted!"
		E++
		goto hacklol
	world<<"<small>Server: Objects Saved([Amount])."

/*proc/Load_Objects()
	world<<"<small>Server: Loading Items..."
	var/amount=0
	var/objectamount=0
	var/filenum=0
//	wowza
	filenum++
	if(fexists("Saves/Itemsave/File[filenum]"))
		var/savefile/F=new("Saves/Itemsave/File[filenum]")
		var/list/L=new
		F["SavedItems"]>>L
		for(var/obj/A in L)
			amount+=1
			objectamount+=1
			A.loc=locate(A.Saved_X,A.Saved_Y,A.Saved_Z)
			if(objectamount==250)
				filenum++
				objectamount=0
//		goto wowza
	world<<"<small>Server: Items Loaded ([amount])."*/

proc/Load_Objects()
	world<<"<small>Server: Loading Items..."
	var/amount=0
	var/filenum=0
	wowza
	filenum++
	if(fexists("Saves/Itemsave/File[filenum]"))
		var/savefile/F=new("Saves/Itemsave/File[filenum]")
		var/list/L=new
		F["Types"]>>L
		for(var/obj/A in L)
			amount+=1
			A.loc=locate(A.Saved_X,A.Saved_Y,A.Saved_Z)
		goto wowza
	world<<"<small>Server: Items Loaded ([amount])."
//	spawn()SpawnMaterial()