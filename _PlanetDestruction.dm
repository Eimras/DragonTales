Effect_Handler
	var
		min_x = 1
		max_x = 1
		min_y = 1
		max_y = 1
		min_z = 1
		max_z = 1
		max_count = 10
		current_count = 0
		simul_count = 1
		effect
		turf_replace = 0
		turf_ref
		duration = 10
		spawn_delay = 0
		anti_dupe_delay = 10
		x_offset = 8
		y_offset = 5
		z_offset = 0
		void=0


	proc

		Seed()
			set background=1
			var/seed_x = (max_x-min_x)/simul_count
			var/seed_y = (max_y-min_y)/simul_count
		//	var/loc_age = 0
			var/i
			var/list/x_values = new/list()
			var/list/y_values = new/list()
			var/list/z_values = new/list()
			var/list/placetolay=new/list()
			var/list/placetolaymaster=new/list()
			for(i=min_x,i<max_x,i+=seed_x)
				x_values += round(i)
			for(i=min_y,i<max_y,i+=seed_y)
				y_values += round(i)
			z_values += max_z
			for(var/xz in x_values)
				for(var/yz in y_values)
					var/turf/tempturf=locate(xz,yz,pick(z_values))
					placetolay+=tempturf
			placetolaymaster=placetolay
			for(current_count=0,current_count<max_count,current_count+=simul_count)

				for(i=0,i<simul_count,i++)
					spawn(spawn_delay*i)
						var/obj/E =new effect
						if(istype(E,/obj/Effects/PDEffect))
							if(void)
								E.icon='PDVoid.dmi'
								E.icon_state="[rand(1,9)]"
							else
								E.icon=pick('PD1.dmi','PD2.dmi','PD3.dmi')
								if(E.icon=='PD3.dmi')
									E.pixel_x=-30
						var/turf/temploc = pick(placetolay)
						E.loc = locate(min(max(temploc.x+rand(0-x_offset,x_offset),1),500),min(max(temploc.y+rand(0-y_offset,y_offset),1),500),temploc.z+rand(0-z_offset,z_offset))
						placetolay -= temploc
						sleep(duration)
						if(turf_replace)
							var/atom/X= turf_ref
							var/buh=3
							//if(E.icon=='PD3.dmi')
							//	buh=1
							for(var/turf/Q in view(buh,E))
								if(prob(30))continue

								if(istype(X,/turf/Special/Stars))
									new turf_ref(oc=locate(Q.x,Q.y,min_z),icon_state="[rand(1,2500)]")
								else if(istype(X,/turf/Special/PDTurf))
									new turf_ref(loc=locate(Q.x,Q.y,min_z),icon_state="[rand(1,5)]")
								else
									new turf_ref(loc=locate(Q.x,Q.y,min_z))
						if(E)del E
				if(length(placetolay)<2)placetolay=placetolaymaster
				sleep(duration)



		OLDSeed()
			set background=1
			var/seed_x = (max_x-min_x)/simul_count
			var/seed_y = (max_y-min_y)/simul_count
			var/loc_age = 0
			var/list/old_locs = new/list()
			var/i
			var/list/x_values = new/list()
			var/list/y_values = new/list()
			var/list/z_values = new/list()
			for(i=min_x,i<max_x,i+=seed_x)
				x_values += round(i)
			for(i=min_y,i<max_y,i+=seed_y)
				y_values += round(i)
			z_values += max_z
			for(current_count=0,current_count<max_count,current_count+=simul_count)
				for(i=0,i<simul_count,i++)
					spawn(spawn_delay*i)
						var/obj/E =new effect
						if(istype(E,/obj/Effects/PDEffect))
							if(void)
								E.icon='PDVoid.dmi'
								E.icon_state="[rand(1,9)]"
							else
								E.icon=pick('PD1.dmi','PD2.dmi','PD3.dmi')
								if(E.icon=='PD3.dmi')
									E.pixel_x=-30
						var/turf/temploc = locate(pick(x_values),pick(y_values),pick(z_values))
						while(temploc in old_locs)
							temploc = locate(pick(x_values),pick(y_values),pick(z_values))
						E.loc = locate(min(max(temploc.x+rand(0-x_offset,x_offset),1),500),min(max(temploc.x+rand(0-y_offset,y_offset),1),500),temploc.z+rand(0-z_offset,z_offset))
						old_locs += temploc
						sleep(duration)
						if(turf_replace)
							var/atom/X= turf_ref
							var/buh=0
							if(E.icon=='PD3.dmi')
								buh=1
							for(var/turf/Q in view(buh,E))
								if(prob(30))continue

								if(istype(X,/turf/Special/Stars))
									new turf_ref(oc=locate(Q.x,Q.y,Q.z),icon_state="[rand(1,2500)]")
								else if(istype(X,/turf/Special/PDTurf))
									new turf_ref(loc=locate(Q.x,Q.y,Q.z),icon_state="[rand(1,5)]")
								else
									new turf_ref(loc=locate(Q.x,Q.y,Q.z))
						if(E)del E
				if(loc_age >= anti_dupe_delay) old_locs = new/list()
				loc_age++
				sleep(duration)



proc
	EX_EffectHandler(var/obj/Effect,totalcount,simultaneouscount,duration,minx,maxx,miny,maxy,minz,maxz,spawn_delay,dupe_delay,var/turf/Debris=null,var/voidz=0)
		var/Effect_Handler/X = new/Effect_Handler
		X.min_x = minx
		X.max_x = maxx
		X.min_y = miny
		X.max_y = maxy
		X.min_z = minz
		X.min_z = maxz
		X.effect = Effect
		X.duration = duration
		X.max_count = totalcount
		X.simul_count = simultaneouscount
		X.anti_dupe_delay = dupe_delay
		X.void=voidz
		if(Debris)
			X.turf_replace = 1
			X.turf_ref = Debris
		X.Seed()



proc/LightningFlash(var/mob/Z)
	set background=1
	if(isnum(Z))
		spawn()for(var/area/L in world)if(L.z==Z)
			sleep(0.1)
			var/blah=L.icon
			if(blah!='Lightning.dmi')
				L.icon='Lightning.dmi'
				spawn(rand(4,12))L.icon=blah
	else
		spawn()for(var/area/L in view(0,Z))
			var/blah=L.icon
			if(blah!='Lightning.dmi')
				L.icon='Lightning.dmi'
				spawn(rand(4,12))L.icon=blah

proc/VoidFlash(var/mob/Z)
	set background=1
	if(isnum(Z))
		spawn()for(var/area/L in world)if(L.z==Z)
			sleep(0.1)
			var/blah=L.icon
			if(blah!='VoidFlash.dmi')
				L.icon='VoidFlash.dmi'
				spawn(rand(4,12))L.icon=blah
	else
		spawn()for(var/area/L in view(0,Z))
			var/blah=L.icon
			if(blah!='VoidFlash.dmi')
				L.icon='VoidFlash.dmi'
				spawn(rand(4,12))L.icon=blah



proc/DestroyPlanet(var/planetZLevel)
	set background=1 // This should be shoved to the back and not hog up the queue
//	world << "DEBUG: DestroyPlanet called with Z at [planetZLevel]"
// OOH SHINY LIGHTINGZ
// EX_EffectHandler(var/obj/Effect,totalcount,
//	simultaneouscount,duration,
//	minx,maxx,
//	miny,maxy,
//	minz,maxz,
//	spawn_delay,dupe_delay,
//	var/turf/Debris=null,var/voidz=0)

	spawn(100)LightningFlash(planetZLevel)
	spawn(150) EX_EffectHandler(/obj/Effects/PDEffect,3000,50,60,1,500,1,500,planetZLevel,planetZLevel,30,1,Debris=/turf/Special/PDTurf)
	spawn(25) EX_EffectHandler(/obj/Effects/Lightning,1000,250,100,1,500,1,500,planetZLevel,planetZLevel,10,1,null)
	spawn(500) EX_EffectHandler(/obj/Effects/Tornado,5000,100,100,1,500,1,500,planetZLevel,planetZLevel,50,1,null)
	spawn(1000) EX_EffectHandler(/obj/Effects/PDEffect,5000,200,60,1,500,1,500,planetZLevel,planetZLevel,30,1,Debris=/turf/Special/PDTurf)
	spawn(5000) EX_EffectHandler(/obj/Effects/PDEffect,5000,250,60,1,500,1,500,planetZLevel,planetZLevel,30,1,Debris=/turf/Special/Stars)

// Spawn a bunch of eartquak effects for the players on the z level at regular intervals
	spawn(50) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(10)
	spawn(250) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(30)
	spawn(750) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(50)
	spawn(1050) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(60)
	spawn(1550) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(70)
	spawn(2000) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(80)
	spawn(2500) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(100)
	spawn(3000) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(120)
	spawn(4000) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(140)
	spawn(4500) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(150)
	spawn(5000) for(var/mob/Players/M) if(M.z==planetZLevel) M.PDQuake(200)

	spawn(10)for(var/area/L in block(locate(1,1,planetZLevel),locate(world.maxx,world.maxy,planetZLevel)) )
		//if(L.z==planetZLevel) // already checking it using block :D
		L.icon='RisingRocks.dmi'
		L.WeatherOn=0
	spawn(6000)
		RemovePlanet(planetZLevel)
		for(var/obj/Items/T in block(locate(1,1,planetZLevel),locate(world.maxx,world.maxy,planetZLevel)))
			del(T)
		for(var/obj/Special/SpawnPoint/SP in block(locate(1,1,planetZLevel),locate(world.maxx,world.maxy,planetZLevel)))
			del(SP)



//	EX_EffectHandler(/obj/Effects/PDEffect,totalcount=100,simultaneouscount=10,duration=100,minx=1,maxx=100,miny=1,maxy=100,minz=Z,maxz=Z,random=1,spawn_delay=15,dupe_delay=1,/turf/Special/Stars)



//var/obj/Effect,totalcount,simultaneouscount,duration,minx,maxx,miny,maxy,minz,maxz,spawn_delay,dupe_delay,var/turf/Debris=null,var/voidz=0
proc/VoidPlanet(var/Z,var/mob/qqq)
	spawn(100)
		VoidFlash(Z)
		EX_EffectHandler(/obj/Effects/PDEffect,3000,20,60,1,500,1,500,Z,Z,15,1,Debris=/turf/Special/Static,voidz=1)
	spawn(1000)
		VoidFlash(Z)
		EX_EffectHandler(/obj/Effects/PDEffect,3000,40,50,1,500,1,500,Z,Z,5,1,Debris=/turf/Special/Static,voidz=1)
	spawn(2000)
		VoidFlash(Z)
		EX_EffectHandler(/obj/Effects/PDEffect,3000,60,40,1,500,1,500,Z,Z,15,1,Debris=/turf/Special/Static,voidz=1)
	spawn(2500)
		VoidFlash(Z)
	spawn(3000)
		VoidFlash(Z)
		EX_EffectHandler(/obj/Effects/PDEffect,3000,80,30,1,500,1,500,Z,Z,15,1,Debris=/turf/Special/Static,voidz=1)
	spawn(3250)
		VoidFlash(Z)
	spawn(3500)
		VoidFlash(Z)
	spawn(3750)VoidFlash(Z)
	spawn(4000)
		VoidFlash(Z)
		EX_EffectHandler(/obj/Effects/PDEffect,3000,100,20,1,500,1,500,Z,Z,15,1,Debris=/turf/Special/Static,voidz=1)
	spawn(4200)VoidFlash(Z)
	spawn(4400)VoidFlash(Z)
	spawn(4600)VoidFlash(Z)
	spawn(4800)VoidFlash(Z)
	spawn(5000)
		VoidFlash(Z)
		EX_EffectHandler(/obj/Effects/PDEffect,3000,120,10,1,500,1,500,Z,Z,15,1,Debris=/turf/Special/Static,voidz=1)
	spawn(5100)VoidFlash(Z)
	spawn(5200)VoidFlash(Z)
	spawn(5300)VoidFlash(Z)
	spawn(5400)VoidFlash(Z)
	spawn(5500)
		VoidFlash(Z)
		EX_EffectHandler(/obj/Effects/PDEffect,3000,140,10,1,500,1,500,Z,Z,15,1,Debris=/turf/Special/Static,voidz=1)
	spawn(5600)VoidFlash(Z)
	spawn(5650)VoidFlash(Z)
	spawn(5700)VoidFlash(Z)
	spawn(5850)VoidFlash(Z)
	spawn(5900)VoidFlash(Z)
	spawn(5925)VoidFlash(Z)
	spawn(5950)VoidFlash(Z)
	spawn(5975)VoidFlash(Z)
	spawn(6000)VoidFlash(Z)

	spawn(10)for(var/area/L in world)
		if(L.z==Z)
			L.icon='Void.dmi'
			L.WeatherOn=0
	spawn(6000)
		if(qqq)
			if(qqq.BaseMod==50)
				qqq.BaseMod/=5
				qqq.Base/=5
				qqq.BaseMod+=10
				qqq.BaseMod*=5
				qqq.Base*=5
			else if(qqq.BaseMod==15)
				qqq.BaseMod/=1.5
				qqq.Base/=1.5
				qqq.BaseMod+=10
				qqq.BaseMod*=1.5
				qqq.Base*=1.5
			else
				qqq.BaseMod+=10
			qqq<<"You feel your potential for power increase significantly..."
		RemovePlanet(Z)
		for(var/obj/Items/T in world)if(T.z==Z)del(T)









mob/proc/PlanetDestroyed()
	var/blah
	if(src.z==2)
		blah="Earth"
	if(src.z==5)
		blah="Namek"
	if(src.z==3)
		blah="Vegeta"
	if(src.z==4)
		blah="Ice"
	if(src.z==7)
		blah="Arconia"
	if(src.z==18)
		blah="Sanctuary"
	if(blah)
		if(!Planets.Find(blah))
			src<<"The planet you resided on no longer exists. You are now in space."
			if(global.JinxMap)
				src.loc=locate(250, 250, 10)
			else
				src.loc=locate(250,250,6)
proc/RemovePlanet(var/Z)
	if(Z==2)
		Planets.Remove("Earth")
	if(Z==1)
		Planets.Remove("Namek")
	if(Z==3)
		Planets.Remove("Vegeta")
	if(Z==4)
		Planets.Remove("Ice")
	if(Z==5)
		Planets.Remove("Arconia")
	if(Z==18)
		Planets.Remove("Sanctuary")
	for(var/mob/Players/M in world)
		M.PlanetDestroyed()
	for(var/obj/Planets/P in world)
		if(P.Zz==Z)
			LightningFlash(12)
			del(P)

proc/RestorePlanet(var/Z)
	if(Z=="Earth")
		Planets.Add("Earth")
		var/obj/planet = text2path("/obj/Planets/Earth")
		new planet(locate(rand(1,500),rand(1,500),12))
		Log("Admin","[Z] has been successfully restored.")
	if(Z=="Namek")
		Planets.Add("Namek")
		var/obj/planet = text2path("/obj/Planets/Namek")
		new planet(locate(rand(1,500),rand(1,500),12))
		Log("Admin","[Z] has been successfully restored.")
	if(Z=="Vegeta")
		Planets.Add("Vegeta")
		var/obj/planet = text2path("/obj/Planets/Vegeta")
		new planet(locate(rand(1,500),rand(1,500),12))
		Log("Admin","[Z] has been successfully restored.")
	if(Z=="Ice")
		Planets.Add("Ice")
		var/obj/planet = text2path("/obj/Planets/Ice")
		new planet(locate(rand(1,500),rand(1,500),12))
		Log("Admin","[Z] has been successfully restored.")
	if(Z=="Arconia")
		Planets.Add("Arconia")
		var/obj/planet = text2path("/obj/Planets/Arconia")
		new planet(locate(rand(1,500),rand(1,500),12))
		Log("Admin","[Z] has been successfully restored.")

mob/proc/PDQuake(var/duration=30)
	if(src.client)
		while(duration)
			duration-=1
			src.client.pixel_x=rand(-8,8)
			src.client.pixel_y=rand(-8,8)
			sleep(1)
		if(duration<1)
			src.client.pixel_x=0
			src.client.pixel_y=0